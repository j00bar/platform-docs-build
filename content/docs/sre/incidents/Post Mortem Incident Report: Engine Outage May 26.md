---
date: 2020-06-17 12:43:41.688703
title: 'Post Mortem Incident Report: Engine Outage May 26'
---
## <span dir="ltr">Overview</span>

<span dir="ltr">Around 1916 CDT the kafka topic lag for the Insights
Engine consumer group exceeded its alert threshold for roughly 12
hours.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">The alert “PlatformKafkaLagMaxExceededHard” was
triggered for the consumer group “insights-core-kafka”. The lag peaked
at around 140k and then leveled out to \~70k for a while, then slowly
went down over the course of the next 12h.</span>

<span dir="ltr"></span>

<span dir="ltr">The insights-core-kafka consumer group corresponds to
the insights-engine deployment in production. Looking at this
deployment, a significant portion (\>10 pods) of the pods were getting
OOMKilled and crashlooping.</span>

## <span dir="ltr">Contributing Factors</span>

<span dir="ltr">A new version of the engine had been rolled out earlier
in the day.</span>

## <span dir="ltr">Resolution</span>

  - > <span dir="ltr">Rolled back using “oc rollback”. I saw that pods
    > were still getting OOMKilled and realized that the engine was
    > managed by app-interface, and gave up on this for a while.</span>

  - > <span dir="ltr">Increased memory limit from 1Gi to 3Gi. This
    > seemed to have no effect.</span>

  - > <span dir="ltr">Rolled back to a previous version of the engine
    > using app interface. This initially seemed to have no effect
    > because we continued to see OOMKills, but over time it appeared
    > that there were significantly fewer OOMKills over time, seemingly
    > allowing the topic lag to slowly decrease over time.</span>

## <span dir="ltr">Impact</span>

<span dir="ltr">All archives were eventually processed; it just took
upwards of 12 hours for some to complete.</span>

## <span dir="ltr">Timeline</span>

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Time (CDT)</span></strong></th>
<th><strong><span dir="ltr">Notes</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">1916</span></td>
<td><span dir="ltr">Alert triggered. PD incident 81158</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">1945</span></td>
<td><span dir="ltr">Rolled back to previous version of deployment</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">1951</span></td>
<td><span dir="ltr">Applied 3Gi memory limit via app-interface: <a href="https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5013"><span class="underline">https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5013</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">2031</span></td>
<td><span dir="ltr">Escalated to Stephen Adams</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">2046</span></td>
<td><span dir="ltr">Escalated to Ben Turner; responded immediately</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">2126</span></td>
<td><span dir="ltr">Stephen responded</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">2151</span></td>
<td><span dir="ltr">Rolled back to previous version via app-interface: <a href="https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5014"><span class="underline">https://gitlab.cee.redhat.com/service/app-interface/merge_requests/5014</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">2223</span></td>
<td><span dir="ltr">Resolved PD incident and silenced alert for 12 hours.</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

### <span dir="ltr">Observations</span>

  - > <span dir="ltr">insights-engine was running the following rulesets
    > on the initial image</span>
    
      - > <span dir="ltr">insights-plugins-2.0.121</span>
    
      - > <span dir="ltr">prodsec-rules-1.0.70-1525</span>

  - > <span dir="ltr">Message consumption seemed to stay around the same
    > message per minute rate, even though the lag appeared to
    > increase.</span>

  - > <span dir="ltr">The upload count for the event was strikingly
    > similar to the previous night. Indicating that this lag was not
    > caused by an influx of uploads.</span>

  - > <span dir="ltr">On May 26, 2020, insights-engine was updated to
    > the latest image on this date. The only code changes that would
    > have had an impact are insights-plugins and insights-core changes.
    > The engine itself didn’t have any major changes.</span>

### <span dir="ltr">What didn’t go so well?</span>

  - > <span dir="ltr">No SOP for lag alert</span>

  - > <span dir="ltr">Insufficient logging available to track down
    > RCA</span>

  - > <span dir="ltr">Difficult to apply changes to production
    > environment via app-interface</span>

  - > <span dir="ltr">Version of components within insights-engine
    > obfuscated</span>

## <span dir="ltr">Action Items</span>

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Action Item</span></strong></th>
<th><strong><span dir="ltr">Status</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Include consumer group name in alert</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Silence insights.core.plugins log messages</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Add a log statement for every archive processed, including request ID and system ID</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6707"><span class="underline">RHCLOUD-6707</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Ensure procedure for merging changes to app-interface during an outage is well defined</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Create SOPs for Kafka Lag alerts</span></td>
<td><span dir="ltr"><a href="https://projects.engineering.redhat.com/browse/RHCLOUD-6706"><span class="underline">RHCLOUD-6706</span></a></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Create a grafana dashboard to assist with outages with the engine and/or ingress pipeline</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Better document which document</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><p><span dir="ltr">Identify root causes for exceptions in logs:</span></p>
<p><span dir="ltr">"insights-engine" AND NOT name: insights.core.plugins AND (levelname: ERROR OR levelname: WARNING)</span></p></td>
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
