---
date: 2020-06-17 12:43:41.889703
title: 2020-06-06 - Kafka issue
---
## <span dir="ltr">Overview</span>

<span dir="ltr">Kafka was briefly (\<5 minutes) taken offline on
6/6/2020 in order to [<span class="underline">increase storage capacity
and enable
compaction</span>](https://projects.engineering.redhat.com/browse/RHCLOUD-6648?focusedCommentId=2447079&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-2447079)
which are needed for progress on Project Cyndi development. A few
dependent services, namely Advisor and Xjoin, did not deal with the
outage gracefully and were unable to recover without manual
intervention.</span>

## <span dir="ltr">Impact</span>

  - > <span dir="ltr">Advisor Service stopped processing uploads and did
    > not come back properly over the weekend.</span>
    
      - > <span dir="ltr">Customers could still access Advisor but the
        > data was old and new uploads weren’t being shown</span>

  - > <span dir="ltr">Xjoin data was no longer in sync with HBI local
    > data which was incorrectly causing systems to be shown a stale in
    > Inventory UI on the platform. This resulted in 3 separate customer
    > cases that caused customer experience</span>
    
      - > <span dir="ltr"></span>

## <span dir="ltr">Contributing Factors</span>

<span dir="ltr">From an Xjoin perspective, our Jenkins jobs that run the
validation checker didn’t run and consequently the HBI team was not
alerted of the issue.</span>

<span dir="ltr"></span>

<span dir="ltr">The alerts for Advisor were not seen over the weekend so
the Advisor Service was not restarted properly.</span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">From an Xjoin perspective we ran the validation script
manually, observed there were errors (which confirmed our hypothesis)
then kicked off the script to reindex the data which resolved the
issue.</span>

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
<td><span dir="ltr">Time in incorrect staleness state (due to Xjoin issue)</span></td>
<td><span dir="ltr">~36 hours</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Time in SEV-2</span></td>
<td><span dir="ltr">?mins</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Notifications Delivered out of SLA</span></td>
<td><span dir="ltr">0%</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Events Dropped / Not Accepted</span></td>
<td><span dir="ltr">N/A</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Accounts Affected</span></td>
<td><span dir="ltr">3 that notified us</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Users Affected</span></td>
<td><span dir="ltr">N/A</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Support Requests Raised</span></td>
<td><p><span dir="ltr">2 -- 1 over email and <a href="https://access.redhat.com/support/cases/#/case/02673899"><span class="underline">02673899</span></a></span></p>
<p><span dir="ltr"></span></p></td>
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
<td><span dir="ltr">6/6/2020 11AM</span></td>
<td><span dir="ltr">Kafka was taken offline, reconfigured and brought back online in &lt; 5 min</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">6/5/2020 8PM</span></td>
<td><span dir="ltr">Advisor blackbox test failed and sent a notice to the #advisor-dev channel. The Advisor Service was failing to process uploads.</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">06/07/2020 2PM</span></td>
<td><span dir="ltr">Dan restarted the Advisor Service and we began processing messages off Kafka again</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">6/9/2020 11AM</span></td>
<td><span dir="ltr">Received email from Christian Labisch (part of Red Hat Accelerator) that he was seeing oddities in the UI indicating that most / all of his systems were marked stale despite insights-client successfully registering and checking them in.</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">6/9/2020 12PM</span></td>
<td><span dir="ltr">Rob and Ian pinged #forum-cloudservices slack channel indicating that Hiliti opened a support case indicating that 587/600 systems were marked stale despite recently checking in</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">6/9/2020 1:15PM</span></td>
<td><span dir="ltr">Xjoin re-indexed and verified that we could no longer see the staleness issues.</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">6/9/2020 1:45PM</span></td>
<td><span dir="ltr">Heard back from Christian that issue was indeed resolved</span></td>
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

  - > <span dir="ltr">On the Xjoin side of the problem, we were able to
    > RCA the issue, fix it and communicate back to all customers within
    > 2 hours from identification.</span>

  - > <span dir="ltr"></span>

### <span dir="ltr">What didn’t go so well?</span>

*<span dir="ltr">List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.</span>*

<span dir="ltr"></span>

  - > <span dir="ltr">Advisor’s alerts went unseen preventing a pretty
    > easy fix from happening.</span>

  - > <span dir="ltr">The Advisor Service didn’t come back
    > correctly</span>

  - > <span dir="ltr">Make sure to reach out to support (Shannon
    > Hughes): shughes@redhat.com</span>

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
<td><span dir="ltr">Update the Advisor black box testing to notify the Slack channel instead of just silently posting</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7031"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-7031</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Have reindex job automatically kick off if validation fails</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7032"><span class="underline">RHCLOUD-7032</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Investigate Advisor Service to ensure it can come back from Kafka blips</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7048"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-7048</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Add more context (append the consumer group ID and topics) to the Kafka lag alert</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7049"><span class="underline">RHCLOUD-7049</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Need SOP for Xjoin (at least the pieces that are GA)</span></td>
<td><span dir="ltr">TBD</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Update SOPs for Advisor (leftover from last RCA)</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6762"><span class="underline">RHCLOUD-6762</span></a></span></td>
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
