---
date: 2020-06-17 12:43:42.087703
title: Post Mortem Incident Report - cloud.redhat.com Uploads Lag (6-16-2020)
---
## <span dir="ltr">Overview</span>

<span dir="ltr">Early on the morning of June 16, the on-call engineer
received a page that Kafka lag was over expected limits. Upon
investigating, the team found that upload throughput was significantly
lower than expected causing an increasing backlog to develop.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">A large archive was submitted consisting of a file that
is required for processing, but was incorrectly set up. This resulted in
the archive being continuously processed and causing timeouts for the
system. The timeouts caused the system to process other archives at a
slower rate due to continuously rebalancing around the failure.</span>

## <span dir="ltr">Contributing Factors</span>

  - > <span dir="ltr">Large archive submitted (\~53MB)</span>

  - > <span dir="ltr">Archive included a binary
    > /etc/redhat-release</span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">Remove the failing archive from S3 so it was no longer
being processed. This allowed processing to resume at expected
throughput level.</span>

<span dir="ltr"></span>

<span dir="ltr">https://ansible.slack.com/archives/CGYK5EZ37/p1592291194452400</span>

## <span dir="ltr">Impact</span>

<span dir="ltr">Uploads were being processed significantly slower than
expected. This resulted in a backlog of about 193k archives at the
peak.</span>

<span dir="ltr">  
There are no customer cases that we are aware of. No data was
lost.</span>

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
<td><span dir="ltr">6/16 3:06am</span></td>
<td><span dir="ltr">Alert (87889) fired to on-call engineer</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">3:08am</span></td>
<td><span dir="ltr">Alert acknowledged</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">8:23am</span></td>
<td><span dir="ltr">Data engineer messaged on Slack. Troubleshooting by engineering team starts.</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:20am</span></td>
<td><span dir="ltr">Restart of puptoo and insights-engine services attempted. Did not resolve issue. Research continues.</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:25am</span></td>
<td><span dir="ltr">Email to cloudservices-outage-list@ sent</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">10:56am</span></td>
<td><span dir="ltr">Similarities to an outage two weeks ago identified. Research shifts to potential faulty archive</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">11:02am</span></td>
<td><span dir="ltr">Archive with binary file /etc/redhat-release identified</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">11:47am</span></td>
<td><span dir="ltr">Archive removed from pipeline, processing throughput increases. Errors cease.</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">12:47pm</span></td>
<td><span dir="ltr">All-clear sent to cloudservices-outage-list@ sent</span></td>
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

  - > <span dir="ltr"></span>

  - > <span dir="ltr"></span>

### <span dir="ltr">What didn’t go so well?</span>

<span dir="ltr">*List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.*</span>

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
