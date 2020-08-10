---
date: 2019-05-10 18:15:55.051000
title: 2019-05-10 - Platform HTML Akamai Outage
---
# <span dir="ltr">Overview</span>

<span dir="ltr">On 05/10/2019 early-morning EST the front-end Platform
stopped serving all HTML files due to an issue with Akamai.</span>

# <span dir="ltr">What Happened</span>

<span dir="ltr">At 4:30am EST Pete Savage discovered html documents were
taking over a minute to load. Ian Hands was made aware of the incident.
To our knowledge there were no active steps taken by Akamai to resolve
the issue. Pages began loading normally on their own again.</span>

# <span dir="ltr">Resolution</span>

<span dir="ltr">\[NEED INFO\]</span>

# <span dir="ltr">Root Causes</span>

<span dir="ltr">A full RCA from Akamai was requested:</span>

<span dir="ltr">[<span class="underline">https://control.akamai.com/apps/case-management\#/cases/F-CS-3429875/view</span>](https://control.akamai.com/apps/case-management#/cases/F-CS-3429875/view)</span>

# <span dir="ltr">Impact</span>

<span dir="ltr">HTML files were served with a significant delay (1m30s)
or not at all for roughly a half hour. No customer incidents were
filed.</span>

# <span dir="ltr">What Went Well?</span>

<span dir="ltr">Pete noticed the problem and was able to get help
quickly by calling people.</span>

# <span dir="ltr">What Didn't Go So Well?</span>

1.  > <span dir="ltr">A consistent test is needed to measure the
    > response times of the HTML pages so that this can be automatically
    > alerted upon.</span>

2.  > <span dir="ltr">We were completely at the mercy of one of our
    > dependencies (Akamai) for the resolution. No active steps were
    > taken by Akamai and the issue resolved itself with time.</span>

3.  > <span dir="ltr">Pete was unaware of the
    > [<span class="underline">cloudservices-page@redhat.pagerduty.com</span>](mailto:cloudservices-outage@redhat.pagerduty.com)
    > email to automatically send an agnostic PagerDuty alert to the SRE
    > on duty.</span>

# <span dir="ltr">Action Items</span>

1.  > <span dir="ltr">Create an automated test to measure the response
    > times of the Platform front-end.</span>
    
    1.  > <span dir="ltr">Create alerts when there is significant
        > measured slow-down(done)</span>
    
    2.  > <span dir="ltr">Have the test trigger PD(the UI tests are
        > currently being tested)</span>

2.  > <span dir="ltr">Publicize the existence of the
    > [<span class="underline">cloudservices-page@redhat.pagerduty.com</span>](mailto:cloudservices-outage@redhat.pagerduty.com)
    > email better.</span>

> <span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>
