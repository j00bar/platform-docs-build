---
date: 2019-05-06 10:26:24.885000
title: 2019-05-04 - Insights Classic Upload Outage
---
# <span dir="ltr">Overview</span>

<span dir="ltr">On 05/04/2019 Insights Classic was unable to receive new
uploads for roughly 15 hours.</span>

# <span dir="ltr">What Happened</span>

<span dir="ltr">Messages made it into RabbitMQ but the API timed out
waiting on a response from the engine, thus losing the context for the
upload request and thus losing the result data that would have been
produced.</span>

<span dir="ltr"></span>

<span dir="ltr">This did not affect the new Platform or Insights as
those uploads were forked successfully before this bottleneck.</span>

# <span dir="ltr">Resolution</span>

<span dir="ltr">The engine was bounced and uploads began to flow
again.</span>

# <span dir="ltr">Root Causes</span>

<span dir="ltr">On the Friday night prior to the Saturday outage the
engine’s resources were expanded and may have caused the interrupted
flow when it didn’t scale as expected.</span>

<span dir="ltr"></span>

<span dir="ltr">RCA is difficult to perform due to lack of logs since
the ES instance in the cluster is not working.</span>

# <span dir="ltr">Impact</span>

<span dir="ltr">Customer uploads for the 15 hour downtime were lost and
results were not persisted in Insights Legacy.</span>

# <span dir="ltr">What Went Well?</span>

<span dir="ltr">The problem was promptly resolved once it was
identified.</span>

# <span dir="ltr">What Didn't Go So Well?</span>

<span dir="ltr">The lack of logs leaves us with little to go on when we
investigate issues. OSD’s Kibana logs are largely useless.</span>

<span dir="ltr"></span>

<span dir="ltr">There was no alert of any kind that uploads weren’t
working; Jeff/Lindani just happened upon the problem. This could have
been resolved much quicker with much less data loss had we known about
the issue when it started happening. Since a simple engine restart fixed
this problem, it would have been even better if we had a playbook to
bounce the engine automatically.</span>

# <span dir="ltr">Action Items</span>

1.  > **<span dir="ltr">Add some form of reliable logging.</span>**
    
    1.  > <span dir="ltr">\[In process\] Cloudwatch is being added as an
        > alternative to OSD’s Kibana on most components and
        > apps.</span>

2.  > <span dir="ltr">Monitor Classic uploads and alert when there’s a
    > large drop-off.</span>
    
    2.  > <span dir="ltr">Klape wrote a black box script that does a
        > simple upload ever 15s. More info here:
        > [<span class="underline">https://ansible.slack.com/archives/CHVF77L79/p1557085192126400</span>](https://ansible.slack.com/archives/CHVF77L79/p1557085192126400)</span>

> <span dir="ltr"></span>

<span dir="ltr"></span>
