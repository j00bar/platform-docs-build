---
date: 2019-08-16 10:39:49.143000
title: Post Mortem Incident Report - 21090808
---
##  <span dir="ltr">Overview</span>

*<span dir="ltr">After midnight on Aug 08, 2019 CEST time Vulnerability
outage has been reported:</span>*

*<span dir="ltr">\* via bugzilla [<span class="underline">Bug
1738717</span>](https://bugzilla.redhat.com/show_bug.cgi?id=1738717)
(00:39 CEST)</span>*

*<span dir="ltr">\* on \#cloudservices-outage slack channel (0:44
CEST)</span>*

*<span dir="ltr">Vulnerability app (UI and API) wasn’t available at all,
API calls returned 500, UI returned Internal Server Error. The issue was
caused by RDS DB running out of space (due to a DB schema upgrade) and
not being available. Normal operation was restored at 9:21am CEST
time.</span>*

## <span dir="ltr">What Happened</span>

## <span dir="ltr">Timeline</span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Time (CEST)</span></strong></th>
<th><strong><span dir="ltr">Notes</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">00:39</span></td>
<td><span dir="ltr"><em><a href="https://bugzilla.redhat.com/show_bug.cgi?id=1738717"><span class="underline">Bug 1738717</span></a> report</em></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">00:44</span></td>
<td><span dir="ltr">Outage notification on #cloudservices-outage slack channel</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">02:45</span></td>
<td><span dir="ltr">Jonathan Newton sent an e-mail about the outage to Vulnerability PM, Eng Manager, PgM, SRE team</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">07:10</span></td>
<td><p><span dir="ltr">Vulnerability team noticed the outage</span></p>
<p><span dir="ltr">tlestach restarted the manager pod and noticed no connection to the RDS DB</span></p>
<p><span dir="ltr">tlestach wrote to team (#insights-vmaas) slack channel and notified jdobes per IM</span></p></td>
</tr>
<tr class="odd">
<td><span dir="ltr">07:50</span></td>
<td><span dir="ltr">Vulnerability team (jdobes) arrived to the Brno office to address the issue</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">07:55</span></td>
<td><span dir="ltr">Root cause identified</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">08:44</span></td>
<td><span dir="ltr">Ticket to cloudservices-page to request assistance</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">09:12</span></td>
<td><span dir="ltr">jharting increased RDS DB allocation to 200GB</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:21</span></td>
<td><span dir="ltr">Vulnerability APP operation restored</span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

## <span dir="ltr">Resolution</span>

*<span dir="ltr">Increase of RDS DB disk space fixed the issue.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Root Causes</span>

*<span dir="ltr">During an upgrade of Vulnerability Engine major DB
schema changes needed to be applied. To minimize downtime, many of the
DB schema upgrade steps were done manually during normal operation of
Vulnerability App before the actual upgrade. These steps were executed
during multiple (4) days.</span>*

*<span dir="ltr">During one of the manual steps triggered around 6pm
(INSERT COLUMN and initialize its values) the DB run out of space after
midnight and become unresponsive. This caused API and consequently UI to
be unavailable.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Impact</span>

*<span dir="ltr">Vulnerability App wasn’t available. No data was lost,
exposed or compromised. Customers couldn’t access neither app’s API nor
UI to detect affected vulnerabilities and schedule remediation plans.
The outage was between 6:39pm - 3:20am EDT - outside of regular working
hours in EDT.</span>*

*<span dir="ltr">No customer case has been associated with the reported
bug. The team hasn’t heard about any customer that would notice the
outage.</span>*

*<span dir="ltr">The outage increased error budget from Vulnerability
SLO/SLA.</span>*

<span dir="ltr"></span>

## <span dir="ltr">What went well?</span>

  - > <span dir="ltr">It was quite clear, what happened:</span>
    
      - > <span dir="ltr">“storage full error on the DB in AWS” was
        > identified already by the Platform team at 2:50am</span>
    
      - > <span dir="ltr">after manager service restart the DB wasn’t
        > available</span>

  - > <span dir="ltr">tlestach notified jdobes about the issue, jdobes
    > immediately reacted and was able to be in the office in 40
    > mins</span>

  - > <span dir="ltr">Quick root cause confirmation</span>

  - > <span dir="ltr">Platform Page-duty mechanism works (khoes woken
    > up)</span>

  - > <span dir="ltr">After a person with appropriate permissions in AWS
    > console was found (jharting), the fix was pretty straightforward
    > (took 5mins.)</span>

<span dir="ltr"></span>

## <span dir="ltr">What didn’t go so well?</span>

  - > <span dir="ltr">Vulnerability had no access to RDS DB admin
    > interface to monitor available RDS DB space</span>

  - > <span dir="ltr">Platform team identified the issue, but had no way
    > to notify the Vulnerability team</span>

  - > <span dir="ltr">When the Platform team noticed the Vulnerability
    > outage and identified the issue, would it be not / ok to fix the
    > identified storage issue right away?</span>

  - > <span dir="ltr">Vulnerability team couldn’t fix the issue on their
    > own, needed Platform (or anybody with Amazon RDS edit permissions)
    > to increase the RDS DB space for them</span>

  - > <span dir="ltr">Platform team wasn’t aware of the ongoing DB
    > schema upgrade and why the space ran out so fast</span>

<span dir="ltr"></span>

> <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Action Items</span>

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
<td><span dir="ltr">Monitor RDS disk space usage in Grafana, set alert to vulnerability Slack channel if used space exceeds 90 %</span></td>
<td><span dir="ltr">DONE</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Created ticket to grant access to AWS management console to manage vulnerability-engine storage (<a href="https://projects.engineering.redhat.com/browse/RHIOPS-351"><span class="underline">RHIOPS-351</span></a>)</span></td>
<td><span dir="ltr">IN PROGRESS</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Figure out, how to let Vulnerability team know about Vulnerability issues in the future</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">When the Platform team noticed the Vulnerability outage and identified the issue, would it be not / ok to fix the identified storage issue right away?</span></td>
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
