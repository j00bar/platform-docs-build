---
date: 2020-06-19 02:17:09.024000
title: Post Mortem Incident Report - Kafka issue (06-06-2020)
---
## Overview

Kafka was briefly (\<5 minutes) taken offline on 6/6/2020 in order to
[increase storage capacity and enable
compaction](https://projects.engineering.redhat.com/browse/RHCLOUD-6648?focusedCommentId=2447079&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-2447079)
which are needed for progress on Project Cyndi development. A few
dependent services, namely Advisor and Xjoin, did not deal with the
outage gracefully and were unable to recover without manual
intervention.

## Impact

  - > Advisor Service stopped processing uploads and did not come back
    > properly over the weekend.
    
      - > Customers could still access Advisor but the data was old and
        > new uploads weren’t being shown

  - > Xjoin data was no longer in sync with HBI local data which was
    > incorrectly causing systems to be shown a stale in Inventory UI on
    > the platform. This resulted in 3 separate customer cases that
    > caused customer experience
    
      - 
## Contributing Factors

From an Xjoin perspective, our Jenkins jobs that run the validation
checker didn’t run and consequently the HBI team was not alerted of the
issue.

The alerts for Advisor were not seen over the weekend so the Advisor
Service was not restarted properly.

## Resolution

From an Xjoin perspective we ran the validation script manually,
observed there were errors (which confirmed our hypothesis) then kicked
off the script to reindex the data which resolved the issue.

<table>
<tbody>
<tr class="odd">
<td>Time in incorrect staleness state (due to Xjoin issue)</td>
<td>~36 hours</td>
</tr>
<tr class="even">
<td>Time in SEV-2</td>
<td>?mins</td>
</tr>
<tr class="odd">
<td>Notifications Delivered out of SLA</td>
<td>0%</td>
</tr>
<tr class="even">
<td>Events Dropped / Not Accepted</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>Accounts Affected</td>
<td>3 that notified us</td>
</tr>
<tr class="even">
<td>Users Affected</td>
<td>N/A</td>
</tr>
<tr class="odd">
<td>Support Requests Raised</td>
<td>2 -- 1 over email and <a href="https://access.redhat.com/support/cases/#/case/02673899"><span class="underline">02673899</span></a></td>
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
<td>6/6/2020 11AM</td>
<td>Kafka was taken offline, reconfigured and brought back online in &lt; 5 min</td>
</tr>
<tr class="even">
<td>6/5/2020 8PM</td>
<td>Advisor blackbox test failed and sent a notice to the #advisor-dev channel. The Advisor Service was failing to process uploads.</td>
</tr>
<tr class="odd">
<td>06/07/2020 2PM</td>
<td>Dan restarted the Advisor Service and we began processing messages off Kafka again</td>
</tr>
<tr class="even">
<td>6/9/2020 11AM</td>
<td>Received email from Christian Labisch (part of Red Hat Accelerator) that he was seeing oddities in the UI indicating that most / all of his systems were marked stale despite insights-client successfully registering and checking them in.</td>
</tr>
<tr class="odd">
<td>6/9/2020 12PM</td>
<td>Rob and Ian pinged #forum-cloudservices slack channel indicating that Hiliti opened a support case indicating that 587/600 systems were marked stale despite recently checking in</td>
</tr>
<tr class="even">
<td>6/9/2020 1:15PM</td>
<td>Xjoin re-indexed and verified that we could no longer see the staleness issues.</td>
</tr>
<tr class="odd">
<td>6/9/2020 1:45PM</td>
<td>Heard back from Christian that issue was indeed resolved</td>
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

  - > On the Xjoin side of the problem, we were able to RCA the issue,
    > fix it and communicate back to all customers within 2 hours from
    > identification.

### What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

  - > Advisor’s alerts went unseen preventing a pretty easy fix from
    > happening.

  - > The Advisor Service didn’t come back correctly

  - > Make sure to reach out to support (Shannon Hughes):
    > shughes@redhat.com

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
<td>Update the Advisor black box testing to notify the Slack channel instead of just silently posting</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7031"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-7031</span></a></td>
</tr>
<tr class="even">
<td>Have reindex job automatically kick off if validation fails</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7032"><span class="underline">RHCLOUD-7032</span></a></td>
</tr>
<tr class="odd">
<td>Investigate Advisor Service to ensure it can come back from Kafka blips</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7048"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-7048</span></a></td>
</tr>
<tr class="even">
<td>Add more context (append the consumer group ID and topics) to the Kafka lag alert</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7049"><span class="underline">RHCLOUD-7049</span></a></td>
</tr>
<tr class="odd">
<td>Need SOP for Xjoin (at least the pieces that are GA)</td>
<td>TBD</td>
</tr>
<tr class="even">
<td>Update SOPs for Advisor (leftover from last RCA)</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6762"><span class="underline">RHCLOUD-6762</span></a></td>
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

*This is a follow-up for employees. It should be sent out right after
the post-mortem meeting is over. It only needs a short paragraph
summarizing the incident and a link to this wiki page.*

### External Email

*This is what will be included on the status.redhat.com website
regarding this incident. What are we telling customers, including an
apology? (The apology should be genuine, not rote.)*
