---
date: 2019-02-05 17:10:06.926000
title: 2019-02-03 - Cert Auth Failures
---
## <span dir="ltr">Description and Timeline:</span> 

<span dir="ltr"></span>

**<span dir="ltr">February 3 2019:</span>**

<span dir="ltr"></span>

<span dir="ltr">From Amar Huchchanavar email to insights-prio:  
</span>

*<span dir="ltr">Hello Team,</span>*

<span dir="ltr"></span>

***<span dir="ltr">Data Center Network Maintenance:</span>***
***<span dir="ltr"><span class="underline">https://status.redhat.com/incidents/y9f22rtpr2tf</span></span>***

<span dir="ltr"></span>

*<span dir="ltr">It appears that insights upload URL(
[<span class="underline">https://cert-api.access.redhat.com/r/insights/uploads/</span>](https://cert-api.access.redhat.com/r/insights/uploads/))
is rejecting( 401 Unauthorized) traffic though the system has valid RHSM
registration data.</span>*

*<span dir="ltr">\[Direct, Satellite6, Satellite5 all products are
affected \]</span>*

<span dir="ltr"></span>

*<span dir="ltr">\~\~\~\~</span>*

*<span dir="ltr">2019-02-03 10:30:17,023 INFO insights.client.connection
=== Begin Upload URL Connection Test ===expected type range vector in
call to function "sum\_over\_time"</span>*

*<span dir="ltr">2019-02-03 10:30:17,023 DEBUG
insights.client.connection Testing:
<span class="underline">https://cert-api.access.redhat.com/r/insights/uploads/</span></span>*

*<span dir="ltr">2019-02-03 10:30:22,289 INFO insights.client.connection
HTTP Status Code: 401</span>*

*<span dir="ltr">2019-02-03 10:30:22,289 INFO insights.client.connection
HTTP Status Text: Unauthorized</span>*

*<span dir="ltr">2019-02-03 10:30:22,289 INFO insights.client.connection
HTTP Response Text:</span>*

*<span dir="ltr">2019-02-03 10:30:22,289 INFO insights.client.connection
Connection failed</span>*

*<span dir="ltr">2019-02-03 10:30:22,290 INFO insights.client.connection
=== End Upload URL Connection Test: FAILURE ===</span>*

*<span dir="ltr">\~\~\~\~</span>*

<span dir="ltr"></span>

*<span dir="ltr"><span class="underline">https://status.redhat.com/</span></span>*

*<span dir="ltr">Insights Frontend Stable Operational</span>*

*<span dir="ltr">Insights API Operational</span>*

<span dir="ltr"></span>

<span dir="ltr">Resulted in bugs being opened:
[<span class="underline">https://bugzilla.redhat.com/show\_bug.cgi?id=1672137</span>](https://bugzilla.redhat.com/show_bug.cgi?id=1672137)</span>

<span dir="ltr">“Looks like we are unable to use
[<span class="underline">https://webadmin.corp.redhat.com/subscription-admin/rest/findOwner</span>](https://webadmin.corp.redhat.com/subscription-admin/rest/findOwner)
to map certificate CN to accounts ( getting connect reset
errrors).”</span>

<span dir="ltr"></span>

**<span dir="ltr">February 4, 2019</span>**

<span dir="ltr">Lindani: Issues occurred over the weekend due to the
PHX2 network maintenance.</span>

<span dir="ltr">https://access.redhat.com/documentation/en-us/red\_hat\_enterprise\_linux/5/html/global\_file\_system/s1-manage-direct-io</span>

## <span dir="ltr">Response:</span>

<span dir="ltr">A test was created a while back for an ugly cert-auth
security bug that may be useful in detecting simple failures such as
this one. Currently a ticket exists in the SRE backlog here for its
implementation:
[<span class="underline">https://projects.engineering.redhat.com/browse/RHINSIGHTS-184</span>](https://projects.engineering.redhat.com/browse/RHINSIGHTS-184)</span>

<span dir="ltr"></span>

<span dir="ltr">Ian’s cert-auth test is here:
[<span class="underline">https://github.com/RedHatInsights/cert-test</span>](https://github.com/RedHatInsights/cert-test)</span>

<span dir="ltr"></span>

<span dir="ltr">We’ll try to include this with the other existing tests
that QE is implementing.</span>

<span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>
