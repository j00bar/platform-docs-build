---
date: 2019-10-11 11:19:09.005000
title: 2019-09-26 Satellite-managed hosts had outage
---
# <span dir="ltr">Overview</span>

<span dir="ltr"></span>

<span dir="ltr">On Sep. 26, 2019 at 1205Z, [<span class="underline">an
alert</span>](https://ansible.slack.com/archives/CGYK5EZ37/p1569499535149500)
[<span class="underline">in
PagerDuty</span>](https://redhat.pagerduty.com/incidents/PK5L85J) was
triggered from Payload Tracker with the name
UploadElapsedTimesTooLongHard. At roughly the same time
[<span class="underline">Bryan Kearney started
reporting</span>](https://ansible.slack.com/archives/CDVFMQU31/p1569499316054400)
that Insights classic was down, which was noticed when he was trying to
use Insights from a Satellite installation. At 1249Z, Dan Kuc
[<span class="underline">reported</span>](https://ansible.slack.com/archives/CDVFMQU31/p1569502216074600)
he fixed the problem by restarting the Redis deployment associated with
the Insights API deployment in production.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">I*n this section of the Root Cause Analysis you are to
provide a detailed chronology of the events leading up to, and
following, the problem. Be sure to include names, times and detailed
descriptions of all activities.*</span>

<span dir="ltr"></span>

  - > <span dir="ltr">at \~1100Z the insights-pup-127-gv9tx pod went
    > into a "bad" state where it started processing archives very
    > slowly. [<span class="underline">CPU usage was
    > high</span>](https://prometheus-mnm.1b13.insights.openshiftapps.com/graph?g0.range_input=2d&g0.end_input=2019-09-27%2006%3A37&g0.expr=rate\(container_cpu_user_seconds_total%7Bpod_name%3D%22insights-pup-127-gv9tx%22%2Ccontainer_name%3D%22%22%7D%5B1h%5D\)&g0.tab=0)
    > until</span> <span dir="ltr">[<span class="underline"> it got
    > OOMKilled</span>](https://kibana-kibana.1b13.insights.openshiftapps.com/app/kibana#/discover?_g=\(refreshInterval:\(pause:!t,value:0\),time:\(from:'2019-09-27T03:47:45.233Z',mode:absolute,to:'2019-09-27T03:47:55.233Z'\)\)&_a=\(columns:!\('@message'\),index:'0a2575c0-65f9-11e9-ba88-097c6c9f6850',interval:auto,query:\(language:lucene,query:'@log_stream:+%22dedicated-reader%22'\),sort:!\('@timestamp',desc\)\)).</span>

  - > <span dir="ltr">It looks like the readiness check for redis had
    > been intermittently failing for several days, but</span>
    > <span dir="ltr">[<span class="underline"> it started consistently
    > failing at 1117Z On Sep
    > 26</span>](https://kibana-kibana.1b13.insights.openshiftapps.com/app/kibana#/discover?_g=\(refreshInterval:\(pause:!t,value:0\),time:\(from:now-2d,mode:relative,to:now\)\)&_a=\(columns:!\('@message'\),index:'0a2575c0-65f9-11e9-ba88-097c6c9f6850',interval:auto,query:\(language:lucene,query:'@log_stream:+%22dedicated-reader%22+AND+%22redis%22+AND+%22insights-prod%22'\),sort:!\('@timestamp',asc\)\)),
    > triggering all requests that required a subset lookup to fail.
    > This would include any upload from a satellite-managed
    > system.</span>

  - > <span dir="ltr">Based on</span>
    > <span dir="ltr">[<span class="underline"> payload tracker metrics
    > from the outage
    > window</span>](https://metrics.1b13.insights.openshiftapps.com/d/eGSUe-SZk/payload-tracker?orgId=1&from=1569496622000&to=1569502835723),
    > redis didn't seem to become completely unresponsive until
    > \~1155Z.</span>

  - > <span dir="ltr">During this outage window, the only archives that
    > are being processed are uploads that come from
    > non-satellite-managed hosts (a small percentage) or archives that
    > complete processing from the slow-running pup pod. This skews the
    > metrics in the payload tracker much higher since there are very
    > few "normal" archives to anchor the timing metrics.</span>

  - > <span dir="ltr">At 1205Z the UploadElapsedTimesTooLongHard metric
    > threshold (1 hour) had been exceeded for 5 minutes, triggering a
    > PagerDuty incident.</span>

  - > <span dir="ltr">At 1245Z Dan Kuc scaled the redis deployment
    > config to 0 and back to 1 to bounce the redis deployment.</span>

  - > <span dir="ltr">Archives started being admitted in to the platform
    > again, pulling the upload duration metric back down under the
    > threshold.</span>

  - > <span dir="ltr">The slow pup pod continues to churn through its
    > queue of archives until it catches up at roughly 1500Z.</span>

  - > <span dir="ltr">The slow pup pod is OOMKilled at 0347Z on Sep 27,
    > roughly around the beginning of the nightly load spike, implicitly
    > restarting the container and clearing the bad state that caused
    > the performance degradation.</span>

<span dir="ltr"></span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">Dan Kuc restarted the redis deloyment in the
insights-prod project.</span>

## <span dir="ltr">Root Causes</span>

<span dir="ltr">The root cause of the pup runaway thread is still
unknown, but since puptoo is going to be deployed soon, replacing the
pup deployment, finding a root cause is probably not worth the
effort.</span>

<span dir="ltr"></span>

<span dir="ltr">The root cause of the redis failure is still unknown,
but taking corrective actions to detect the problem before it causes an
outage will significantly mitigate the impact of the issue, perhaps even
removing the need to determine the root cause.</span>

## <span dir="ltr">Impact</span>

<span dir="ltr">All requests to Insights Classic from a
Satellite-managed host failed. This caused some hosts to not check in
for a day and also caused web requests from Satellite UIs to
fail.</span>

<span dir="ltr"></span>

## <span dir="ltr">What Went Well?</span>

  - > <span dir="ltr">The payload tracker alerted us of the
    > issue.</span>

  - > <span dir="ltr">The resolution was simple and quick</span>

## <span dir="ltr">What Didn’t Go So Well?</span>

  - > <span dir="ltr">Confusion due to seemingly unrelated issues</span>

  - > <span dir="ltr">BK had to ping us to look</span>

## <span dir="ltr">Action Items</span>

  - > <span dir="ltr">The redis pod readiness check was failing leading
    > up to the outage. We should find a metric on that and write an
    > alert for it</span>

  - > <span dir="ltr">[<span class="underline">Adding golden signal
    > metrics on
    > insights-api</span>](https://projects.engineering.redhat.com/browse/RHCLOUD-1735?jql=project%20%3D%20RHCLOUD%20AND%20text%20~%20%22metrics%22%20AND%20assignee%20in%20\(rbrantle\))
    > will allow us to create alerts for error rate and latency on
    > Insights Classic, thus detecting this problem when it happens,
    > rather than waiting for BK to tell us</span>

  - > <span dir="ltr">Replacing pup with puptoo will hopefully resolve
    > the resource issue seen when processing uploads</span>

  - > <span dir="ltr">Add a report to Payload Tracker to view upload
    > durations, sorted from longest to shortest.</span>

  - > <span dir="ltr">[<span class="underline">Insights-client returned
    > a 0 status
    > code</span>](https://ansible.slack.com/archives/CDVFMQU31/p1569500772062400)
    > when insights-api returned a status 500. This should be
    > fixed.</span>

  - > <span dir="ltr">Perhaps add metric/alert for pup</span>

  - > <span dir="ltr">Consider failing over to bypassing redis if it
    > starts failing</span>
