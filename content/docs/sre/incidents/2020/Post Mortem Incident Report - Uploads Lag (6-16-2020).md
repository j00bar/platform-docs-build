---
date: 2020-06-18 18:12:35.546000
title: Post Mortem Incident Report - Uploads Lag (6-16-2020)
---
## Overview

Early on the morning of June 16, the on-call engineer received a page
that Kafka lag was over expected limits. Upon investigating, the team
found that upload throughput was significantly lower than expected
causing an increasing backlog to develop.

## What Happened

A large archive was submitted consisting of a file that is required for
processing, but was incorrectly set up. This resulted in the archive
being continuously processed and causing timeouts for the system. The
timeouts caused the system to process other archives at a slower rate
due to continuously rebalancing around the failure.

## Contributing Factors

  - > Large archive submitted (~53MB)

  - > Archive included a binary /etc/redhat-release

## Resolution

Remove the failing archive from S3 so it was no longer being processed.
This allowed processing to resume at expected throughput level.

https://ansible.slack.com/archives/CGYK5EZ37/p1592291194452400

## Impact

Uploads were being processed significantly slower than expected. This
resulted in a backlog of about 193k archives at the peak.

There are no customer cases that we are aware of. No data was lost.

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
<td>6/16 3:06am</td>
<td>Alert (87889) fired to on-call engineer</td>
</tr>
<tr class="even">
<td>3:08am</td>
<td>Alert acknowledged</td>
</tr>
<tr class="odd">
<td>8:23am</td>
<td>Data engineer messaged on Slack. Troubleshooting by engineering team starts.</td>
</tr>
<tr class="even">
<td>9:20am</td>
<td>Restart of puptoo and insights-engine services attempted. Did not resolve issue. Research continues.</td>
</tr>
<tr class="odd">
<td>9:25am</td>
<td>Email to cloudservices-outage-list@ sent</td>
</tr>
<tr class="even">
<td>10:00am</td>
<td>Similarities to an outage two weeks ago identified. Research shifts to potential faulty archive</td>
</tr>
<tr class="odd">
<td>10:36am</td>
<td>Archive with binary file /etc/redhat-release identified</td>
</tr>
<tr class="even">
<td>11:35am</td>
<td>Archive removed from pipeline, processing throughput increases. Errors cease.</td>
</tr>
<tr class="odd">
<td>12:47pm</td>
<td>All-clear sent to cloudservices-outage-list@ sent</td>
</tr>
</tbody>
</table>

## How’d We Do?

### What went well?

*List anything you did well and want to call out. It's OK to not list
anything.*

  - > teamwork\!
    
      - > Huge help from Cmitch\!
    
      - > Joint effort between Kafka and Ingress to understand handoff
        > between systems

  - > Felt supported by management and team

### What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

  - > Escalation path unclear for on-call engineer
    
      - > Delay between alert and action being taken

  - > Insights-engine and puptoo not committing failed messages
    
      - > Cause messages to continue to be reprocessed
    
      - > PRs in place to fix

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
<td>Need backup for CMitch regarding Kafka operation</td>
<td>TODO: CMitch &amp; LD</td>
</tr>
<tr class="even">
<td>Add link to Kafka section of docs to alert runbook</td>
<td><a href="https://gitlab.cee.redhat.com/insights-platform/platform-docs/-/merge_requests/80"><span class="underline">Platform-docs PR</span></a></td>
</tr>
<tr class="odd">
<td><p>Add context to Slack text for PlatformKafkaLagMaxExceededHard alert</p>
<ul>
<li><blockquote>
<p>Group</p>
</blockquote></li>
<li><blockquote>
<p>Current count at alert time</p>
</blockquote></li>
<li><blockquote>
<p>Link to SOP (<a href="https://platform-docs.cloud.paas.psi.redhat.com/sop/PlatformKafkaLagMaxExceededHard.html"><span class="underline">https://platform-docs.cloud.paas.psi.redhat.com/sop/PlatformKafkaLagMaxExceededHard.html</span></a>)</p>
</blockquote></li>
</ul></td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-7049"><span class="underline">RHCLOUD-7049</span></a></td>
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
