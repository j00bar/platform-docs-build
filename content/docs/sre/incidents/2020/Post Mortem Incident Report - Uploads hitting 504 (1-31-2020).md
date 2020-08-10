---
date: 2020-06-17 15:08:17.503000
title: Post Mortem Incident Report - Uploads hitting 504 (1-31-2020)
---
## <span dir="ltr">Overview</span>

*<span dir="ltr">Clients were 504-ing when running insights-client, this
caused the following BZ to be opened:</span>*

<span dir="ltr">[*<span class="underline">https://bugzilla.redhat.com/show\_bug.cgi?id=1796795</span>*](https://bugzilla.redhat.com/show_bug.cgi?id=1796795)</span>

***<span dir="ltr">“Insights uploads are failing with error "Upload
archive failed with status code 504"”</span>***

<span dir="ltr"></span>

## <span dir="ltr">What Happened</span>

*<span dir="ltr">RabbitMQ pods as well as insights-plugins-amqp were
crashing / throwing errors. Bouncing only the failed pods met with
limited success, what finally fixed the issue was:</span>*

*<span dir="ltr">oc rollout latest dc/rabbitmq</span>*

*<span dir="ltr">oc rollout latest dc/insights-plugins-amqp</span>*

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Timeline</span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Time (EST)</span></strong></th>
<th><strong><span dir="ltr">Notes</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">6:47 AM</span></td>
<td><span dir="ltr">BZ is created -</span> <span dir="ltr"><a href="https://bugzilla.redhat.com/show_bug.cgi?id=1796795"><span class="underline"> https://bugzilla.redhat.com/show_bug.cgi?id=1796795</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">7:47 AM</span></td>
<td><span dir="ltr">Page is sent out by QE</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">7:49 AM</span></td>
<td><span dir="ltr">Page is ACKd</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">8:12 AM</span></td>
<td><span dir="ltr">MQueue issue was identified</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">8:45 AM</span></td>
<td><span dir="ltr">Limited upload service was restored</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:14 AM</span></td>
<td><span dir="ltr">Upload service fully restored</span></td>
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

## <span dir="ltr">Resolution</span>

*<span dir="ltr">Include a description what solved the problem. If there
was a temporary fix in place, describe that along with the long-term
solution.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Root Causes</span>

*<span dir="ltr">Include a description of any conditions that
contributed to the issue. If there were any actions taken that
exacerbated the issue, also include them here with the intention of
learning from any mistakes made during the resolution process.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Impact</span>

*<span dir="ltr">Be specific here. Include numbers such as customers
affected, cost to business, etc.</span>*

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you think we did well and want to call
out. It's okay to not list anything.</span>*

  - > <span dir="ltr"></span>

  - > <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">What didn’t go so well?</span>

<span dir="ltr">*List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.*</span>

> <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Action Items</span>

*<span dir="ltr">Include action items such as:</span>*

*<span dir="ltr">(1) fixes required to prevent the issue in the
future,</span>*

*<span dir="ltr">(2) preparedness tasks that could help mitigate a
similar incident if it came up again,</span>*

*<span dir="ltr">(3) remaining postmortem steps, such as an internal
follow-up email, updating the public status page, etc</span>*

<span dir="ltr"></span>

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

<span dir="ltr"></span>

<span dir="ltr"></span>
