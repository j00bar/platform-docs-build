---
date: 2019-10-11 15:05:07.334000
title: 2019-09-24 Uploads fail with response code 503 or 504
---
# Overview

An alert fired at 2019-09-24T17:21:00Z due to upload failures with
response codes of 503 and 504.

# What Happened

All requests to the production cluster were intermittently receiving
HTTP 503 and 504 response codes from Akamai. Taking one of the Akamai
reference IDs from a response and querying Akamai for it revealed that
the upstream server dropped the connection.

# Resolution

The issue seemed to resolve on its own.

# Root Causes

Haproxy seemed to be the root cause since it has to be the service
dropping connections since it is what Akamai directly connect to.

# Impact

Some requests failed and had to be retried.

# What Went Well?

The alert fired.

# What Didn't Go So Well?

1.  > The root cause was never determined because of the difficulty to
    > debug our haproxy router. We could have filed a ticket with OSD,
    > but the issue seemed to resolve itself before we reached this
    > point.

# Action Items

Unfortunately there were no actions to take since RCA was never
determined
