---
date: 2019-10-18 13:17:53.202000
title: Post Mortem Incident Report - Advisor 10-18-19
---
## Overview

*Include a short sentence or two summarizing the contributing factors,
timeline summary, and the impact; for example, "On the morning of August
14th, we suffered a 14 minute SEV-1 due to a runaway process on our
primary database machine. This slowness caused roughly 3% of reports
generated during this time to be completed out of SLA."*

## What Happened

*Include a short description of what happened, usually based on the
timeline.  
*

The C.R.C WebUI was reporting 504 errors when trying to interact with
the site.

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
<td>2:30</td>
<td>Pete paged SRE</td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td>3:00</td>
<td>Mark ran oc delete job on the warm cache pods and disabled the cronjob</td>
</tr>
<tr class="even">
<td>3:10</td>
<td>Q depth and CPU load on advisor-prod db remained high as Insights continued to process incoming nightly uploads</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td>4:09</td>
<td>Q depth went back to normal range, advisor is back up. Cronjob kept in a disabled state (suspend: true) for the time being</td>
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

Disabled the warm-cache cronjob in the advisor-prod project:

oc edit cronjob warm-cache  
… and set suspend: true

Deleted the warm-cache jobs that were piling up in the advisor-prod
project.  
for i in $(oc get jobs | grep warm-cache | awk '{print $1}'); do echo
$i; oc delete job $i; done

## Root Causes

*Include a description of any conditions that contributed to the issue.
If there were any actions taken that exacerbated the issue, also include
them here with the intention of learning from any mistakes made during
the resolution process.*

The warm-cache cronjob runs every 5 minutes, which creates a job/pod,
runs its command/query and then cleans up. Earlier in the day this
didn’t seem to be a problem because there wasn’t much load otherwise
on Insights and the job/command/query ran to completion. But as the
usual nightly processing of uploads started ramping up, the warm-cache
jobs weren’t finishing within 5 minutes and the warm-cache jobs/pods
started piling up. This was placing additional load on the advisor-prod
DB, slowing down the C.R.C UI and causing 504 errors when accessing the
UI.

## Impact

*Be specific here. Include numbers such as customers affected, cost to
business, etc.*

Not sure about US and APAC customers being affected because it happened
in the middle of the night US time and early Friday evening APAC time.
EMEA customers trying to interact with Insights would have noticed it
though.

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
<td>Perhaps set concurrencyPolicy: Forbid on the warm-cache cronjob:<br />
<a href="https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/#concurrency-policy"><span class="underline">https://kubernetes.io/docs/tasks/job/automated-tasks-with-cron-jobs/#concurrency-policy</span></a></td>
<td></td>
</tr>
<tr class="even">
<td>Perhaps restrict the cronjob to only run outside of peak upload processing periods, or only during the US business hours when most customers would likely be interacting with Insights.</td>
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
