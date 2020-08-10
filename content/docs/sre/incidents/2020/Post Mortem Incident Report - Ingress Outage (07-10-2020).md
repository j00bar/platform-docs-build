---
date: 2020-07-14 16:26:02.814000
title: Post Mortem Incident Report - Ingress Outage (07-10-2020)
---
## <span dir="ltr">Overview</span>

<span dir="ltr"></span>

<span dir="ltr">On the morning of July 10, 2020 we suffered an outage of
several services in the pipeline. The initial outage was cleared up
quickly, but the CCX team that receives insights operator payloads was
affected for longer while an additional issue was sorted. Roughly 40
minutes of downtime was experienced that would result in lost payloads
to the pipeline.</span>

## <span dir="ltr">What Happened</span>

<span dir="ltr">The migration of Ingress Pipeline services to their new
namespace in \`ingress-prod\` caused a few issues in the platform.
First, ingress was unable to deliver upload notifications to kafka.
After supplying that fix, it was discovered that insights-storage-broker
was encountering errors when copying S3 objects to a different bucket.
This caused CCX to notice that they were no longer getting openshift
insights payloads.</span>

## <span dir="ltr">Contributing Factors</span>

<span dir="ltr">Early testing was done prior to cut over to ensure that
everything was running smoothly. Payloads were uploaded and viewed to
verify that the traffic flow worked. Research should be conducted to see
how/why the kafka URL did not work once the cutover occurred. The
storage-bucket feature for openshift operator payloads was
untested.</span>

<span dir="ltr"></span>

<span dir="ltr">A change was also made to the kafka\_bootstrap\_host
variable that is used by both old and new production environments. The
problem with that is that the value of that variable is different
between the two, but the configuration files made them the same. It
appeared in earlier testing that everything was fine because the later
rollouts hadn’t happened and the change hadn’t taken effect yet. Once
the rollout occurred, the new var was read by the old environment and
the pods were using an incorrect kafka url.</span>

## <span dir="ltr">Resolution</span>

<span dir="ltr">Changes were made to the deployment templates that will
ensure this issue does not resurface.</span>

## <span dir="ltr">Impact</span>

*<span dir="ltr">Be specific here. Include numbers such as customers
affected, cost to business, etc.</span>*

<span dir="ltr"></span>

*<span dir="ltr">Example template</span>*

<table>
<thead>
<tr class="header">
<th><span dir="ltr"></span></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Customer view</span></td>
<td><span dir="ltr">uploads appeared to succeed but results of that payload would not be in the app</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Internal Impact</span></td>
<td><span dir="ltr">CCX openshift buck-it payloads missing while storage-broker issues were ongoing</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Notifications Delivered out of SLA</span></td>
<td><span dir="ltr">??% (?? of ??)</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Events Dropped / Not Accepted</span></td>
<td><span dir="ltr">??% (?? of ??) Should usually be 0, but always check</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Accounts Affected</span></td>
<td><span dir="ltr">??</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Users Affected</span></td>
<td><span dir="ltr">??</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Support Requests Raised</span></td>
<td><span dir="ltr">?? Include any relevant links to tickets</span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Timeline</span>

*<span dir="ltr">Some important times to include: (1) time the
contributing factor began, (2) time of the page, (3) time that the
status page was updated (i.e. when the incident became public), (4) time
of any significant actions, (5) time the SEV-2/1 ended, (6) links to
tools/logs that show how the timestamp was arrived at.</span>*

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Time (EST)</span></strong></th>
<th><strong><span dir="ltr">Notes</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">9:45am</span></td>
<td><span dir="ltr">Kyle updates the 3scale config to route to new upload-service in ingress-prod</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">9:50am</span></td>
<td><span dir="ltr">Traffic begins to shift to the new ingress prod</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">10:07am</span></td>
<td><span dir="ltr">Stephen begins to spin down platform-prod versions of ingress pipeline.</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">10:14am</span></td>
<td><span dir="ltr">Storage broker down alert comes through. This is expected. PR submitted to modify alert to look at new project</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">10:20am</span></td>
<td><span dir="ltr">Upload-service has errors connecting to kafka. Kyle and Stephen meetup to work the problem</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">~10:25am</span></td>
<td><span dir="ltr">It’s discovered that the prod platform kafka bootstrap url is incorrect for ingress-prod. Actions taken to correct it. Wait for app-interface to deploy the fix</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">10:30am</span></td>
<td><span dir="ltr">Storage broker receives messages but is unable to copy files properly. Discovered it requires two additional env vars. PR is submitted to app-interface and e2e-deploy</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">10:45am</span></td>
<td><span dir="ltr">app-interface runs but does not update vars due to the parameters missing from the saas-template for storage broker. PR is put in for this</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">11:05am</span></td>
<td><span dir="ltr">app-interface runs again and puts the bucket env vars in place. Storage broker function is restored</span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">How’d We Do?</span>

### <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you did well and want to call out. It's
OK to not list anything.</span>*

  - > <span dir="ltr">Quick action to jump on a call and start working
    > the problem. Great communication between engineers available to
    > understand and fix the issue.</span>

  - > <span dir="ltr">Kyle’s access to quickly merge PRs into
    > app-interface was critical to moving fast</span>

  - > <span dir="ltr">Thorough understanding of how the apps worked and
    > what requirements were needed. Knowledge of where to look to find
    > the information we needed.</span>

### <span dir="ltr">What didn’t go so well?</span>

<span dir="ltr">*List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.*</span>

> <span dir="ltr"></span>

  - > <span dir="ltr">Small oversights in the checks prior to cut over.
    > The env var missing was a big one. SImply didn’t notice. Might
    > want to consider a cutover checklist to mitigate it with future
    > moves.</span>

  - > <span dir="ltr">CCX folks were not notified of us attempting this
    > and were surprised to find that they were no longer getting
    > payloads due to the storage broker issue. An outage was not
    > expected, but it occurred nonetheless. We should consider any
    > changes at this scale to be noteworthy for an email to
    > platform-dev at the very least.</span>

  - > <span dir="ltr">We knew the problem quickly, but having to work
    > within app-interface slowed down the time to implementation for
    > the fix. If we had been able to move faster, the outage would have
    > been significantly shorter. This isn’t a problem inherent to
    > app-interface specifically, but rather simply being restricted to
    > CI/CD for any and all changes to infrastructure.</span>

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
<td><span dir="ltr">Create an alert for insights-ingress kafka production errors. A metric already exists for this.</span></td>
<td><strong><span dir="ltr">Done by sadams</span></strong></td>
</tr>
<tr class="even">
<td><span dir="ltr">Create an alert for storage-broker s3 copy errors. A metric already exists for this</span></td>
<td><strong><span dir="ltr">Done by sadams</span></strong></td>
</tr>
<tr class="odd">
<td><p><span dir="ltr">Update incident response process to page AppSRE Primary On-call</span></p>
<ul>
<li><blockquote>
<p><span dir="ltr">Add to support process for cluster SOP</span></p>
</blockquote></li>
</ul></td>
<td><span dir="ltr"><a href="https://gitlab.cee.redhat.com/service/app-interface/-/merge_requests/6504"><span class="underline">cmoore to write</span></a></span></td>
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

## <span dir="ltr">Messaging</span>

### <span dir="ltr">Internal Email</span>

*<span dir="ltr">This is a follow-up for employees. It should be sent
out right after the post-mortem meeting is over. It only needs a short
paragraph summarizing the incident and a link to this wiki page.</span>*

<span dir="ltr"></span>

<span dir="ltr"></span>

### <span dir="ltr">External Email</span>

*<span dir="ltr">This is what will be included on the status.redhat.com
website regarding this incident. What are we telling customers,
including an apology? (The apology should be genuine, not rote.)</span>*

<span dir="ltr"></span>
