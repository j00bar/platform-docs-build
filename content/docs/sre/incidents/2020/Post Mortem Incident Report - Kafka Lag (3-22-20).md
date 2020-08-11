---
date: 2020-06-17 19:08:44.971000
title: Post Mortem Incident Report - Kafka Lag (3-22-20)
---
## Overview

Black box tests and whitebox metrics both started failing indicating APP
outages on PROD which resulted in multiple pages over the weekend. After
looking into the failures deeper it looks like alerts were triggered
because of either a kafka or an APP issue. RCA is currently underway.

## What Happened

*Black box tester alert and UploadElapsedTimesTooLongHard were both
triggered over the weekend.*

## Timeline

<table>
<thead>
<tr class="header">
<th><strong>Time (EST)</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>12:28 PM 3/21/20</td>
<td>Problems with platform.inventory.host-egress/platform.upload.available kafka topics were reported.</td>
</tr>
<tr class="even">
<td>9:30 PM - 11:15 PM 3/21/20</td>
<td>Black box tester failure pagerduty alerts were triggered</td>
</tr>
<tr class="odd">
<td>2:28 AM 3/22/20</td>
<td>“looks like the OSD upgrade did not resolve the networking problems. Right now insights-inventory-200-5whr4 and inventory-mq-p1-20-vb4f9 are in crashloop again” was reported</td>
</tr>
<tr class="even">
<td>01:04 - 03:42 AM 3/23/20</td>
<td>UploadElapsedTimesTooLongHard Alert was triggered</td>
</tr>
<tr class="odd">
<td>9:07 AM 3/23/20</td>
<td>UploadElapsedTimesTooLongHard alert was marked resolved</td>
</tr>
<tr class="even">
<td>10:34 PM 3/23/20</td>
<td>UploadElapsedTimesTooLongHard alert fired</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
</tbody>
</table>

## Resolution

*RCA is underway but it appears that there were either NW or Kafka
issues that caused problems with Apps processing messages.*

## Root Causes

*Network, Kafka, or Apps could all have caused / lead to this.*

**Kyle’s hypothesis: HorizontalPodAutoscalers are broken.**

This prevents deployments from properly scaling to meet demand. This
would explain why vulnerabilities was receiving archives much earlier
than advisor. It also explains why insights classic was failing on
Saturday.

Example HPA error message:

> 2020-03-24 10:10:40 -0500 CDT 2020-03-23 08:50:25 -0500 CDT 3039
> insights-advisor-service.15fef31d1709c7bc HorizontalPodAutoscaler
> Warning FailedComputeMetricsReplicas horizontal-pod-autoscaler failed
> to get cpu utilization: unable to get metrics for resource cpu:
> **unable to fetch metrics from resource metrics API**: the server
> could not find the requested resource (get pods.metrics.k8s.io)

[Graph that shows upload queue plotted against deployment replica
count.](https://metrics.1b13.insights.openshiftapps.com/d/kfYZnv9Zz/uploadelapsedtimestoolonghard?orgId=1&from=1584807383014&to=1585066583015)

[Service Now ticket requesting OSD assistance in fixing metrics
server.](https://redhat.service-now.com/surl.do?n=INC1233365)

## Impact

*Uploads were not getting processed.*

## What went well?

*List anything you think we did well and want to call out. It's okay to
not list anything.*

  - 
  - > The RCA investigation / mitigation plan by KLape, RBrantley,
    > CMitchel, and BTurner was super awesome

## What didn’t go so well?

*List anything you think we didn't do very well. The intent is that we
should follow up on all points here to improve our processes.*

## Action Items

<table>
<thead>
<tr class="header">
<th><strong>Action Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Review Kafka metrics / data{ben, richard, chris, kyle} from outage</td>
<td>Complete</td>
</tr>
<tr class="even">
<td>Open OSD Ticket</td>
<td>Complete</td>
</tr>
<tr class="odd">
<td>Work OSD Ticket</td>
<td>In Progress</td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
</tbody>
</table>
