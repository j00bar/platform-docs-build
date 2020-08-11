---
date: 2019-10-11 15:19:09.005000
title: 2019-09-26 Satellite-managed hosts had outage
---
# Overview

On Sep. 26, 2019 at 1205Z, [an
alert](https://ansible.slack.com/archives/CGYK5EZ37/p1569499535149500)
[in PagerDuty](https://redhat.pagerduty.com/incidents/PK5L85J) was
triggered from Payload Tracker with the name
UploadElapsedTimesTooLongHard. At roughly the same time [Bryan Kearney
started
reporting](https://ansible.slack.com/archives/CDVFMQU31/p1569499316054400)
that Insights classic was down, which was noticed when he was trying to
use Insights from a Satellite installation. At 1249Z, Dan Kuc
[reported](https://ansible.slack.com/archives/CDVFMQU31/p1569502216074600)
he fixed the problem by restarting the Redis deployment associated with
the Insights API deployment in production.

## What Happened

I*n this section of the Root Cause Analysis you are to provide a
detailed chronology of the events leading up to, and following, the
problem. Be sure to include names, times and detailed descriptions of
all activities.*

  - > at ~1100Z the insights-pup-127-gv9tx pod went into a "bad" state
    > where it started processing archives very slowly. [CPU usage was
    > high](https://prometheus-mnm.1b13.insights.openshiftapps.com/graph?g0.range_input=2d&g0.end_input=2019-09-27%2006%3A37&g0.expr=rate\(container_cpu_user_seconds_total%7Bpod_name%3D%22insights-pup-127-gv9tx%22%2Ccontainer_name%3D%22%22%7D%5B1h%5D\)&g0.tab=0)
    > until [it got
    > OOMKilled](https://kibana-kibana.1b13.insights.openshiftapps.com/app/kibana#/discover?_g=\(refreshInterval:\(pause:!t,value:0\),time:\(from:'2019-09-27T03:47:45.233Z',mode:absolute,to:'2019-09-27T03:47:55.233Z'\)\)&_a=\(columns:!\('@message'\),index:'0a2575c0-65f9-11e9-ba88-097c6c9f6850',interval:auto,query:\(language:lucene,query:'@log_stream:+%22dedicated-reader%22'\),sort:!\('@timestamp',desc\)\)).

  - > It looks like the readiness check for redis had been
    > intermittently failing for several days, but [it started
    > consistently failing at 1117Z On
    > Sep 26](https://kibana-kibana.1b13.insights.openshiftapps.com/app/kibana#/discover?_g=\(refreshInterval:\(pause:!t,value:0\),time:\(from:now-2d,mode:relative,to:now\)\)&_a=\(columns:!\('@message'\),index:'0a2575c0-65f9-11e9-ba88-097c6c9f6850',interval:auto,query:\(language:lucene,query:'@log_stream:+%22dedicated-reader%22+AND+%22redis%22+AND+%22insights-prod%22'\),sort:!\('@timestamp',asc\)\)),
    > triggering all requests that required a subset lookup to fail.
    > This would include any upload from a satellite-managed system.

  - > Based on [payload tracker metrics from the outage
    > window](https://metrics.1b13.insights.openshiftapps.com/d/eGSUe-SZk/payload-tracker?orgId=1&from=1569496622000&to=1569502835723),
    > redis didn't seem to become completely unresponsive until ~1155Z.

  - > During this outage window, the only archives that are being
    > processed are uploads that come from non-satellite-managed hosts
    > (a small percentage) or archives that complete processing from the
    > slow-running pup pod. This skews the metrics in the payload
    > tracker much higher since there are very few "normal" archives to
    > anchor the timing metrics.

  - > At 1205Z the UploadElapsedTimesTooLongHard metric threshold (1
    > hour) had been exceeded for 5 minutes, triggering a PagerDuty
    > incident.

  - > At 1245Z Dan Kuc scaled the redis deployment config to 0 and back
    > to 1 to bounce the redis deployment.

  - > Archives started being admitted in to the platform again, pulling
    > the upload duration metric back down under the threshold.

  - > The slow pup pod continues to churn through its queue of archives
    > until it catches up at roughly 1500Z.

  - > The slow pup pod is OOMKilled at 0347Z on Sep 27, roughly around
    > the beginning of the nightly load spike, implicitly restarting the
    > container and clearing the bad state that caused the performance
    > degradation.

## Resolution

Dan Kuc restarted the redis deloyment in the insights-prod project.

## Root Causes

The root cause of the pup runaway thread is still unknown, but since
puptoo is going to be deployed soon, replacing the pup deployment,
finding a root cause is probably not worth the effort.

The root cause of the redis failure is still unknown, but taking
corrective actions to detect the problem before it causes an outage will
significantly mitigate the impact of the issue, perhaps even removing
the need to determine the root cause.

## Impact

All requests to Insights Classic from a Satellite-managed host failed.
This caused some hosts to not check in for a day and also caused web
requests from Satellite UIs to fail.

## What Went Well?

  - > The payload tracker alerted us of the issue.

  - > The resolution was simple and quick

## What Didn’t Go So Well?

  - > Confusion due to seemingly unrelated issues

  - > BK had to ping us to look

## Action Items

  - > The redis pod readiness check was failing leading up to the
    > outage. We should find a metric on that and write an alert for it

  - > [Adding golden signal metrics on
    > insights-api](https://projects.engineering.redhat.com/browse/RHCLOUD-1735?jql=project%20%3D%20RHCLOUD%20AND%20text%20~%20%22metrics%22%20AND%20assignee%20in%20\(rbrantle\))
    > will allow us to create alerts for error rate and latency on
    > Insights Classic, thus detecting this problem when it happens,
    > rather than waiting for BK to tell us

  - > Replacing pup with puptoo will hopefully resolve the resource
    > issue seen when processing uploads

  - > Add a report to Payload Tracker to view upload durations, sorted
    > from longest to shortest.

  - > [Insights-client returned a 0 status
    > code](https://ansible.slack.com/archives/CDVFMQU31/p1569500772062400)
    > when insights-api returned a status 500. This should be fixed.

  - > Perhaps add metric/alert for pup

  - > Consider failing over to bypassing redis if it starts failing
