---
date: 2019-04-02 09:22:35.663000
title: 2019-03-25 - DB Sev1 Outage
---
# <span dir="ltr">Overview</span>

<span dir="ltr">On 03/25/2019 Insights Classic experienced a Sev1 outage
incident.</span>

# <span dir="ltr">What Happened</span>

<span dir="ltr">Users of Insights Classic began receiving 500 errors
when attempting to access the /status and /me endpoints of the API. This
made the application unusable.</span>

<span dir="ltr"></span>

<span dir="ltr">It was determined that the API was failing due to an
[<span class="underline">abnormally large query
load</span>](http://pastebin.test.redhat.com/743762) hanging the
database.</span>

# <span dir="ltr">Resolution</span>

<span dir="ltr">The DB was bounced and the abnormally large requests
were cleared. Performance went back to normal.</span>

# <span dir="ltr">Root Causes</span>

<span dir="ltr">An abnormally large query causes the DB to slow down and
become unresponsive. The query seems to be running on a schedule as
further outages have been caused due to it on 03/29/2019 and 04/01/2019.
Dan Kuc is tracking down the source of the query but in the meantime has
added an index to an additional table the query is run against in an
effort to mitigate any further slowdowns. Chris Kyrouac also upgraded
the RDS size on 04/01/2019. Ultimately the goal is to find the source of
the query and either remove it or amend it to fix the problem.</span>

# <span dir="ltr">Impact</span>

<span dir="ltr">Support reported Severity 1 cases during the
outage.</span>

<span dir="ltr"></span>

<span dir="ltr">Insights Classic was reported down around 10:30am EST
and was back up with degraded performance around 11am once the DB was
bounced. Full performance was restored around 1pm.</span>

# <span dir="ltr">What Went Well?</span>

<span dir="ltr">This was our first incident where we attempted to
implement some of the procedures we’ve been working on as an SRE team.
An email was sent out to cloudservices-outage-list and insights-prio.
[<span class="underline">A Jira ticket was
created</span>](https://projects.engineering.redhat.com/browse/RHCLOUD-522).
All communication regarding the outage was done in the new
\#cloudservices-outage Slack channel.</span>

<span dir="ltr"></span>

<span dir="ltr">Support was involved and updated on progress.</span>

# <span dir="ltr">What Didn't Go So Well?</span>

# <span dir="ltr">Action Items</span>

<span dir="ltr">More monitoring was added on Amazon to the Insights
Classic database.</span>

<span dir="ltr"></span>
