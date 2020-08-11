---
date: 2019-02-05 22:10:06.926000
title: 2019-02-03 - Cert Auth Failures
---
## Description and Timeline: 

**February 3 2019:**

From Amar Huchchanavar email to insights-prio:

*Hello Team,*

***Data Center Network Maintenance:***
***https://status.redhat.com/incidents/y9f22rtpr2tf***

*It appears that insights upload URL(
<https://cert-api.access.redhat.com/r/insights/uploads/>) is rejecting(
401 Unauthorized) traffic though the system has valid RHSM registration
data.*

*\[Direct, Satellite6, Satellite5 all products are affected \]*

*~~~~*

*2019-02-03 10:30:17,023 INFO insights.client.connection === Begin
Upload URL Connection Test ===expected type range vector in call to
function "sum\_over\_time"*

*2019-02-03 10:30:17,023 DEBUG insights.client.connection Testing:*
*https://cert-api.access.redhat.com/r/insights/uploads/*

*2019-02-03 10:30:22,289 INFO insights.client.connection HTTP Status
Code: 401*

*2019-02-03 10:30:22,289 INFO insights.client.connection HTTP Status
Text: Unauthorized*

*2019-02-03 10:30:22,289 INFO insights.client.connection HTTP Response
Text: *

*2019-02-03 10:30:22,289 INFO insights.client.connection Connection
failed*

*2019-02-03 10:30:22,290 INFO insights.client.connection === End Upload
URL Connection Test: FAILURE ===*

*~~~~*

*https://status.redhat.com/ *

*Insights Frontend Stable Operational*

*Insights API Operational*

Resulted in bugs being opened:
<https://bugzilla.redhat.com/show_bug.cgi?id=1672137>

“Looks like we are unable to use
<https://webadmin.corp.redhat.com/subscription-admin/rest/findOwner> to
map certificate CN to accounts ( getting connect reset errrors).”

**February 4, 2019**

Lindani: Issues occurred over the weekend due to the PHX2 network
maintenance.

https://access.redhat.com/documentation/en-us/red\_hat\_enterprise\_linux/5/html/global\_file\_system/s1-manage-direct-io

## Response:

A test was created a while back for an ugly cert-auth security bug that
may be useful in detecting simple failures such as this one. Currently a
ticket exists in the SRE backlog here for its implementation:
<https://projects.engineering.redhat.com/browse/RHINSIGHTS-184>

Ian’s cert-auth test is here:
<https://github.com/RedHatInsights/cert-test>

We’ll try to include this with the other existing tests that QE is
implementing.
