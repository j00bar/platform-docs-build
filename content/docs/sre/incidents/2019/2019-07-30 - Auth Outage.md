---
date: 2019-07-31 14:19:34.857000
title: 2019-07-30 - Auth Outage
---
## <span dir="ltr">Overview</span>

*<span dir="ltr">Include a short sentence or two summarizing the
contributing factors, timeline summary, and the impact; for example, "On
the morning of August 14th, we suffered a 14 minute SEV-1 due to a
runaway process on our primary database machine. This slowness caused
roughly 3% of reports generated during this time to be completed out of
SLA."</span>*

<span dir="ltr"></span>

## <span dir="ltr">What Happened</span>

*<span dir="ltr">Include a short description of what happened, usually
based on the timeline.</span>*

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
<td><span dir="ltr">2230</span></td>
<td><p><span dir="ltr">Auth starts failing according to 3scale logs</span></p>
<p><span dir="ltr">gateway.auth_type:”jwt-auth” AND NOT gateway.status:401</span></p>
<p><span dir="ltr"><a href="https://kibana-kibana.1b13.insights.openshiftapps.com/goto/fd933150179ae87f8863587c8dabe761"><span class="underline">https://kibana-kibana.1b13.insights.openshiftapps.com/goto/fd933150179ae87f8863587c8dabe761</span></a></span></p></td>
</tr>
<tr class="even">
<td><span dir="ltr">2346</span></td>
<td><span dir="ltr">Mark Huth pinged #cloudservices-outage “Getting Missing Authentication errors” <a href="https://ansible.slack.com/archives/CGYK5EZ37/p1564458381000500"><span class="underline">https://ansible.slack.com/archives/CGYK5EZ37/p1564458381000500</span></a></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">0342</span></td>
<td><p><span dir="ltr">Pete Savage manually triggered PagerDuty alert</span></p>
<p><span dir="ltr"><a href="https://redhat.pagerduty.com/incidents/PDP7NZM/timeline"><span class="underline">https://redhat.pagerduty.com/incidents/PDP7NZM/timeline</span></a></span></p></td>
</tr>
<tr class="even">
<td><span dir="ltr">0450</span></td>
<td><span dir="ltr">Ken Hoes reported the service to be working again</span></td>
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
</tbody>
</table>

<span dir="ltr"></span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">This issue resolved itself after about 6 hours of down
time. There was no human or automated action (that we know of) that lead
to the resolution of this issue.</span>

<span dir="ltr"></span>

*<span dir="ltr">Include a description what solved the problem. If there
was a temporary fix in place, describe that along with the long-term
solution.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Root Causes</span>

<span dir="ltr">JWT Auth was the broken component.</span>

<span dir="ltr"></span>

*<span dir="ltr">Include a description of any conditions that
contributed to the issue. If there were any actions taken that
exacerbated the issue, also include them here with the intention of
learning from any mistakes made during the resolution process.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Impact</span>

<span dir="ltr">All customers using the web GUI were unable to
login.</span>

<span dir="ltr"></span>

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

*<span dir="ltr">List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.</span>*

  - > <span dir="ltr">Automated testing did not catch the problem and
    > fire an alert</span>

  - > <span dir="ltr">People noticed the issue but did not
    > escalate</span>

  - > <span dir="ltr">Auth seemed to cache a bad token and has no
    > mechanism to break the cache other than the standard set timed
    > cache busting</span>

  - > <span dir="ltr">Compliance and Vulnerability did not handle the
    > broken auth process well.</span>
    
      - > <span dir="ltr">Both apps fell into a loop constantly trying
        > to reload the page without throwing an error</span>
    
      - > <span dir="ltr">Insights handled the problem successfully with
        > a toast notification</span>
        
          - > <span dir="ltr">Insights showed the same toast
            > notification twice though, suppressing duplicate
            > notifications would be a nice to have</span>

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
<td><span dir="ltr">Add blackbox testing to cover this scenario</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Send a notification to Sentry</span></td>
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
<td><span dir="ltr">De-dupe toast notifications in Insights: <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-1964"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-1964</span></a></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Stop Compliance from endlessly reloading when an auth error is hit. Show an error to the user.</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Stop Vulnerability from endlessly reloading when an auth error is hit. Show an error to the user.</span></td>
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
