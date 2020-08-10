---
date: 2020-06-17 15:08:44.971000
title: Post Mortem Incident Report - Kafka Lag (3-22-20)
---
## <span dir="ltr">Overview</span>

<span dir="ltr">Black box tests and whitebox metrics both started
failing indicating APP outages on PROD which resulted in multiple pages
over the weekend. After looking into the failures deeper it looks like
alerts were triggered because of either a kafka or an APP issue. RCA is
currently underway.</span>

<span dir="ltr"></span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">*Black box tester alert and
UploadElapsedTimesTooLongHard were both triggered over the
weekend.*</span>

## <span dir="ltr">Timeline</span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Time (EST)</span></strong></th>
<th><strong><span dir="ltr">Notes</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">12:28 PM 3/21/20</span></td>
<td><span dir="ltr">Problems with platform.inventory.host-egress/platform.upload.available kafka topics were reported.</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:30 PM - 11:15 PM 3/21/20</span></td>
<td><span dir="ltr">Black box tester failure pagerduty alerts were triggered</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">2:28 AM 3/22/20</span></td>
<td><span dir="ltr">“looks like the OSD upgrade did not resolve the networking problems. Right now insights-inventory-200-5whr4 and inventory-mq-p1-20-vb4f9 are in crashloop again” was reported</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">01:04 - 03:42 AM 3/23/20</span></td>
<td><span dir="ltr">UploadElapsedTimesTooLongHard Alert was triggered</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">9:07 AM 3/23/20</span></td>
<td><span dir="ltr">UploadElapsedTimesTooLongHard alert was marked resolved</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">10:34 PM 3/23/20</span></td>
<td><span dir="ltr">UploadElapsedTimesTooLongHard alert fired</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

## <span dir="ltr">Resolution</span>

*<span dir="ltr">RCA is underway but it appears that there were either
NW or Kafka issues that caused problems with Apps processing
messages.</span>*

<span dir="ltr"></span>

## <span dir="ltr">Root Causes</span>

*<span dir="ltr">Network, Kafka, or Apps could all have caused / lead to
this.</span>*

<span dir="ltr"></span>

**<span dir="ltr">Kyle’s hypothesis: HorizontalPodAutoscalers are
broken.</span>**

<span dir="ltr"></span>

<span dir="ltr">This prevents deployments from properly scaling to meet
demand. This would explain why vulnerabilities was receiving archives
much earlier than advisor. It also explains why insights classic was
failing on Saturday.</span>

<span dir="ltr"></span>

<span dir="ltr">Example HPA error message:</span>

<span dir="ltr"></span>

> <span dir="ltr">2020-03-24 10:10:40 -0500 CDT 2020-03-23 08:50:25
> -0500 CDT 3039 insights-advisor-service.15fef31d1709c7bc
> HorizontalPodAutoscaler Warning FailedComputeMetricsReplicas
> horizontal-pod-autoscaler failed to get cpu utilization: unable to get
> metrics for resource cpu: **unable to fetch metrics from resource
> metrics API**: the server could not find the requested resource (get
> pods.metrics.k8s.io)</span>

<span dir="ltr"></span>

<span dir="ltr">[<span class="underline">Graph that shows upload queue
plotted against deployment replica
count.</span>](https://metrics.1b13.insights.openshiftapps.com/d/kfYZnv9Zz/uploadelapsedtimestoolonghard?orgId=1&from=1584807383014&to=1585066583015)</span>

<span dir="ltr"></span>

<span dir="ltr">[<span class="underline">Service Now ticket requesting
OSD assistance in fixing metrics
server.</span>](https://redhat.service-now.com/surl.do?n=INC1233365)</span>

<span dir="ltr"></span>

## <span dir="ltr">Impact</span>

*<span dir="ltr">Uploads were not getting processed.</span>*

<span dir="ltr"></span>

## <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you think we did well and want to call
out. It's okay to not list anything.</span>*

  - > <span dir="ltr"></span>

  - > <span dir="ltr">The RCA investigation / mitigation plan by KLape,
    > RBrantley, CMitchel, and BTurner was super awesome</span>

<span dir="ltr"></span>

## <span dir="ltr">What didn’t go so well?</span>

<span dir="ltr">*List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.*</span>

> <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Action Items</span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Action Item</span></strong></th>
<th><strong><span dir="ltr">Status</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Review Kafka metrics / data{ben, richard, chris, kyle} from outage</span></td>
<td><span dir="ltr">Complete</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Open OSD Ticket</span></td>
<td><span dir="ltr">Complete</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Work OSD Ticket</span></td>
<td><span dir="ltr">In Progress</span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>
