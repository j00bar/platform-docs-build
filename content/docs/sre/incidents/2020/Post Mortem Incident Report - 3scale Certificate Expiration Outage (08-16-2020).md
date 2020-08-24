---
date: 2020-08-18 18:03:33.807000
title: Post Mortem Incident Report - 3scale Certificate Expiration Outage (08-16-2020)
---
## Overview

PagerDuty alerted the on-call engineer that insights was down. The
engineer attempted to upload a payload to insights and that failed. The
status.redhat.com site was checked and confirmed that both insights
uploads and insights inventory were unavailable. Graphs confirmed that
no requests were making it to the insights API, and 3scale pods were
throwing a lot of SSL handshake errors. It was then discovered that the
certificate used by 3scale had expired on 8/16 at 16:14 UTC.

Ben Turner and Stephen Adams worked to get a certificate renewal request
into the system. Ben made a call to the identity and access management
lead to approve the cert. The cert was added to Vault and an MR was
created to merge the version change for the secret in 3Scale. App-SRE
was notified via the slack on-call channel and quickly merged the
change. Connectivity was resolved at the next deployment.

## Contributing Factors

*What details contributed to the incident?*

*What factors influenced the incident, caused troubleshooting
difficulties, etc.?*

  - > Certificate expiration notices were going to an individual email
    > address, not a team address

  - > Jay did not have access to 3scale namespaces on -dev cluster, so
    > he could not help troubleshoot

  - > Multiple 3scale namespaces on -dev cluster caused confusion as to
    > which namespace impacted which environment

  - > We were unsure where to go to renew the certificate. Mojo helped
    > us find that endpoint.

  - > We had no escalation procedures for a certificate approval, so Ben
    > called the manager of the team to get some assistance.

  - > We leaned into our institutional and technology knowledge to find
    > the root cause. There was no useful SOP readily available that we
    > could look to for 3scale certificate expiration. At least not in
    > the SOP docs.

## Resolution

The certificate for cloud.redhat.com was renewed using our internal
Certificate Manager service. Once the renewed cert was in place, we were
back online.

## Impact

*Be specific here. Include numbers such as customers affected, cost to
business, etc.*

*Example template*

<table>
<tbody>
<tr class="odd">
<td>Time in SEV-1</td>
<td>~4 hours (12:21pm to 16:04pm)</td>
</tr>
<tr class="even">
<td>Events Dropped / Not Accepted</td>
<td>Any uploads that occurred during this time would have failed. Same with inventory queries.</td>
</tr>
<tr class="odd">
<td>Accounts Affected</td>
<td>All accounts</td>
</tr>
<tr class="even">
<td>Users Affected</td>
<td>All Users of cloud.redhat.com</td>
</tr>
<tr class="odd">
<td>Support Requests Raised</td>
<td>Only the certificate request via CA manager: 9981414</td>
</tr>
</tbody>
</table>

## Timeline

*Some important times to include: (1) time the contributing factor
began, (2) time of the page, (3) time that the status page was updated
(i.e. when the incident became public), (4) time of any significant
actions, (5) time the SEV-2/1 ended, (6) links to tools/logs that show
how the timestamp was arrived at.*

<table>
<thead>
<tr class="header">
<th><strong>Time (EST)</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>2:43pm</td>
<td>Initial page and acknowledgement</td>
</tr>
<tr class="even">
<td>2:48pm</td>
<td>Determined that no payloads were going through. 3Scale errors regarding SSL</td>
</tr>
<tr class="odd">
<td>2:53pm</td>
<td>Found the secret in 3scale that held the expired cert</td>
</tr>
<tr class="even">
<td>3:04pm</td>
<td>Found the certificate authority to self-service our cert</td>
</tr>
<tr class="odd">
<td>3:19pm</td>
<td>Figured out how to submit a request properly and performed it</td>
</tr>
<tr class="even">
<td>3:34pm</td>
<td>Manager of Cert team called and logged in to approve our cert</td>
</tr>
<tr class="odd">
<td>3:42pm</td>
<td>Cert Approved</td>
</tr>
<tr class="even">
<td>3:48pm</td>
<td>Vault secret updated with new cert</td>
</tr>
<tr class="odd">
<td>3:52pm</td>
<td>MR entered for app-interface update for 3scale prod</td>
</tr>
<tr class="even">
<td>4:05pm</td>
<td>Successful upload. All clear.</td>
</tr>
</tbody>
</table>

## How’d We Do?

### What went well?

  - > Teamwork. Ben happened to notice the page and jumped on to help
    > Stephen troubleshoot

### What didn’t go so well?

  - > Email notification of incident wasn’t sent ([Incident Response
    > Plan](https://docs.google.com/document/d/1AyEQnL4B11w7zXwum8Boty2IipMIxoFw1ri1UZB6xJE))

  - > Had a lot of things to figure out as we went along. How to renew a
    > cert, who to call for escalation, where the cert was stored for
    > 3scale.

  - > The service stopped receiving requests 2 hours before the page
    > came in. That’s a long time to be completely down before getting
    > paged.

  - > The cert should have been updated in advance. We should update
    > these to tie to a team email of some kind rather than just an
    > individual.

## Action Items

*List all follow up action items. Include links to Jira, documentation,
assignee, etc. where appropriate.*

<table>
<thead>
<tr class="header">
<th><strong>Action Item</strong></th>
<th><strong>Status</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Update certificate email address to go to Insights team list (<a href="https://projects.engineering.redhat.com/browse/RHCLOUD-8613"><span class="underline">RHCLOUD-8613</span></a>)</td>
<td></td>
</tr>
<tr class="even">
<td>Investigate switching to Lets-encrypt automation for this cert. It does not need to be issued by Red Hat CA, since its internal only used for Openshift route re-encryption. <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-8669"><span class="underline">RHCLOUD-8669</span></a></td>
<td></td>
</tr>
<tr class="odd">
<td>Update docs and SOPs <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-8666"><span class="underline">RHCLOUD-8666</span></a></td>
<td></td>
</tr>
<tr class="even">
<td>Containerize bbox script (runs upload &amp; cert tests) - <a href="https://projects.engineering.redhat.com/browse/RHIOPS-761"><span class="underline">RHIOPS-761</span></a></td>
<td></td>
</tr>
<tr class="odd">
<td>Check other certs on the platform (eg entitlements) that may also be registered to personal email addresses <a href="https://projects.engineering.redhat.com/browse/RHCLOUD-8668"><span class="underline">RHCLOUD-8668</span></a></td>
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

## Messaging

### Internal Email

*This is a follow-up for employees. It should be sent out right after
the post-mortem meeting is over. It only needs a short paragraph
summarizing the incident and a link to this wiki page.*

### External Email

*This is what will be included on the status.redhat.com website
regarding this incident. What are we telling customers, including an
apology? (The apology should be genuine, not rote.)*
