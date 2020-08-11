---
date: 2019-04-02 13:22:35.663000
title: 2019-03-25 - DB Sev1 Outage
---
# Overview

On 03/25/2019 Insights Classic experienced a Sev1 outage incident.

# What Happened

Users of Insights Classic began receiving 500 errors when attempting to
access the /status and /me endpoints of the API. This made the
application unusable.

It was determined that the API was failing due to an [abnormally large
query load](http://pastebin.test.redhat.com/743762) hanging the
database.

# Resolution

The DB was bounced and the abnormally large requests were cleared.
Performance went back to normal.

# Root Causes

An abnormally large query causes the DB to slow down and become
unresponsive. The query seems to be running on a schedule as further
outages have been caused due to it on 03/29/2019 and 04/01/2019. Dan Kuc
is tracking down the source of the query but in the meantime has added
an index to an additional table the query is run against in an effort to
mitigate any further slowdowns. Chris Kyrouac also upgraded the RDS size
on 04/01/2019. Ultimately the goal is to find the source of the query
and either remove it or amend it to fix the problem.

# Impact

Support reported Severity 1 cases during the outage.

Insights Classic was reported down around 10:30am EST and was back up
with degraded performance around 11am once the DB was bounced. Full
performance was restored around 1pm.

# What Went Well?

This was our first incident where we attempted to implement some of the
procedures we’ve been working on as an SRE team. An email was sent out
to cloudservices-outage-list and insights-prio. [A Jira ticket was
created](https://projects.engineering.redhat.com/browse/RHCLOUD-522).
All communication regarding the outage was done in the new
\#cloudservices-outage Slack channel.

Support was involved and updated on progress.

# What Didn't Go So Well?

# Action Items

More monitoring was added on Amazon to the Insights Classic database.
