---
date: 2020-07-22 08:59:29.726000
title: Post Mortem Incident Report - Uploads Outage 6-1-2020
---
## <span dir="ltr">Overview</span>

<span dir="ltr">During the weekend of May 30, uploads stopped being
processed. The issue appears to be with insights-engine and a large
queue of archived to be processed</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">There was a 1 million+ item backlog in the ‘engine-work’
RabbitMQ queue. After bouncing the insights-plugins-amqp deployment all
pod logs had a KeyError for S3 because the corresponding archives were
not in the bucket. This was causing insights-engine pods to crash loop
and no longer process new archives. Purging the queue allowed
insights-engine pods to come up and begin processing successfully
again.</span>

## <span dir="ltr">Contributing Factors</span>

<span dir="ltr">Over the last few weeks, the insights-engine Kafka alert
has triggered. The alert was silenced while work is being done to update
the alert. It is possible that this alert would have identified the
engine issue if it were enabled. (TODO: Confirm this?)</span>

<span dir="ltr"></span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">The resolution on 6/1 was to purge the rabbitmq queue.
This caused uploads to begin processing again and insights-engine worked
through the remaining queue.</span>

<span dir="ltr"></span>

<span dir="ltr">The root cause was identified as being an uncaught
exception in insights-core. This allowed bad messages to be continually
reprocessed until we hit a situation where the pods were only processing
the bad messages and falling into repeated crash loops.</span>

<span dir="ltr"></span>

<span dir="ltr">Dan Kuc identified and resolved the issue in this
[<span class="underline">PR</span>](https://github.com/RedHatInsights/insights-core-frontends/pull/27).</span>

## <span dir="ltr">Impact</span>

<span dir="ltr">Uploads from Satellite customers were not processed
during the outage time. The data for these customers will be included in
the next upload.</span>

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
<td><span dir="ltr">BZ filed (<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1842448"><span class="underline">here</span></a>)</span></td>
<td><span dir="ltr">2 days</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Satellite users not able to see their data in UI</span></td>
<td><span dir="ltr">2 days</span></td>
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
<td><span dir="ltr">6/1 5:24am</span></td>
<td><span dir="ltr">BZ filed (<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1842448"><span class="underline">here</span></a>)</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">5:37am</span></td>
<td><span dir="ltr">Discussion in Slack about uploads failing (<a href="https://ansible.slack.com/archives/CGYK5EZ37/p1591004262352700"><span class="underline">here</span></a>)</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">5:51am</span></td>
<td><span dir="ltr">Pete Savage triggers on-call page</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">5:57am</span></td>
<td><span dir="ltr">Kyle Lape acknowledges page, begins investigating</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">7:00am</span></td>
<td><span dir="ltr">Kyle clears RabbitMQ queue</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">7:09am</span></td>
<td><span dir="ltr">Kyle confirms uploads are running again</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">1:39pm</span></td>
<td><span dir="ltr">Dan Kub submits PR to resolve uncaught exception (<a href="https://github.com/RedHatInsights/insights-core-frontends/pull/27"><span class="underline">here</span></a>)</span></td>
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

  - > <span dir="ltr">Cross-team effort to resolve the issue on the
    > morning of 6/1</span>

  - > <span dir="ltr"></span>

### <span dir="ltr">What didn’t go so well?</span>

  - > <span dir="ltr">It looks like the upload failure started on 5/30,
    > but a page was not triggered until the manual alert on 6/1</span>
    
      - > <span dir="ltr">Where are we missing an alert? What is the
        > alert criteria?</span>

  - > <span dir="ltr">Black box tester SSH key was unavailable to on
    > call engineer (kyle)</span>
    
      - > <span dir="ltr">The private ssh key was linked in an SOP but
        > Kyle was unaware of the SOP</span>

  - > <span dir="ltr"></span>

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
<td><span dir="ltr">Ensure black box is running again</span></td>
<td><span dir="ltr">DONE - fixed before ticket was filed</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Write alert to check if black box tester is running</span></td>
<td><span dir="ltr">DONE- <a href="https://projects.engineering.redhat.com/browse/RHIOPS-783"><span class="underline">RHIOPS-783</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Enable metrics for insights classic</span></td>
<td><span dir="ltr">Advisor team</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Add alert for rabbitmq engine_work queue size</span></td>
<td><p><span dir="ltr">Advisor team</span></p>
<p><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6760"><span class="underline">Jira ticket</span></a></span></p></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Create SOP for Classic API and engine</span></td>
<td><p><span dir="ltr">Advisor team</span></p>
<p><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6762"><span class="underline">Jira Ticket</span></a></span></p></td>
</tr>
<tr class="even">
<td><span dir="ltr">Reach out to Shannon Hughes to let him know the outage</span></td>
<td><span dir="ltr">DONE - messaged via Slack</span></td>
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

**<span dir="ltr">Ingress load, until=0850 CDT</span>**

![](media/image1.png)<span dir="ltr"></span>

<span dir="ltr"></span>

**<span dir="ltr">Kafka messsage production over the past 7 days, until
0906 CDT</span>**

![](media/image3.png)<span dir="ltr"></span>

<span dir="ltr"></span>

**<span dir="ltr">Platform engine processed count (averaged for an
hour)</span>**

![](media/image2.png)<span dir="ltr"></span>
