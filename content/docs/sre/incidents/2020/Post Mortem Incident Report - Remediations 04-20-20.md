---
date: 2020-04-14 19:38:22.561000
title: Post Mortem Incident Report - Remediations 04-20-20
---
## Overview

*Include a **short** sentence or two summarizing the contributing
factors, timeline summary, and the impact. E.g. "On the morning of
August 99th, we suffered a 1 minute SEV-1 due to a runaway process on
our primary database machine. This slowness caused roughly 0.024% of
alerts that had begun during this time to be delivered out of SLA."*

## What Happened

*Include a short description of what happened.*

## Contributing Factors

*Include a description of any conditions that contributed to the issue.
If there were any actions taken that exacerbated the issue, also include
them here with the intention of learning from any mistakes made during
the resolution process.*

## Resolution

*Include a description of what solved the problem. If there was a
temporary fix in place, describe that along with the long-term
solution.*

## Impact

*Be specific here. Include numbers such as customers affected, cost to
business, etc.*

*Example template*

<table>
<tbody>
<tr class="odd">
<td>Time in SEV-1</td>
<td>?mins</td>
</tr>
<tr class="even">
<td>Time in SEV-2</td>
<td>?mins</td>
</tr>
<tr class="odd">
<td>Notifications Delivered out of SLA</td>
<td>??% (?? of ??)</td>
</tr>
<tr class="even">
<td>Events Dropped / Not Accepted</td>
<td>??% (?? of ??) Should usually be 0, but always check</td>
</tr>
<tr class="odd">
<td>Accounts Affected</td>
<td>??</td>
</tr>
<tr class="even">
<td>Users Affected</td>
<td>??</td>
</tr>
<tr class="odd">
<td>Support Requests Raised</td>
<td>?? Include any relevant links to tickets</td>
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

  - 
  - 
### What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

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
