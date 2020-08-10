---
date: 2020-07-15 03:30:07.836000
title: Post Mortem Incident Report - Inventory Outage (07-Jul-2020)
---
## <span dir="ltr">Overview</span>

<span dir="ltr">On July 7th 2020 the Inventory service was down from
9:05 AM EST to 9:57 AM EST after a deployment to production failed and
got stuck in a crash loop.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">On July 7th 2020 around 9:00 AM EST an inventory
production release was being prepared. The goal was to promote
[<span class="underline">RHCLOUD-4283</span>](https://projects.engineering.redhat.com/browse/RHCLOUD-4283)
to production.</span>

<span dir="ltr"></span>

<span dir="ltr">The fix required that the [<span class="underline">code
change</span>](https://github.com/RedHatInsights/insights-host-inventory/commit/f7e099aad39078f5a22e3c41634bba5b78b0c8b8)
is made together with a [<span class="underline">deployment
configuration
change</span>](https://github.com/RedHatInsights/e2e-deploy/pull/1902).
The plan was therefore to apply the configuration change, quickly
followed by the release of the new image.</span>

<span dir="ltr"></span>

<span dir="ltr">At 9:02 a [<span class="underline">Jenkins job was
run</span>](https://jenkins-jenkins.5a9f.insights-dev.openshiftapps.com/job/ops/job/deployInventory/)
to update deployment configuration in prod. At 9:04 the image was
promoted to production.</span>

<span dir="ltr"></span>

<span dir="ltr">Afterwards, inventory components started failing
[<span class="underline">due to access
error</span>](http://pastebin.test.redhat.com/882375). More
specifically:</span>

  - > <span dir="ltr">a new insights-inventory deployment was rolled out
    > and started crashlooping</span>

  - > <span dir="ltr">a new inventory-mq-p1 deployment was rolled out.
    > The mid hook (db migration) failed causing the deployment to be
    > rolled-back to the previous known configuration. The P1 then
    > continued working throughout the entire time of the
    > incident.</span>

  - > <span dir="ltr">a new inventory-mq-pmin deployment was rolled out
    > and started crashlooping</span>

<span dir="ltr"></span>

<span dir="ltr">Under normal circumstances an outage of this size would
cause multiple Slack notifications immediately. However, none were
received as the Slack integration [<span class="underline">was not
functional</span>](https://ansible.slack.com/archives/CCBUJ0HAR/p1594128056497800).</span>

<span dir="ltr"></span>

<span dir="ltr">The problem was identified to be caused by a
misconfiguration of the cloudwatch secret, more specifically the
*log\_group\_name* key which had been changed from **platform** to
**platform-dev**.</span>

<span dir="ltr">The fact that the credentials contained within the
secret did not allow log messages to be written to the **platform-dev**
log group caused the access exception that prevented inventory
components from running.</span>

<span dir="ltr"></span>

<span dir="ltr">The secret had been misconfigured some time between the
July 1 9:59 AM EST and the incident. **It was not possible to determine
who, when and why made the change to the cloudwatch secret.**</span>

<span dir="ltr"></span>

<span dir="ltr">Note that in the process of fixing the misconfigured key
a trailing newline was introduced by Jozef Hartinger when changing the
value from *platform-dev* to *platform*. This was noticed by Kyle Lape
and fixed. The trailing newline was mistakenly identified as the cause
of the outage in the initial version of this document.</span>

## <span dir="ltr">Contributing Factors</span>

  - > <span dir="ltr">[<span class="underline">Prometheus slack alerts
    > did not
    > work</span>](https://ansible.slack.com/archives/CCBUJ0HAR/p1594128056497800),
    > but luckily Inventory dev were watching prometheus alerts
    > directly.</span>
    
      - > <span dir="ltr">While investigating this, we discovered that
        > all dev slack alerts were accidentally silenced</span>

  - > <span dir="ltr">Inventory deployment configuration was not current
    > as it had been [<span class="underline">partially reverted
    > accidentally</span>](https://github.com/RedHatInsights/e2e-deploy/pull/1908#pullrequestreview-443945034)</span>

  - > <span dir="ltr">We were trying to release changes to fix a logging
    > bug with Cloudwatch and the Cloudwatch secret had changed. These 2
    > changes were unrelated, but causing confusion since they both
    > involved Cloudwatch.</span>

## <span dir="ltr">Resolution</span>

1.  > <span dir="ltr">Fixed the misconfigured log\_group\_name
    > key.</span>

2.  > <span dir="ltr">Troubleshoot and remove the issue that was causing
    > alerts to slack to not fire.</span>

3.  > <span dir="ltr">Fix the e2e deploy templates that were partially
    > reverted</span>

## <span dir="ltr">Impact</span>

  - > <span dir="ltr">The inventory REST interface was returning 502
    > errors.</span>

  - > <span dir="ltr">P1 message consumer remained operational during
    > the entire outage.</span>

  - > <span dir="ltr">PMIN message consumer stopped consuming messages.
    > The consumer lag reached 5650 messages during the outage</span>

  - > <span dir="ltr">The inventory GraphQL interface remained
    > operational</span>

<span dir="ltr"></span>

*<span dir="ltr">Example template</span>*

<table>
<thead>
<tr class="header">
<th><span dir="ltr"></span></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Time in SEV-2</span></td>
<td><span dir="ltr">~60min</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Notifications Delivered out of SLA</span></td>
<td><span dir="ltr">??% (?? of ??)</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Events Dropped / Not Accepted</span></td>
<td><span dir="ltr">??% (?? of ??) Should usually be 0, but always check</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Accounts Affected</span></td>
<td><span dir="ltr">all</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Users Affected</span></td>
<td><span dir="ltr">all</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Support Requests Raised</span></td>
<td><span dir="ltr">None</span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Timeline</span>

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
<td><span dir="ltr">9:02 AM</span></td>
<td><span dir="ltr">Inventory deployment configuration updated (triggering deployment rollout)</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:04 AM</span></td>
<td><span dir="ltr">New image promoted to production</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:05 AM</span></td>
<td><span dir="ltr">Inventory service degradation begun</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:15 AM</span></td>
<td><span dir="ltr"><strong>Outage officially began:</strong> We noticed that Inventory pods were crash looping and prometheus alerts were not being sent to slack</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:20 AM</span></td>
<td><span dir="ltr"><a href="https://ansible.slack.com/archives/CCBUJ0HAR/p1594128056497800"><span class="underline">Prometheus problems reported</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:26 AM</span></td>
<td><span dir="ltr">Posted outage to #cloudservices-outage channel</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:28 AM</span></td>
<td><span dir="ltr">Inventory API operation restored by overriding the cloudwatch configuration manually. Investigation continues.</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:40 AM</span></td>
<td><span dir="ltr">The cloudwatch secret log_group_name key is fixed. (In two phases due to stray newline introduced in the first attempt)</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:57 AM</span></td>
<td><span dir="ltr">Remaining components (PMIN consumer) resume normal operation</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:58 AM</span></td>
<td><span dir="ltr">PMIN consumer finished processing all the low priority messages that were accumulated during the outage</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">10:25 AM</span></td>
<td><strong><span dir="ltr">Outage officially resolved</span></strong></td>
</tr>
<tr class="even">
<td><span dir="ltr">1:32 PM</span></td>
<td><span dir="ltr">Sent outage notification email</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">1:34 PM</span></td>
<td><span dir="ltr">RCA’d the <a href="https://prometheus-am-mnm-ci.5a9f.insights-dev.openshiftapps.com/#/silences/b66971e1-f407-46b3-8cdb-c9a2557d417b"><span class="underline">issue</span></a> that was causing the slack alerts to be silenced</span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
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

<span dir="ltr"></span>

## <span dir="ltr">How’d We Do?</span>

### <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you did well and want to call out. It's
OK to not list anything.</span>*

  - > <span dir="ltr">P1 consumer was automatically reverted to previous
    > known configuration and continued working</span>

  - > <span dir="ltr">The GraphQL interface remained operational
    > throughout the entire outage - applications using this interface
    > (e.g. Remediations) were not affected.</span>

  - > <span dir="ltr">Kyle Lape noticed a stray newline in the first
    > attempted fix which helped the resolution</span>
    
      - > <span dir="ltr">Also Kyle (and Ben) was a big help in figuring
        > out why slack alerts were busted</span>

### <span dir="ltr">What didn’t go so well?</span>

*<span dir="ltr">List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.</span>*

  - > <span dir="ltr">Prometheus slack alerts did not work</span>

  - > <span dir="ltr">Inventory deployment configuration was not current
    > as it had been [<span class="underline">partially reverted
    > accidentally</span>](https://github.com/RedHatInsights/e2e-deploy/pull/1908#pullrequestreview-443945034)</span>

  - > <span dir="ltr">Affected inventory components did not
    > automatically roll back</span>

  - > <span dir="ltr">No audit trail - unclear how the secret got
    > misconfigured (should get resolved in a post AppSRE world)</span>

  - > <span dir="ltr">Jenkins job execution history already lost at the
    > time of investigation of this incident due to low retention
    > setting</span>

## <span dir="ltr">Action Items</span>

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
<td><span dir="ltr">Share the love with the entire org</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">TBD</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"><a href="https://github.com/RedHatInsights/e2e-deploy/pull/1908#pullrequestreview-443945034"><span class="underline">Fix e2e-deploy configuration</span></a></span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="even">
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7736"><span class="underline">Verify that a misconfigured deployment is rolled back</span></a></span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7736"><span class="underline">RHCLOUD-7736</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Add more alerting to check alertmanager (check metrics and add monitoring)</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHIOPS-839"><span class="underline">RHIOPS-839</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Increase Jenkins retention history</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7757"><span class="underline">RHCLOUD-7757</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Continue to educate all Inventory devs on how to troubleshoot / resolve production issues like this</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7760"><span class="underline">RHCLOUD-7760</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Alert just to verify alerts are working</span></td>
<td><span dir="ltr">RHCLOUD-7893</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

## <span dir="ltr">Messaging</span>

### <span dir="ltr">Internal Email</span>

<span dir="ltr">All,</span>

<span dir="ltr"></span>

<span dir="ltr">We had an outage with the Inventory service from \~9:20
AM EDT - 10:25 AM EDT. During this time the REST APIs, mainly used by
the [<span class="underline">Inventory
UI</span>](https://cloud.redhat.com/insights/inventory/), were down and
hosts ingress messages would have paused their processing.</span>

<span dir="ltr"></span>

<span dir="ltr">We confirmed that Inventory is back up and operational,
but please let us know if you have any questions or are still
experiencing issues.</span>

### <span dir="ltr">External Email</span>

*<span dir="ltr">None</span>*

<span dir="ltr"></span>
