---
date: 2020-06-17 19:08:17.503000
title: Post Mortem Incident Report - Uploads hitting 504 (1-31-2020)
---
## Overview

*Clients were 504-ing when running insights-client, this caused the
following BZ to be
opened:*

[*https://bugzilla.redhat.com/show\_bug.cgi?id=1796795*](https://bugzilla.redhat.com/show_bug.cgi?id=1796795)

***“Insights uploads are failing with error "Upload archive failed with
status code 504"”***

## What Happened

*RabbitMQ pods as well as insights-plugins-amqp were crashing / throwing
errors. Bouncing only the failed pods met with limited success, what
finally fixed the issue was:*

*oc rollout latest dc/rabbitmq*

*oc rollout latest dc/insights-plugins-amqp*

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
<td>6:47 AM</td>
<td>BZ is created - <a href="https://bugzilla.redhat.com/show_bug.cgi?id=1796795"><span class="underline">https://bugzilla.redhat.com/show_bug.cgi?id=1796795</span></a></td>
</tr>
<tr class="even">
<td>7:47 AM</td>
<td>Page is sent out by QE</td>
</tr>
<tr class="odd">
<td>7:49 AM</td>
<td>Page is ACKd</td>
</tr>
<tr class="even">
<td>8:12 AM</td>
<td>MQueue issue was identified</td>
</tr>
<tr class="odd">
<td>8:45 AM</td>
<td>Limited upload service was restored</td>
</tr>
<tr class="even">
<td>9:14 AM</td>
<td>Upload service fully restored</td>
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

## Resolution

*Include a description what solved the problem. If there was a temporary
fix in place, describe that along with the long-term solution.*

## Root Causes

*Include a description of any conditions that contributed to the issue.
If there were any actions taken that exacerbated the issue, also include
them here with the intention of learning from any mistakes made during
the resolution process.*

## Impact

*Be specific here. Include numbers such as customers affected, cost to
business, etc.*

## What went well?

*List anything you think we did well and want to call out. It's okay to
not list anything.*

  - 
  - 
## What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

## Action Items

*Include action items such as: *

*(1) fixes required to prevent the issue in the future, *

*(2) preparedness tasks that could help mitigate a similar incident if
it came up again, *

*(3) remaining postmortem steps, such as an internal follow-up email,
updating the public status page, etc*

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
