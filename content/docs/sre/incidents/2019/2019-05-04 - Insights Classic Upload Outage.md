---
date: 2019-05-06 14:26:24.885000
title: 2019-05-04 - Insights Classic Upload Outage
---
# Overview

On 05/04/2019 Insights Classic was unable to receive new uploads for
roughly 15 hours.

# What Happened

Messages made it into RabbitMQ but the API timed out waiting on a
response from the engine, thus losing the context for the upload request
and thus losing the result data that would have been produced.

This did not affect the new Platform or Insights as those uploads were
forked successfully before this bottleneck.

# Resolution

The engine was bounced and uploads began to flow again.

# Root Causes

On the Friday night prior to the Saturday outage the engine’s resources
were expanded and may have caused the interrupted flow when it didn’t
scale as expected.

RCA is difficult to perform due to lack of logs since the ES instance in
the cluster is not working.

# Impact

Customer uploads for the 15 hour downtime were lost and results were not
persisted in Insights Legacy.

# What Went Well?

The problem was promptly resolved once it was identified.

# What Didn't Go So Well?

The lack of logs leaves us with little to go on when we investigate
issues. OSD’s Kibana logs are largely useless.

There was no alert of any kind that uploads weren’t working;
Jeff/Lindani just happened upon the problem. This could have been
resolved much quicker with much less data loss had we known about the
issue when it started happening. Since a simple engine restart fixed
this problem, it would have been even better if we had a playbook to
bounce the engine automatically.

# Action Items

1.  > **Add some form of reliable logging. **
    
    1.  > \[In process\] Cloudwatch is being added as an alternative to
        > OSD’s Kibana on most components and apps.

2.  > Monitor Classic uploads and alert when there’s a large drop-off.
    
    2.  > Klape wrote a black box script that does a simple upload ever
        > 15s. More info here:
        > <https://ansible.slack.com/archives/CHVF77L79/p1557085192126400>
