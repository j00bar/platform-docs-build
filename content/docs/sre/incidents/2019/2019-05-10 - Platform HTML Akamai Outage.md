---
date: 2019-05-10 22:15:55.051000
title: 2019-05-10 - Platform HTML Akamai Outage
---
# Overview

On 05/10/2019 early-morning EST the front-end Platform stopped serving
all HTML files due to an issue with Akamai.

# What Happened

At 4:30am EST Pete Savage discovered html documents were taking over a
minute to load. Ian Hands was made aware of the incident. To our
knowledge there were no active steps taken by Akamai to resolve the
issue. Pages began loading normally on their own again.

# Resolution

\[NEED INFO\]

# Root Causes

A full RCA from Akamai was
requested:

<https://control.akamai.com/apps/case-management#/cases/F-CS-3429875/view>

# Impact

HTML files were served with a significant delay (1m30s) or not at all
for roughly a half hour. No customer incidents were filed.

# What Went Well?

Pete noticed the problem and was able to get help quickly by calling
people.

# What Didn't Go So Well?

1.  > A consistent test is needed to measure the response times of the
    > HTML pages so that this can be automatically alerted upon.

2.  > We were completely at the mercy of one of our dependencies
    > (Akamai) for the resolution. No active steps were taken by Akamai
    > and the issue resolved itself with time.

3.  > Pete was unaware of the
    > [cloudservices-page@redhat.pagerduty.com](mailto:cloudservices-outage@redhat.pagerduty.com)
    > email to automatically send an agnostic PagerDuty alert to the SRE
    > on duty.

# Action Items

1.  > Create an automated test to measure the response times of the
    > Platform front-end.
    
    1.  > Create alerts when there is significant measured
        > slow-down(done)
    
    2.  > Have the test trigger PD(the UI tests are currently being
        > tested)

2.  > Publicize the existence of the
    > [cloudservices-page@redhat.pagerduty.com](mailto:cloudservices-outage@redhat.pagerduty.com)
    > email better.
