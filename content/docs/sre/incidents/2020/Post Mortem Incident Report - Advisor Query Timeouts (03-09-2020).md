---
date: 2020-06-17 19:10:19.627000
title: Post Mortem Incident Report - Advisor Query Timeouts (03-09-2020)
---
## Overview

On Monday the 9th we began receiving reports that Insights was
displaying 504 errors

## What Happened

Over the weekend the advisor culling routine marked a million systems as
stale. This caused the API queries to time out as they tried to handle
filtering them out. An update was pushed changing the queries and
brought production back up.

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
<td>7:06am</td>
<td>Amar asks via Wormhole about the 504 errors he’s seeing</td>
</tr>
<tr class="even">
<td>8am</td>
<td>Mark Huth begins investigating the logs</td>
</tr>
<tr class="odd">
<td>8:55am</td>
<td>Dan Kuc reboots the DB but problem persists</td>
</tr>
<tr class="even">
<td>9:30am</td>
<td>Dan identifies the cause - API queries are timing out due to the sudden marking of stale systems over the weekend. Begins working on a code workaround</td>
</tr>
<tr class="odd">
<td>9:50am</td>
<td>Code is pushed to github and pushed through to Prod with the help of Bran</td>
</tr>
<tr class="even">
<td>10:00am</td>
<td>Build begins</td>
</tr>
<tr class="odd">
<td>10:05am</td>
<td>Patch successfully alleviates the 504 errors</td>
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

A patch was pushed to production that fixed the problem:
<https://github.com/RedHatInsights/insights-advisor-api/pull/480>

## Root Causes

The queries made in the API could not filter the sudden appearance of a
million stale systems.

## Impact

Insights was unusable as the /rules and /stats endpoints returned 504
errors. We received multiple queries regarding the outage from customers
via Support.

BZ: <https://bugzilla.redhat.com/show_bug.cgi?id=1811665>

## What went well?

*List anything you think we did well and want to call out. It's okay to
not list anything.*

  - > We were able to force a patch through production quickly once the
    > problem was identified.

  - 
## What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

  - > I believe there were black-box tests in place to catch this kind
    > of outage but no notifications were made. Testing needs to be
    > added or modified to catch this sort of outage.

  - 
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
<td>Add/update black-box testing as needed: <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-5026"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-5026</span></a></td>
<td>Pulled into Sprint 11</td>
</tr>
<tr class="even">
<td><p>Update queries to handle large amounts of stale systems:</p>
<p><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-5027"><span class="underline">https://projects.engineering.redhat.com/browse/RHCLOUD-5027</span></a></p></td>
<td>Pulled into Sprint 11</td>
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
