---
date: 2020-06-22 10:51:16.874000
title: Post Mortem Incident Report - RBAC Outage  06-015-2020
---
## <span dir="ltr">Overview</span>

<span dir="ltr">On the morning of June 15th, 2020, RBAC experienced an
outage resulting from a failed deployment, affecting applications
integrated with RBAC on the platform as well as the RBAC API directly,
for approximately 30 minutes. During this time, all requests into the
RBAC API resulted in a 500 status. An estimated 50% of the
accounts/tenants/schemas in RBAC would have experienced this
issue.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">A CPU quota constraint on the production RBAC namespace
caused our deployment to fail, as there was not enough CPU quota to
handle the limits requested in our deployment config. This rolled back
the deployment to a previous state, but migrations had already been run
on \~50% of tenant schemas, causing a breaking change for those tenants
as the code was trying to reference a table which had been dropped. A
subsequent deployment after adjusting quota also failed, because
migrations run in an init container timed out due to the number of
tenants increasing to over 9,000.</span>

## <span dir="ltr">Contributing Factors</span>

<span dir="ltr">The initial failure in the deployment was due to the
fact that our resource limits and requests are likely too close to what
the namespace resource limits allow. This caused a scenario where
OpenShift though it needed more resources than were available, since we
had replicas running and consuming part of that quota. This caused quota
limit errors and ultimately failed the deployment.</span>

<span dir="ltr"></span>

<span dir="ltr">As our migrations run in an init container, in this case
a migration change was introduced before the code change to move away
from it was deployed, which caused a breaking change once the code
rolled back and the table being referenced no longer existed. Roughly
half of the tenant's schemas received this migration change, which is
what caused 500s to be observed.</span>

<span dir="ltr"></span>

<span dir="ltr">Since the number of tenants increased to over 9,000,
running migrations in an init container also caused a subsequent
deployment to fail, because the migration process took too long and the
deployment timed out. This left RBAC in a half-broken state.</span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">Ultimately we removed the init container from the
deployment config, and were able to successfully roll out the
application. After doing so, RBAC was operational. We were then able to
run migrations on all schemas from a pod directly. Since this migration
was just a utility table drop, those schemas without it applied were not
adversely affected.</span>

<span dir="ltr"></span>

<span dir="ltr">We still need to address the following:</span>

<span dir="ltr"></span>

  - > <span dir="ltr">Deal with the scale of a multi-tenant schema
    > architecture when it comes to being able to run migration changes
    > or seed changes on a growing number of schemas. This would need to
    > be done as part of a deployment. Currently the time it takes to
    > run migrations makes the process untenable.</span>

  - > <span dir="ltr">Ensure we make changes to the database which are
    > backwards compatible if at all possible, and decouple migration
    > changes from code changes to allow for them to be promoted quicker
    > and independently.</span>

  - > <span dir="ltr">We cannot easily roll back migration changes, as
    > they would also take a considerable amount of time to apply to
    > thousands of schemas.</span>

  - > <span dir="ltr">Look at RDS resource usage, as we were seeing high
    > CPU usage during migrations, which seemingly caused them to
    > progress slowly.</span>

  - > <span dir="ltr">Run migrations and seeds in parallel, which we
    > currently support but don't make use of.</span>

  - > <span dir="ltr">Manage the state of migrations and seeds across
    > schemas.</span>

  - > <span dir="ltr">Tune rollout parameters and quota limits.</span>

## <span dir="ltr">Impact</span>

*<span dir="ltr">Be specific here. Include numbers such as customers
affected, cost to business, etc.</span>*

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><span dir="ltr"></span></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Time in SEV-1</span></td>
<td><span dir="ltr">~35 minutes</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Time in SEV-2</span></td>
<td><span dir="ltr">0 Minutes</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Accounts Affected</span></td>
<td><span dir="ltr">~50% of accounts</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Users Affected</span></td>
<td><span dir="ltr">~50% of users</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Support Requests Raised</span></td>
<td><span dir="ltr">N/A</span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Timeline</span>

