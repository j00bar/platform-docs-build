---
date: 2020-07-01 11:34:29.914000
title: Post Mortem Incident Report - RAT Security Issue
---
## <span dir="ltr">Overview</span>

<span dir="ltr">On the morning of April 15, 2020, it was discovered that
S3 access keys to Insights Archives was publicly available. Access using
the exposed key was disabled, a ticket was opened with InfoSec. Review
of logs lead to the conclusion that the S3 buckets were not accessed
inappropriately.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">On the morning of April 15, 2020, it was discovered that
an administrative web-ui
([<span class="underline">Oshinko</span>](https://radanalytics.io/projects))
used as part of the Rule Analysis Tool (RAT) was publicly exposed. From
this UI, one can navigate to another subsystem Administration UI
(Spark). The secondary web-page provided AWS Access Key/Secret
information and an S3 Bucket name that could be accessed with the AWS
credentials.</span>

<span dir="ltr"></span>

<span dir="ltr">The S3 bucket contains Red Hat Insights Advisor archives
uploaded by customers. Other miscellaneous buckets could also be
accessed by the key if a user knew the bucket names, which is very
unlikely.</span>

## <span dir="ltr">Contributing Factors</span>

<span dir="ltr">The exposure of the key was due to the default Oskinko
install behavior that cretes open routes to various administrative user
interfaces. This coupled with the loss of the primary maintainer of RAT
(left Red Hat) lead to a gap in understanding.</span>

<span dir="ltr"></span>

<span dir="ltr">RAT was also moved to OSD before the APP SRE group was
fully formed. So, checks implemented by that team at this time were not
applied.</span>

<span dir="ltr"></span>

<span dir="ltr">Finally, having a report of open/public routes to
monitor accidental exposure by applications developers are not in
place.</span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">The public routes were removed and AWS Access Key was
revoked within an hour of discovery. The insights-core team began
investigating activity based on the key using AWS CloudTrail and other
tools. Infosec was notified
([<span class="underline">INC1262028</span>](https://redhat.service-now.com/surl.do?n=INC1262028)).</span>

<span dir="ltr"></span>

<span dir="ltr">Using AWS CloudTrail, we are able to see that no
unauthorized listing of S3 buckets has occurred using the credentials.
CloudTrail currently cannot tell us if anyone listed the contents of the
named bucket, or downloaded objects.</span>

<span dir="ltr"></span>

<span dir="ltr">Access logs were available in a format that was not
readily accessible. These records were loaded for 2020 and no unexpected
ip addresses were seen to access the data. Accessing 2019 data failed.
The raw data consists of 13.5 million files totaling 252 GB in
size.</span>

## <span dir="ltr">Impact</span>

<span dir="ltr">Since there is no evidence of exploitation of the key,
we don’t believe there’s any impact to either customers or internal
associates.</span>

<span dir="ltr"></span>

## <span dir="ltr">How’d We Do?</span>

### <span dir="ltr">What went well?</span>

  - > <span dir="ltr">Quick alerting of the incident.</span>

  - > <span dir="ltr">Quick action to secure the environment once the
    > issue was discovered</span>

  - > <span dir="ltr">Expert analysis of permissions and utilized of
    > less than desirable logging to reach a conclusion to
    > impact.</span>

### <span dir="ltr">What didn’t go so well?</span>

  - > <span dir="ltr">Lack of easy to access logs to validate there was
    > no unauthorized access</span>

<span dir="ltr"></span>

## <span dir="ltr">Action Items</span>

<span dir="ltr">*Each action item should be in the form of a JIRA
ticket, and each ticket should have the same set of two tags:
“sev1\_YYYYMMDD” (such as sev1\_20150911) and simply “sev1”. Include
action items such as: (1) any fixes required to prevent the contributing
factor in the future, (2) any preparedness tasks that could help
mitigate the problem if it came up again, (3) remaining post-mortem
steps, such as the internal email, as well as the status-page public
post, (4) any improvements to our incident response process.*</span>

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
