---
date: 2019-07-31 18:19:34.857000
title: 2019-07-30 - Auth Outage
---
## Overview

*Include a short sentence or two summarizing the contributing factors,
timeline summary, and the impact; for example, "On the morning of August
14th, we suffered a 14 minute SEV-1 due to a runaway process on our
primary database machine. This slowness caused roughly 3% of reports
generated during this time to be completed out of SLA."*

## What Happened

*Include a short description of what happened, usually based on the
timeline.*

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
<td>2230</td>
<td><p>Auth starts failing according to 3scale logs</p>
<p>gateway.auth_type:”jwt-auth” AND NOT gateway.status:401</p>
<p><a href="https://kibana-kibana.1b13.insights.openshiftapps.com/goto/fd933150179ae87f8863587c8dabe761"><span class="underline">https://kibana-kibana.1b13.insights.openshiftapps.com/goto/fd933150179ae87f8863587c8dabe761</span></a></p></td>
</tr>
<tr class="even">
<td>2346</td>
<td>Mark Huth pinged #cloudservices-outage “Getting Missing Authentication errors” <a href="https://ansible.slack.com/archives/CGYK5EZ37/p1564458381000500"><span class="underline">https://ansible.slack.com/archives/CGYK5EZ37/p1564458381000500</span></a></td>
</tr>
<tr class="odd">
<td>0342</td>
<td><p>Pete Savage manually triggered PagerDuty alert</p>
<p><a href="https://redhat.pagerduty.com/incidents/PDP7NZM/timeline"><span class="underline">https://redhat.pagerduty.com/incidents/PDP7NZM/timeline</span></a></p></td>
</tr>
<tr class="even">
<td>0450</td>
<td>Ken Hoes reported the service to be working again</td>
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
</tbody>
</table>

## Resolution

This issue resolved itself after about 6 hours of down time. There was
no human or automated action (that we know of) that lead to the
resolution of this issue.

*Include a description what solved the problem. If there was a temporary
fix in place, describe that along with the long-term solution.*

## Root Causes

JWT Auth was the broken component.

*Include a description of any conditions that contributed to the issue.
If there were any actions taken that exacerbated the issue, also include
them here with the intention of learning from any mistakes made during
the resolution process.*

## Impact

All customers using the web GUI were unable to login.

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

  - > Automated testing did not catch the problem and fire an alert

  - > People noticed the issue but did not escalate

  - > Auth seemed to cache a bad token and has no mechanism to break the
    > cache other than the standard set timed cache busting

  - > Compliance and Vulnerability did not handle the broken auth
    > process well.
    
      - > Both apps fell into a loop constantly trying to reload the
        > page without throwing an error
    
      - > Insights handled the problem successfully with a toast
        > notification
        
          - > Insights showed the same toast notification twice though,
            > suppressing duplicate notifications would be a nice to
            > have

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
<td>Add blackbox testing to cover this scenario</td>
<td></td>
</tr>
<tr class="even">
<td>Send a notification to Sentry</td>
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
<td>De-dupe toast notifications in Insights: <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-1964"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-1964</span></a></td>
<td></td>
</tr>
<tr class="even">
<td>Stop Compliance from endlessly reloading when an auth error is hit. Show an error to the user.</td>
<td></td>
</tr>
<tr class="odd">
<td>Stop Vulnerability from endlessly reloading when an auth error is hit. Show an error to the user.</td>
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