*<span dir="ltr">Some important times to include: (1) time the
contributing factor began, (2) time of the page, (3) time that the
status page was updated (i.e. when the incident became public), (4) time
of any significant actions, (5) time the SEV-2/1 ended, (6) links to
tools/logs that show how the timestamp was arrived at.</span>*

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Time (EST)</span></strong></th>
<th><strong><span dir="ltr">Notes</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">11:43</span></td>
<td><span dir="ltr">Initial deployment is initiated</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">11:52</span></td>
<td><span dir="ltr">Initial RBAC deployment fails</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">11:55</span></td>
<td><span dir="ltr">Quota issue identified as the cause of failure</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">12:03</span></td>
<td><span dir="ltr">Quota issue is resolved and secondary deployment is initiated</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">12:15</span></td>
<td><span dir="ltr">Secondary deployment fails due to migrations timing out</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">12:25</span></td>
<td><span dir="ltr">Init container is removed and a new rollout is initiated</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">12:27</span></td>
<td><span dir="ltr">Service is restored</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">12:30</span></td>
<td><span dir="ltr">The process of running migrations and seeds are resumed, independently</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">How’d We Do?</span>

### <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you did well and want to call out. It's
OK to not list anything.</span>*

  - > <span dir="ltr">Very quick turnaround and resolution of issue
    > (\~30 minutes)</span>

  - > <span dir="ltr">Dev collaboration</span>

### <span dir="ltr">What didn’t go so well?</span>

*<span dir="ltr">List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.</span>*

<span dir="ltr"></span>

  - > <span dir="ltr">Communication - we should have notified users as
    > soon as upgrade failed, given the importance of RBAC</span>

  - > <span dir="ltr">No pagerduty alerts were sent</span>

> <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Action Items</span>

<span dir="ltr">*Each action item should be in the form of a JIRA
ticket, and each ticket should have the same set of two tags:
“sev1\_YYYYMMDD” (such as sev1\_20150911) and simply “sev1”. Include
action items such as: (1) any fixes required to prevent the contributing
factor in the future, (2) any preparedness tasks that could help
mitigate the problem if it came up again, (3) remaining post-mortem
steps, such as the internal email, as well as the status-page public
post, (4) any improvements to our incident response process.*</span>

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Action Item</span></strong></th>
<th><strong><span dir="ltr">Status</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Create Pager Duty Alerts for RBAC</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7192"><span class="underline">RHCLOUD-7192</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Create Pager Duty runbook for RBAC</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7203"><span class="underline">RHCLOUD-7203</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Run seeding and migrations concurrently by default</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7195"><span class="underline">RHCLOUD-7195</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Tune RBAC rollout params to ensure we stay under quota</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7196"><span class="underline">RHCLOUD-7196</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Run RBAC migrations independent of the code/deployments</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7198"><span class="underline">RHCLOUD-7198</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Manage stage of migrations and seeds for tenants</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7199"><span class="underline">RHCLOUD-7199</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Less verbose RBAC migration/seeding output</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7200">RHCLOUD-7200</a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Do not create RBAC tenant schema on GET requests</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7201"><span class="underline">RHCLOUD-7201</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Add Sentry Logging to Infrastructure Services</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7071"><span class="underline">RHCLOUD-7071</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Add more metrics and alerts for health of RBAC</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6604"><span class="underline">RHCLOUD-6604</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

## <span dir="ltr">Messaging</span>

### <span dir="ltr">Internal Email</span>

*<span dir="ltr">This is a follow-up for employees. It should be sent
out right after the post-mortem meeting is over. It only needs a short
paragraph summarizing the incident and a link to this wiki page.</span>*

<span dir="ltr"></span>

<span dir="ltr"></span>

### <span dir="ltr">External Email</span>

*<span dir="ltr">This is what will be included on the status.redhat.com
website regarding this incident. What are we telling customers,
including an apology? (The apology should be genuine, not rote.)</span>*

<span dir="ltr"></span>
