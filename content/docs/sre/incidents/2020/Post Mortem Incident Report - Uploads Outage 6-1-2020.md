---
date: 2020-07-22 12:59:29.726000
title: Post Mortem Incident Report - Uploads Outage 6-1-2020
---
## Overview

During the weekend of May 30, uploads stopped being processed. The issue
appears to be with insights-engine and a large queue of archived to be
processed

## What Happened

There was a 1 million+ item backlog in the ‘engine-work’ RabbitMQ queue.
After bouncing the insights-plugins-amqp deployment all pod logs had a
KeyError for S3 because the corresponding archives were not in the
bucket. This was causing insights-engine pods to crash loop and no
longer process new archives. Purging the queue allowed insights-engine
pods to come up and begin processing successfully again.

## Contributing Factors

Over the last few weeks, the insights-engine Kafka alert has triggered.
The alert was silenced while work is being done to update the alert. It
is possible that this alert would have identified the engine issue if it
were enabled. (TODO: Confirm this?)

## Resolution

The resolution on 6/1 was to purge the rabbitmq queue. This caused
uploads to begin processing again and insights-engine worked through the
remaining queue.

The root cause was identified as being an uncaught exception in
insights-core. This allowed bad messages to be continually reprocessed
until we hit a situation where the pods were only processing the bad
messages and falling into repeated crash loops.

Dan Kuc identified and resolved the issue in this
[PR](https://github.com/RedHatInsights/insights-core-frontends/pull/27).

## Impact

Uploads from Satellite customers were not processed during the outage
time. The data for these customers will be included in the next upload.

<table>
<tbody>
<tr class="odd">
<td>BZ filed (<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1842448"><span class="underline">here</span></a>)</td>
<td>2 days</td>
</tr>
<tr class="even">
<td>Satellite users not able to see their data in UI</td>
<td>2 days</td>
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
<td>6/1 5:24am</td>
<td>BZ filed (<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1842448"><span class="underline">here</span></a>)</td>
</tr>
<tr class="even">
<td>5:37am</td>
<td>Discussion in Slack about uploads failing (<a href="https://ansible.slack.com/archives/CGYK5EZ37/p1591004262352700"><span class="underline">here</span></a>)</td>
</tr>
<tr class="odd">
<td>5:51am</td>
<td>Pete Savage triggers on-call page</td>
</tr>
<tr class="even">
<td>5:57am</td>
<td>Kyle Lape acknowledges page, begins investigating</td>
</tr>
<tr class="odd">
<td>7:00am</td>
<td>Kyle clears RabbitMQ queue</td>
</tr>
<tr class="even">
<td>7:09am</td>
<td>Kyle confirms uploads are running again</td>
</tr>
<tr class="odd">
<td>1:39pm</td>
<td>Dan Kub submits PR to resolve uncaught exception (<a href="https://github.com/RedHatInsights/insights-core-frontends/pull/27"><span class="underline">here</span></a>)</td>
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

  - > Cross-team effort to resolve the issue on the morning of 6/1

  - 
### What didn’t go so well?

  - > It looks like the upload failure started on 5/30, but a page was
    > not triggered until the manual alert on 6/1
    
      - > Where are we missing an alert? What is the alert criteria?

  - > Black box tester SSH key was unavailable to on call engineer
    > (kyle)
    
      - > The private ssh key was linked in an SOP but Kyle was unaware
        > of the SOP

  - 
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
<td>Ensure black box is running again</td>
<td>DONE - fixed before ticket was filed</td>
</tr>
<tr class="even">
<td>Write alert to check if black box tester is running</td>
<td>DONE- <a href="https://projects.engineering.redhat.com/browse/RHIOPS-783"><span class="underline">RHIOPS-783</span></a></td>
</tr>
<tr class="odd">
<td>Enable metrics for insights classic</td>
<td>Advisor team</td>
</tr>
<tr class="even">
<td>Add alert for rabbitmq engine_work queue size</td>
<td><p>Advisor team</p>
<p><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6760"><span class="underline">Jira ticket</span></a></p></td>
</tr>
<tr class="odd">
<td>Create SOP for Classic API and engine</td>
<td><p>Advisor team</p>
<p><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6762"><span class="underline">Jira Ticket</span></a></p></td>
</tr>
<tr class="even">
<td>Reach out to Shannon Hughes to let him know the outage</td>
<td>DONE - messaged via Slack</td>
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

**Ingress load, until=0850 CDT**

![](media/image1.png)

**Kafka messsage production over the past 7 days, until 0906 CDT**

![](media/image2.png)

**Platform engine processed count (averaged for an hour)**

![](media/image3.png)
