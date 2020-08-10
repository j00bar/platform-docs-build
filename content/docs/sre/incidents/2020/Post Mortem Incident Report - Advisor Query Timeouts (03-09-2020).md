---
date: 2020-06-17 15:10:19.627000
title: Post Mortem Incident Report - Advisor Query Timeouts (03-09-2020)
---
## <span dir="ltr">Overview</span>

<span dir="ltr">On Monday the 9th we began receiving reports that
Insights was displaying 504 errors</span>

<span dir="ltr"></span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">Over the weekend the advisor culling routine marked a
million systems as stale. This caused the API queries to time out as
they tried to handle filtering them out. An update was pushed changing
the queries and brought production back up.</span>

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
<td><span dir="ltr">7:06am</span></td>
<td><span dir="ltr">Amar asks via Wormhole about the 504 errors he’s seeing</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">8am</span></td>
<td><span dir="ltr">Mark Huth begins investigating the logs</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">8:55am</span></td>
<td><span dir="ltr">Dan Kuc reboots the DB but problem persists</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:30am</span></td>
<td><span dir="ltr">Dan identifies the cause - API queries are timing out due to the sudden marking of stale systems over the weekend. Begins working on a code workaround</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:50am</span></td>
<td><span dir="ltr">Code is pushed to github and pushed through to Prod with the help of Bran</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">10:00am</span></td>
<td><span dir="ltr">Build begins</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">10:05am</span></td>
<td><span dir="ltr">Patch successfully alleviates the 504 errors</span></td>
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

<span dir="ltr">A patch was pushed to production that fixed the problem:
[<span class="underline">https://github.com/RedHatInsights/insights-advisor-api/pull/480</span>](https://github.com/RedHatInsights/insights-advisor-api/pull/480)</span>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Root Causes</span>

<span dir="ltr">The queries made in the API could not filter the sudden
appearance of a million stale systems.</span>

<span dir="ltr"></span>

## <span dir="ltr">Impact</span>

<span dir="ltr">Insights was unusable as the /rules and /stats endpoints
returned 504 errors. We received multiple queries regarding the outage
from customers via Support.</span>

<span dir="ltr"></span>

<span dir="ltr">BZ:
[<span class="underline">https://bugzilla.redhat.com/show\_bug.cgi?id=1811665</span>](https://bugzilla.redhat.com/show_bug.cgi?id=1811665)</span>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you think we did well and want to call
out. It's okay to not list anything.</span>*

  - > <span dir="ltr">We were able to force a patch through production
    > quickly once the problem was identified.</span>

  - > <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">What didn’t go so well?</span>

*<span dir="ltr">List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.</span>*

  - > <span dir="ltr">I believe there were black-box tests in place to
    > catch this kind of outage but no notifications were made. Testing
    > needs to be added or modified to catch this sort of outage.</span>

  - > <span dir="ltr"></span>

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
<td><span dir="ltr">Add/update black-box testing as needed: <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-5026"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-5026</span></a></span></td>
<td><span dir="ltr">Pulled into Sprint 11</span></td>
</tr>
<tr class="even">
<td><p><span dir="ltr">Update queries to handle large amounts of stale systems:</span></p>
<p><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-5027"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-5027</span></a></span></p></td>
<td><span dir="ltr">Pulled into Sprint 11</span></td>
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

<span dir="ltr"></span>
