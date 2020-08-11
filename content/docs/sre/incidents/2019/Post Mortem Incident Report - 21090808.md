---
date: 2019-08-16 14:39:49.143000
title: Post Mortem Incident Report - 21090808
---
##  Overview

*After midnight on Aug 08, 2019 CEST time Vulnerability outage has been
reported:*

*\* via bugzilla
[Bug 1738717](https://bugzilla.redhat.com/show_bug.cgi?id=1738717)
(00:39 CEST)*

*\* on \#cloudservices-outage slack channel (0:44 CEST)*

*Vulnerability app (UI and API) wasn’t available at all, API calls
returned 500, UI returned Internal Server Error. The issue was caused by
RDS DB running out of space (due to a DB schema upgrade) and not being
available. Normal operation was restored at 9:21am CEST time.*

## What Happened

## Timeline

<table>
<thead>
<tr class="header">
<th><strong>Time (CEST)</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>00:39</td>
<td><em><a href="https://bugzilla.redhat.com/show_bug.cgi?id=1738717"><span class="underline">Bug 1738717</span></a> report</em></td>
</tr>
<tr class="even">
<td>00:44</td>
<td>Outage notification on #cloudservices-outage slack channel</td>
</tr>
<tr class="odd">
<td>02:45</td>
<td>Jonathan Newton sent an e-mail about the outage to Vulnerability PM, Eng Manager, PgM, SRE team</td>
</tr>
<tr class="even">
<td>07:10</td>
<td><p>Vulnerability team noticed the outage</p>
<p>tlestach restarted the manager pod and noticed no connection to the RDS DB</p>
<p>tlestach wrote to team (#insights-vmaas) slack channel and notified jdobes per IM</p></td>
</tr>
<tr class="odd">
<td>07:50</td>
<td>Vulnerability team (jdobes) arrived to the Brno office to address the issue</td>
</tr>
<tr class="even">
<td>07:55</td>
<td>Root cause identified</td>
</tr>
<tr class="odd">
<td>08:44</td>
<td>Ticket to cloudservices-page to request assistance</td>
</tr>
<tr class="even">
<td>09:12</td>
<td>jharting increased RDS DB allocation to 200GB</td>
</tr>
<tr class="odd">
<td>9:21</td>
<td>Vulnerability APP operation restored</td>
</tr>
</tbody>
</table>

## Resolution

*Increase of RDS DB disk space fixed the issue.*

## Root Causes

*During an upgrade of Vulnerability Engine major DB schema changes
needed to be applied. To minimize downtime, many of the DB schema
upgrade steps were done manually during normal operation of
Vulnerability App before the actual upgrade. These steps were executed
during multiple (4) days.*

*During one of the manual steps triggered around 6pm (INSERT COLUMN and
initialize its values) the DB run out of space after midnight and become
unresponsive. This caused API and consequently UI to be unavailable.*

## Impact

*Vulnerability App wasn’t available. No data was lost, exposed or
compromised. Customers couldn’t access neither app’s API nor UI to
detect affected vulnerabilities and schedule remediation plans. The
outage was between 6:39pm - 3:20am EDT - outside of regular working
hours in EDT.*

*No customer case has been associated with the reported bug. The team
hasn’t heard about any customer that would notice the outage.*

*The outage increased error budget from Vulnerability SLO/SLA.*

## What went well?

  - > It was quite clear, what happened:
    
      - > “storage full error on the DB in AWS” was identified already
        > by the Platform team at 2:50am
    
      - > after manager service restart the DB wasn’t available

  - > tlestach notified jdobes about the issue, jdobes immediately
    > reacted and was able to be in the office in 40 mins

  - > Quick root cause confirmation

  - > Platform Page-duty mechanism works (khoes woken up)

  - > After a person with appropriate permissions in AWS console was
    > found (jharting), the fix was pretty straightforward (took 5mins.)

## What didn’t go so well?

  - > Vulnerability had no access to RDS DB admin interface to monitor
    > available RDS DB space

  - > Platform team identified the issue, but had no way to notify the
    > Vulnerability team

  - > When the Platform team noticed the Vulnerability outage and
    > identified the issue, would it be not / ok to fix the identified
    > storage issue right away?

  - > Vulnerability team couldn’t fix the issue on their own, needed
    > Platform (or anybody with Amazon RDS edit permissions) to increase
    > the RDS DB space for them

  - > Platform team wasn’t aware of the ongoing DB schema upgrade and
    > why the space ran out so fast

## Action Items

<table>
<thead>
<tr class="header">
<th><strong>Action Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Monitor RDS disk space usage in Grafana, set alert to vulnerability Slack channel if used space exceeds 90 %</td>
<td>DONE</td>
</tr>
<tr class="even">
<td>Created ticket to grant access to AWS management console to manage vulnerability-engine storage (<a href="https://projects.engineering.redhat.com/browse/RHIOPS-351"><span class="underline">RHIOPS-351</span></a>)</td>
<td>IN PROGRESS</td>
</tr>
<tr class="odd">
<td>Figure out, how to let Vulnerability team know about Vulnerability issues in the future</td>
<td></td>
</tr>
<tr class="even">
<td>When the Platform team noticed the Vulnerability outage and identified the issue, would it be not / ok to fix the identified storage issue right away?</td>
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
