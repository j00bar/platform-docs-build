---
date: 2020-07-17 12:22:59.104000
title: Patch Post Mortem - cloud.redhat.com
---
## Overview

On July, 9th, Patch application was not responsive to any requests
because the database connection destabilized due to incorrect login
credentials for each component. The cause of the issue was generating
various users at the startup, and creating OSDv4 for Patch caused the v3
password to be out of sync. The issue was resolved after 2 hours.

## What Happened

*I got an alert on both \#alerts-patchman and
\#alerts-cloudservices-apps (check messages "Thursday, July 9th"). First
alert reports there are 5xx responses followed by lag delta \> 100 and
later it got to the restart loop. I opened Openshift and saw that
manager and listener are red - as per logs the manager was reporting
"PostgreSQL not available" and listener "Incorrect DB password". *

*The problem was that the OSDv4 was created for Patch app and as there
are various users created on each startup (or passwords updated if the
user already exists), the v3 stopped working as it could not access DB.*

## Contributing Factors

*With each startup, passwords are regenerated due to advanced security.
This password got out of sync because OSDv4 was created for Patch =\>
either v3 or v4 worked, not both.*

## Resolution

*Short-term - turned off v4 for Patch and prioritized v3 (which is
production)*

*Long-term - passwords were synchronized to use the same credentials
across v3 and v4*

## Impact

*Be specific here. Include numbers such as customers affected, cost to
business, etc.*

*Example template*

<table>
<tbody>
<tr class="odd">
<td>Time in SEV-1</td>
<td>0mins</td>
</tr>
<tr class="even">
<td>Time in SEV-2</td>
<td>120mins</td>
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
<td>3:00PM</td>
<td>First alert reporting 5xx in prod followed by “pod restarting permanently”</td>
</tr>
<tr class="even">
<td>3:10PM</td>
<td>Investigation started</td>
</tr>
<tr class="odd">
<td>3:41PM</td>
<td>Insights SRE helps to troubleshoot the issue, checking in RDS</td>
</tr>
<tr class="even">
<td>4:14PM</td>
<td>Wired in bsquizz and aarif as the issue seemed related to OSDv4</td>
</tr>
<tr class="odd">
<td>4:56PM</td>
<td>App back up and running</td>
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

  - > Cross team cooperation

  - > Alerts worked as expected

  - > Quickly identified the cause

  - > Turned prod back up in a reasonable time

### What didn’t go so well?

  - > Restricted access to RDS

  - > No alerts defined that identified the real problem - only generic
    > messages

  - > Alerts that did fire were not “real”

## Action Items

*In progress*

<table>
<thead>
<tr class="header">
<th><strong>Action Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Bubbling error messages to alerts</td>
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
