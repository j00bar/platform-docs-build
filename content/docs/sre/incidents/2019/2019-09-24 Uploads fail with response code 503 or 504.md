---
date: 2019-10-11 11:05:07.334000
title: 2019-09-24 Uploads fail with response code 503 or 504
---
# <span dir="ltr">Overview</span>

<span dir="ltr">An alert fired at 2019-09-24T17:21:00Z due to upload
failures with response codes of 503 and 504.</span>

# <span dir="ltr">What Happened</span>

<span dir="ltr">All requests to the production cluster were
intermittently receiving HTTP 503 and 504 response codes from Akamai.
Taking one of the Akamai reference IDs from a response and querying
Akamai for it revealed that the upstream server dropped the
connection.</span>

# <span dir="ltr">Resolution</span>

<span dir="ltr">The issue seemed to resolve on its own.</span>

# <span dir="ltr">Root Causes</span>

<span dir="ltr">Haproxy seemed to be the root cause since it has to be
the service dropping connections since it is what Akamai directly
connect to.</span>

# <span dir="ltr">Impact</span>

<span dir="ltr">Some requests failed and had to be retried.</span>

# <span dir="ltr">What Went Well?</span>

<span dir="ltr">The alert fired.</span>

# <span dir="ltr">What Didn't Go So Well?</span>

1.  > <span dir="ltr">The root cause was never determined because of the
    > difficulty to debug our haproxy router. We could have filed a
    > ticket with OSD, but the issue seemed to resolve itself before we
    > reached this point.</span>

# <span dir="ltr">Action Items</span>

<span dir="ltr">Unfortunately there were no actions to take since RCA
was never determined</span>

<span dir="ltr"></span>

<span dir="ltr"></span>
