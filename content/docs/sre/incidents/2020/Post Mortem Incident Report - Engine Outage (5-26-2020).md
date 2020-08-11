---
date: 2020-06-17 19:09:17.927000
title: Post Mortem Incident Report - Engine Outage (5-26-2020)
---
## Overview

Around 1916 CDT the kafka topic lag for the Insights Engine consumer
group exceeded its alert threshold for roughly 12 hours.

## What Happened

The alert “PlatformKafkaLagMaxExceededHard” was triggered for the
consumer group “insights-core-kafka”. The lag peaked at around 140k and
then leveled out to ~70k for a while, then slowly went down over the
course of the next 12h.

The insights-core-kafka consumer group corresponds to the
insights-engine deployment in production. Looking at this deployment, a
significant portion (\>10 pods) of the pods were getting OOMKilled and
crashlooping.

## Contributing Factors

A new version of the engine had been rolled out earlier in the day.

## Resolution

  - > Rolled back using “oc rollback”. I saw that pods were still
    > getting OOMKilled and realized that the engine was managed by
    > app-interface, and gave up on this for a while.

  - > Increased memory limit from 1Gi to 3Gi. This seemed to have no
    > effect.

  - > Rolled back to a previous version of the engine using app
    > interface. This initially seemed to have no effect because we
    > continued to see OOMKills, but over time it appeared that there
    > were significantly fewer OOMKills over time, seemingly allowing
    > the topic lag to slowly decrease over time.

## Impact

All archives were eventually processed; it just took upwards of 12 hours
for some to complete.

## Timeline

<table>
<thead>
<tr class="header">
<th><strong>Time (CDT)</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1916</td>
<td>Alert triggered. PD incident 81158</td>
</tr>
<tr class="even">
<td>1945</td>
<td>Rolled back to previous version of deployment</td>
</tr>
<tr class="odd">
<td>1951</td>
<td>Applied 3Gi memory limit via app-interface: <a href="https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5013"><span class="underline">https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5013</span></a></td>
</tr>
<tr class="even">
<td>2031</td>
<td>Escalated to Stephen Adams</td>
</tr>
<tr class="odd">
<td>2046</td>
<td>Escalated to Ben Turner; responded immediately</td>
</tr>
<tr class="even">
<td>2126</td>
<td>Stephen responded</td>
</tr>
<tr class="odd">
<td>2151</td>
<td>Rolled back to previous version via app-interface: <a href="https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5014"><span class="underline">https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5014</span></a></td>
</tr>
<tr class="even">
<td>2223</td>
<td>Resolved PD incident and silenced alert for 12 hours.</td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
</tbody>
</table>

### Observations

  - > insights-engine was running the following rulesets on the initial
    > image
    
      - > insights-plugins-2.0.121
    
      - > prodsec-rules-1.0.70-1525

  - > Message consumption seemed to stay around the same message per
    > minute rate, even though the lag appeared to increase.

  - > The upload count for the event was strikingly similar to the
    > previous night. Indicating that this lag was not caused by an
    > influx of uploads.

  - > On May 26, 2020, insights-engine was updated to the latest image
    > on this date. The only code changes that would have had an impact
    > are insights-plugins and insights-core changes. The engine itself
    > didn’t have any major changes.

### What didn’t go so well?

  - > No SOP for lag alert

  - > Insufficient logging available to track down RCA

  - > Difficult to apply changes to production environment via
    > app-interface

  - > Version of components within insights-engine obfuscated

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
<td>Include consumer group name in alert</td>
<td></td>
</tr>
<tr class="even">
<td>Silence insights.core.plugins log messages</td>
<td></td>
</tr>
<tr class="odd">
<td>Add a log statement for every archive processed, including request ID and system ID</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6707"><span class="underline">RHCLOUD-6707</span></a></td>
</tr>
<tr class="even">
<td>Ensure procedure for merging changes to app-interface during an outage is well defined</td>
<td></td>
</tr>
<tr class="odd">
<td>Create SOPs for Kafka Lag alerts</td>
<td><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6706"><span class="underline">RHCLOUD-6706</span></a></td>
</tr>
<tr class="even">
<td>Create a grafana dashboard to assist with outages with the engine and/or ingress pipeline</td>
<td></td>
</tr>
<tr class="odd">
<td>Better document which document</td>
<td></td>
</tr>
<tr class="even">
<td><p>Identify root causes for exceptions in logs:</p>
<p>&quot;insights-engine&quot; AND NOT name: insights.core.plugins AND (levelname: ERROR OR levelname: WARNING)</p></td>
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
