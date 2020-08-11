---
date: 2020-07-15 07:30:07.836000
title: Post Mortem Incident Report - Inventory Outage (07-Jul-2020)
---
## Overview

On July 7th 2020 the Inventory service was down from 9:05 AM EST to 9:57
AM EST after a deployment to production failed and got stuck in a crash
loop.

## What Happened

On July 7th 2020 around 9:00 AM EST an inventory production release was
being prepared. The goal was to promote
[RHCLOUD-4283](https://projects.engineering.redhat.com/browse/RHCLOUD-4283)
to production.

The fix required that the [code
change](https://github.com/RedHatInsights/insights-host-inventory/commit/f7e099aad39078f5a22e3c41634bba5b78b0c8b8)
is made together with a [deployment configuration
change](https://github.com/RedHatInsights/e2e-deploy/pull/1902). The
plan was therefore to apply the configuration change, quickly followed
by the release of the new image.

At 9:02 a [Jenkins job was
run](https://jenkins-jenkins.5a9f.insights-dev.openshiftapps.com/job/ops/job/deployInventory/)
to update deployment configuration in prod. At 9:04 the image was
promoted to production.

Afterwards, inventory components started failing [due to access
error](http://pastebin.test.redhat.com/882375). More specifically:

  - > a new insights-inventory deployment was rolled out and started
    > crashlooping

  - > a new inventory-mq-p1 deployment was rolled out. The mid hook (db
    > migration) failed causing the deployment to be rolled-back to the
    > previous known configuration. The P1 then continued working
    > throughout the entire time of the incident.

  - > a new inventory-mq-pmin deployment was rolled out and started
    > crashlooping

Under normal circumstances an outage of this size would cause multiple
Slack notifications immediately. However, none were received as the
Slack integration [was not
functional](https://ansible.slack.com/archives/CCBUJ0HAR/p1594128056497800).

The problem was identified to be caused by a misconfiguration of the
cloudwatch secret, more specifically the *log\_group\_name* key which
had been changed from **platform** to **platform-dev**.

The fact that the credentials contained within the secret did not allow
log messages to be written to the **platform-dev** log group caused the
access exception that prevented inventory components from running.

The secret had been misconfigured some time between the July 1 9:59 AM
EST and the incident. **It was not possible to determine who, when and
why made the change to the cloudwatch secret.**

Note that in the process of fixing the misconfigured key a trailing
newline was introduced by Jozef Hartinger when changing the value from
*platform-dev* to *platform*. This was noticed by Kyle Lape and fixed.
The trailing newline was mistakenly identified as the cause of the
outage in the initial version of this document.

## Contributing Factors

  - > [Prometheus slack alerts did not
    > work](https://ansible.slack.com/archives/CCBUJ0HAR/p1594128056497800),
    > but luckily Inventory dev were watching prometheus alerts
    > directly.
    
      - > While investigating this, we discovered that all dev slack
        > alerts were accidentally silenced

  - > Inventory deployment configuration was not current as it had been
    > [partially reverted
    > accidentally](https://github.com/RedHatInsights/e2e-deploy/pull/1908#pullrequestreview-443945034)

  - > We were trying to release changes to fix a logging bug with
    > Cloudwatch and the Cloudwatch secret had changed. These 2 changes
    > were unrelated, but causing confusion since they both involved
    > Cloudwatch.

## Resolution

1.  > Fixed the misconfigured log\_group\_name key.

2.  > Troubleshoot and remove the issue that was causing alerts to slack
    > to not fire.

3.  > Fix the e2e deploy templates that were partially reverted

## Impact

  - > The inventory REST interface was returning 502 errors.

  - > P1 message consumer remained operational during the entire outage.

  - > PMIN message consumer stopped consuming messages. The consumer lag
    > reached 5650 messages during the outage

  - > The inventory GraphQL interface remained operational

*Example template*

<table>
<tbody>
<tr class="odd">
<td>Time in SEV-2</td>
<td>~60min</td>
</tr>
<tr class="even">
<td>Notifications Delivered out of SLA</td>
<td>??% (?? of ??)</td>
</tr>
<tr class="odd">
<td>Events Dropped / Not Accepted</td>
<td>??% (?? of ??) Should usually be 0, but always check</td>
</tr>
<tr class="even">
<td>Accounts Affected</td>
<td>all</td>
</tr>
<tr class="odd">
<td>Users Affected</td>
<td>all</td>
</tr>
<tr class="even">
<td>Support Requests Raised</td>
<td>None</td>
</tr>
</tbody>
</table>

## Timeline

<table>
<thead>
<tr class="header">
<th><strong>Time (EST)</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>9:02 AM</td>
<td>Inventory deployment configuration updated (triggering deployment rollout)</td>
</tr>
<tr class="even">
<td>9:04 AM</td>
<td>New image promoted to production</td>
</tr>
<tr class="odd">
<td>9:05 AM</td>
<td>Inventory service degradation begun</td>
</tr>
<tr class="even">
<td>9:15 AM</td>
<td><strong>Outage officially began:</strong> We noticed that Inventory pods were crash looping and prometheus alerts were not being sent to slack</td>
</tr>
<tr class="odd">
<td>9:20 AM</td>
<td><a href="https://ansible.slack.com/archives/CCBUJ0HAR/p1594128056497800"><span class="underline">Prometheus problems reported</span></a></td>
</tr>
<tr class="even">
<td>9:26 AM</td>
<td>Posted outage to #cloudservices-outage channel</td>
</tr>
<tr class="odd">
<td>9:28 AM</td>
<td>Inventory API operation restored by overriding the cloudwatch configuration manually. Investigation continues.</td>
</tr>
<tr class="even">
<td>9:40 AM</td>
<td>The cloudwatch secret log_group_name key is fixed. (In two phases due to stray newline introduced in the first attempt)</td>
</tr>
<tr class="odd">
<td>9:57 AM</td>
<td>Remaining components (PMIN consumer) resume normal operation</td>
</tr>
<tr class="even">
<td>9:58 AM</td>
<td>PMIN consumer finished processing all the low priority messages that were accumulated during the outage</td>
</tr>
<tr class="odd">
<td>10:25 AM</td>
<td><strong>Outage officially resolved</strong></td>
</tr>
<tr class="even">
<td>1:32 PM</td>
<td>Sent outage notification email</td>
</tr>
<tr class="odd">
<td>1:34 PM</td>
<td>RCA’d the <a href="https://prometheus-am-mnm-ci.5a9f.insights-dev.openshiftapps.com/#/silences/b66971e1-f407-46b3-8cdb-c9a2557d417b"><span class="underline">issue</span></a> that was causing the slack alerts to be silenced</td>
</tr>
<tr class="even">
<td></td>
<td></td>
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

## How’d We Do?

### What went well?

*List anything you did well and want to call out. It's OK to not list
anything.*

  - > P1 consumer was automatically reverted to previous known
    > configuration and continued working

  - > The GraphQL interface remained operational throughout the entire
    > outage - applications using this interface (e.g. Remediations)
    > were not affected.

  - > Kyle Lape noticed a stray newline in the first attempted fix which
    > helped the resolution
    
      - > Also Kyle (and Ben) was a big help in figuring out why slack
        > alerts were busted

### What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

  - > Prometheus slack alerts did not work

  - > Inventory deployment configuration was not current as it had been
    > [partially reverted
    > accidentally](https://github.com/RedHatInsights/e2e-deploy/pull/1908#pullrequestreview-443945034)

  - > Affected inventory components did not automatically roll back

  - > No audit trail - unclear how the secret got misconfigured (should
    > get resolved in a post AppSRE world)

  - > Jenkins job execution history already lost at the time of
    > investigation of this incident due to low retention setting

## Action Items

<table>
<thead>
<tr class="header">
<th><strong>Action Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Share the love with the entire org</td>
<td></td>
</tr>
<tr class="even">
<td>TBD</td>
<td></td>
</tr>
<tr class="odd">
<td><a href="https://github.com/RedHatInsights/e2e-deploy/pull/1908#pullrequestreview-443945034"><span class="underline">Fix e2e-deploy configuration</span></a></td>
<td>Done</td>
</tr>
<tr class="even">
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7736"><span class="underline">Verify that a misconfigured deployment is rolled back</span></a></td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7736"><span class="underline">RHCLOUD-7736</span></a></td>
</tr>
<tr class="odd">
<td>Add more alerting to check alertmanager (check metrics and add monitoring)</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHIOPS-839"><span class="underline">RHIOPS-839</span></a></td>
</tr>
<tr class="even">
<td>Increase Jenkins retention history</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7757"><span class="underline">RHCLOUD-7757</span></a></td>
</tr>
<tr class="odd">
<td>Continue to educate all Inventory devs on how to troubleshoot / resolve production issues like this</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7760"><span class="underline">RHCLOUD-7760</span></a></td>
</tr>
<tr class="even">
<td>Alert just to verify alerts are working</td>
<td>RHCLOUD-7893</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
</tbody>
</table>

## Messaging

### Internal Email

All,

We had an outage with the Inventory service from ~9:20 AM EDT - 10:25 AM
EDT. During this time the REST APIs, mainly used by the [Inventory
UI](https://cloud.redhat.com/insights/inventory/), were down and hosts
ingress messages would have paused their processing.

We confirmed that Inventory is back up and operational, but please let
us know if you have any questions or are still experiencing issues.

### External Email

*None*
