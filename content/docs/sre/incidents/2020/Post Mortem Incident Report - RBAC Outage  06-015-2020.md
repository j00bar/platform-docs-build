---
date: 2020-06-22 14:51:16.874000
title: Post Mortem Incident Report - RBAC Outage  06-015-2020
---
## Overview

On the morning of June 15th, 2020, RBAC experienced an outage resulting
from a failed deployment, affecting applications integrated with RBAC on
the platform as well as the RBAC API directly, for approximately 30
minutes. During this time, all requests into the RBAC API resulted in a
500 status. An estimated 50% of the accounts/tenants/schemas in RBAC
would have experienced this issue.

## What Happened

A CPU quota constraint on the production RBAC namespace caused our
deployment to fail, as there was not enough CPU quota to handle the
limits requested in our deployment config. This rolled back the
deployment to a previous state, but migrations had already been run on
~50% of tenant schemas, causing a breaking change for those tenants as
the code was trying to reference a table which had been dropped. A
subsequent deployment after adjusting quota also failed, because
migrations run in an init container timed out due to the number of
tenants increasing to over 9,000.

## Contributing Factors

The initial failure in the deployment was due to the fact that our
resource limits and requests are likely too close to what the namespace
resource limits allow. This caused a scenario where OpenShift though it
needed more resources than were available, since we had replicas running
and consuming part of that quota. This caused quota limit errors and
ultimately failed the deployment.

As our migrations run in an init container, in this case a migration
change was introduced before the code change to move away from it was
deployed, which caused a breaking change once the code rolled back and
the table being referenced no longer existed. Roughly half of the
tenant's schemas received this migration change, which is what caused
500s to be observed.

Since the number of tenants increased to over 9,000, running migrations
in an init container also caused a subsequent deployment to fail,
because the migration process took too long and the deployment timed
out. This left RBAC in a half-broken state.

## Resolution

Ultimately we removed the init container from the deployment config, and
were able to successfully roll out the application. After doing so, RBAC
was operational. We were then able to run migrations on all schemas from
a pod directly. Since this migration was just a utility table drop,
those schemas without it applied were not adversely affected.

We still need to address the following:

  - > Deal with the scale of a multi-tenant schema architecture when it
    > comes to being able to run migration changes or seed changes on a
    > growing number of schemas. This would need to be done as part of a
    > deployment. Currently the time it takes to run migrations makes
    > the process untenable.

  - > Ensure we make changes to the database which are backwards
    > compatible if at all possible, and decouple migration changes from
    > code changes to allow for them to be promoted quicker and
    > independently.

  - > We cannot easily roll back migration changes, as they would also
    > take a considerable amount of time to apply to thousands of
    > schemas.

  - > Look at RDS resource usage, as we were seeing high CPU usage
    > during migrations, which seemingly caused them to progress slowly.

  - > Run migrations and seeds in parallel, which we currently support
    > but don't make use of.

  - > Manage the state of migrations and seeds across schemas.

  - > Tune rollout parameters and quota limits.

## Impact

*Be specific here. Include numbers such as customers affected, cost to
business, etc.*

<table>
<tbody>
<tr class="odd">
<td>Time in SEV-1</td>
<td>~35 minutes</td>
</tr>
<tr class="even">
<td>Time in SEV-2</td>
<td>0 Minutes</td>
</tr>
<tr class="odd">
<td>Accounts Affected</td>
<td>~50% of accounts</td>
</tr>
<tr class="even">
<td>Users Affected</td>
<td>~50% of users</td>
</tr>
<tr class="odd">
<td>Support Requests Raised</td>
<td>N/A</td>
</tr>
</tbody>
</table>

## Timeline

*Some important times to include: (1) time the contributing factor
began, (2) time of the page, (3) time that the status page was updated
(i.e. when the incident became public), (4) time of any significant
actions, (5) time the SEV-2/1 ended, (6) links to tools/logs that show
how the timestamp was arrived at.*

<table>
<thead>
<tr class="header">
<th><strong>Time (EST)</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>11:43</td>
<td>Initial deployment is initiated</td>
</tr>
<tr class="even">
<td>11:52</td>
<td>Initial RBAC deployment fails</td>
</tr>
<tr class="odd">
<td>11:55</td>
<td>Quota issue identified as the cause of failure</td>
</tr>
<tr class="even">
<td>12:03</td>
<td>Quota issue is resolved and secondary deployment is initiated</td>
</tr>
<tr class="odd">
<td>12:15</td>
<td>Secondary deployment fails due to migrations timing out</td>
</tr>
<tr class="even">
<td>12:25</td>
<td>Init container is removed and a new rollout is initiated</td>
</tr>
<tr class="odd">
<td>12:27</td>
<td>Service is restored</td>
</tr>
<tr class="even">
<td>12:30</td>
<td>The process of running migrations and seeds are resumed, independently</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
</tbody>
</table>

## How’d We Do?

### What went well?

*List anything you did well and want to call out. It's OK to not list
anything.*

  - > Very quick turnaround and resolution of issue (~30 minutes)

  - > Dev collaboration

### What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

  - > Communication - we should have notified users as soon as upgrade
    > failed, given the importance of RBAC

  - > No pagerduty alerts were sent

## Action Items

*Each action item should be in the form of a JIRA ticket, and each
ticket should have the same set of two tags: “sev1\_YYYYMMDD” (such as
sev1\_20150911) and simply “sev1”. Include action items such as: (1) any
fixes required to prevent the contributing factor in the future, (2) any
preparedness tasks that could help mitigate the problem if it came up
again, (3) remaining post-mortem steps, such as the internal email, as
well as the status-page public post, (4) any improvements to our
incident response process.*

<table>
<thead>
<tr class="header">
<th><strong>Action Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Create Pager Duty Alerts for RBAC</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7192"><span class="underline">RHCLOUD-7192</span></a></td>
</tr>
<tr class="even">
<td>Create Pager Duty runbook for RBAC</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7203"><span class="underline">RHCLOUD-7203</span></a></td>
</tr>
<tr class="odd">
<td>Run seeding and migrations concurrently by default</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7195"><span class="underline">RHCLOUD-7195</span></a></td>
</tr>
<tr class="even">
<td>Tune RBAC rollout params to ensure we stay under quota</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7196"><span class="underline">RHCLOUD-7196</span></a></td>
</tr>
<tr class="odd">
<td>Run RBAC migrations independent of the code/deployments</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7198"><span class="underline">RHCLOUD-7198</span></a></td>
</tr>
<tr class="even">
<td>Manage stage of migrations and seeds for tenants</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7199"><span class="underline">RHCLOUD-7199</span></a></td>
</tr>
<tr class="odd">
<td>Less verbose RBAC migration/seeding output</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7200">RHCLOUD-7200</a></td>
</tr>
<tr class="even">
<td>Do not create RBAC tenant schema on GET requests</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7201"><span class="underline">RHCLOUD-7201</span></a></td>
</tr>
<tr class="odd">
<td>Add Sentry Logging to Infrastructure Services</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7071"><span class="underline">RHCLOUD-7071</span></a></td>
</tr>
<tr class="even">
<td>Add more metrics and alerts for health of RBAC</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6604"><span class="underline">RHCLOUD-6604</span></a></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
</tbody>
</table>

## Messaging

### Internal Email

*This is a follow-up for employees. It should be sent out right after
the post-mortem meeting is over. It only needs a short paragraph
summarizing the incident and a link to this wiki page.*

### External Email

*This is what will be included on the status.redhat.com website
regarding this incident. What are we telling customers, including an
apology? (The apology should be genuine, not rote.)*
