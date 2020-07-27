---
date: 2020-06-17 12:43:40.655702
title: Post Mortem Incident Report - Inventory Leak (04-Apr-2019)
---
## <span dir="ltr">Overview</span>

*<span dir="ltr">Include a short sentence or two summarizing the
contributing factors, timeline summary, and the impact; for example, "On
the morning of August 14th, we suffered a 14 minute SEV-1 due to a
runaway process on our primary database machine. This slowness caused
roughly 3% of reports generated during this time to be completed out of
SLA."</span>*

<span dir="ltr"></span>

<span dir="ltr">On the morning of 04-Apr-2019, one of our developers
noticed in the Inventory UI, you could search and see hostnames from
other accounts. This spawned a conversation with security and eventually
we shut down the pod until a permanent fix was deployed.</span>

## <span dir="ltr">What Happened</span>

*<span dir="ltr">Include a short description of what happened, usually
based on the timeline.</span>*

<span dir="ltr"></span>

<span dir="ltr">The mechanism causing the leak was an authenticated
search API. This was being used by the UI to present search records. Via
the UI, the only data that was leaked was hostnames and record creation
time. Searching for a single character turned up ALL hosts in the
database, regardless of their account ownership. Clicking on a record
that the user did not own did not seem to load the data. The leak was
really in the API call that was happening underneath. It wasn't just
hostnames that were returned from the call, but the entire host record.
So using firefox network console, it was easy to access this data. This
could also have been run via a curl command or something similar.</span>

<span dir="ltr"></span>

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
<td><span dir="ltr">4:00 AM</span></td>
<td><p><span dir="ltr">Jozef contacted Pete Savage to ask if he had elevated access to the cluster</span></p>
<p><span dir="ltr">to shutdown the inventory pod as he believed it was leaking data.</span></p></td>
</tr>
<tr class="even">
<td><span dir="ltr">4:06 AM</span></td>
<td><span dir="ltr">Jozef and Pete started to chat</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">4:14 AM</span></td>
<td><span dir="ltr">Jozef sent email to Pete with details</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">4:17 AM</span></td>
<td><p><span dir="ltr">Pete confirmed issue. Looked for document for contact details - couldn't find and felt it was potentially too critical to just keep searching so:</span></p>
<p><span dir="ltr">Pete tried calling dajo</span></p>
<p><span dir="ltr">Pete tried calling Benny</span></p>
<p><span dir="ltr">Pete tried calling Stephen</span></p>
<p><span dir="ltr">Got through to dajo - explained situation, dajo stayed up until incident</span></p>
<p><span dir="ltr">resolution.</span></p></td>
</tr>
<tr class="odd">
<td><span dir="ltr">4:39 AM</span></td>
<td><span dir="ltr">Pete contacted #security + #ops-escalation</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">4:46 AM</span></td>
<td><p><span dir="ltr">Pete was on bluejeans with Gabriel Rocha from Product Security who triaged with Pete Savage</span></p>
<p><span dir="ltr">Initially we thought it was just hostnames and so Gabriel Rocha made the</span></p>
<p><span dir="ltr">decision to leave until others came in</span></p></td>
</tr>
<tr class="odd">
<td><span dir="ltr">5 AM</span></td>
<td><p><span dir="ltr">I discovered/informed that the host inventory call provided a</span></p>
<p><span dir="ltr">full set of data when doing a search, couldn't be 100% sure that other</span></p>
<p><span dir="ltr">data wasn't provided after eyeballing 30 or so entries. So we decided to</span></p>
<p><span dir="ltr">escalate.</span></p></td>
</tr>
<tr class="even">
<td><span dir="ltr">5:08 AM</span></td>
<td><p><span dir="ltr">Started a call with someone from OSD team, grocha raised a SN</span></p>
<p><span dir="ltr">ticket on the call to deal with the situation - I recommended that</span></p>
<p><span dir="ltr">inventory pods be scaled to 0.</span></p></td>
</tr>
<tr class="odd">
<td><span dir="ltr">5:31 AM</span></td>
<td><p><span dir="ltr">Pods were confirmed to be scaled down to 0 and inventory was no</span></p>
<p><span dir="ltr">longer operational.</span></p></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

## <span dir="ltr">Resolution</span>

*<span dir="ltr">Include a description what solved the problem. If there
was a temporary fix in place, describe that along with the long-term
solution.</span>*

<span dir="ltr"></span>

<span dir="ltr">The immediate fix was to kill the inventory pod. The
permanent fix (that was already in CI) was rolled into production later
that day after QE validation.</span>

## <span dir="ltr">Root Causes</span>

*<span dir="ltr">Include a description of any conditions that
contributed to the issue. If there were any actions taken that
exacerbated the issue, also include them here with the intention of
learning from any mistakes made during the resolution process.</span>*

<span dir="ltr"></span>

<span dir="ltr">The root cause was lack of a process for getting
critical bug fixes to production in a timely fashion. This was
exacerbated by rapid changes ongoing in the affected component which
meant that the engineers moved on to focus on other features as soon as
the patch for this issue was released in the test environment.</span>

<span dir="ltr"></span>

<span dir="ltr">Missed filtering out accounts in a very specific code
path (code review miss). This was compounded by lack of automated test
for this particular use-case.</span>

<span dir="ltr"></span>

<span dir="ltr">\[dbaker\] I would like to raise whether the database
schema contributed to the error. Specifically curious as to whether
something like a database VIEW could take the place of the prior system
which had APIs to protect against selecting data for other
customers.</span>

<span dir="ltr"></span>

<span dir="ltr">\[dbaker\] There isn’t a dedicated person in the
insights team responsible for security. If you compare to SRE Security
who has a dedicated (if small) group dedicated to security review of
code, attempting to guide away from bad coding practises, and who has
the ability to tap the brakes on a project if it starts compromising too
much security for the sake of expediency.</span>

<span dir="ltr"></span>

## <span dir="ltr">Impact</span>

*<span dir="ltr">Be specific here. Include numbers such as customers
affected, cost to business, etc.</span>*

<span dir="ltr"></span>

<span dir="ltr">The data being leaked was ALL host/system in the
new(beta) Insights inventory service. As I understand it, this is a
slimmed down record of the data obtained from the Insights Archive
upload. I believe most of the data coming from there is sanitized we did
not find a public IP address in the small sample that we took, and I
believe, from what I have been told, there should not be any public IPs
in that database. I do know that other host records could contain other
data that we did not see from our sample.</span>

<span dir="ltr"></span>

<span dir="ltr">\[Dave’s Note -- Needs updating after review\] This has
the potential of customers seeing details about another customers server
details which includes hostnames, (public?) IPs, package versions which
are great data points for a hacker. If a customer saw this, they could
have publicly said something destroying our reputation. Supposedly we
are sanitizing public IPs but prodsec and Pete’s review saw some that
caused concerned.</span>

<span dir="ltr"></span>

<span dir="ltr">A mitigating factor is that the service is part of the
Cloud Service platform, which has not officially launched yet. Only 4
external pilot customers (TVA, Hilti, Govt of Indiana, Mayo Clinic) are
aware of its existence and how and where to access the service. None of
the pilot customers have reported seeing this issue. Also note that you
have to be using a search bar in the inventory in a specific way to
“discover” this issue.</span>

<span dir="ltr"></span>

## <span dir="ltr">What went well?</span>

*<span dir="ltr">List anything you think we did well and want to call
out. It's okay to not list anything.</span>*

  - > <span dir="ltr">Jozef Hartinger attempted to have the issue
    > resolved as soon as he noticed the vulnerability, and started the
    > ball rolling.</span>

  - > <span dir="ltr">Pete Savage actions, even if it turned out to not
    > be serious, we want to encourage better safe than sorry
    > behaviors</span>

  - > <span dir="ltr">We recognized it was an important issue when the
    > bug came in. Engineering fixed it immediately and QE tested
    > it.</span>

  - > <span dir="ltr">Our first RCA/post-mortem</span>

<span dir="ltr"></span>

## <span dir="ltr">What didn’t go so well?</span>

*<span dir="ltr">List anything you think we didn't do very well. The
intent is that we should follow up on all points here to improve our
processes.</span>*

  - > <span dir="ltr">Weren’t able to get a hold of Platform NA
    > engineers</span>

  - > <span dir="ltr">Bug was filed 17 days ago, engineering fixed it in
    > CI immediately, but we didn’t close out pushing it to prod</span>

  - > <span dir="ltr">No management escalation since engineers failed to
    > understand what is escalation worthy which this was (public IP
    > server.bank.com running this vulnerable kernel pkg)</span>

  - > <span dir="ltr">Cell phones were missing in
    > [<span class="underline">rover</span>](https://rover.redhat.com/people)
    > so some managers couldn’t be contacted</span>

  - > <span dir="ltr">Unrecognized numbers in cell phone contacts,
    > should managers, service leads add each other?</span>

  - > <span dir="ltr">No EMEA engineer with OSD admin rights to shut
    > services down, I propose Pete Savage should??? We could have
    > handled it within the team, would that have been acceptable
    > though, we definitely don;t want to sweep these type of events
    > under the rug</span>
    
      - > <span dir="ltr">Probably going to grant access to Jozef, PSE
        > over in EMEA. Need to determine how many folks we “should”
        > have access to PROD cluster per security suggestions. Maybe a
        > couple in EMEA would be nice (Jozef + Pete?)</span>

  - > <span dir="ltr">We started processing real customer data
    > (including those not in our pilot program) on a platform that is
    > still being built and still undergoing a security review. This
    > should have been communicated better with all engineers on the
    > platform. In this case the engineers understood that the bug was
    > critical (hence it being patched immediately) , but an incorrect
    > assumption that we were not yet handling real customer data was
    > part of the reason this was not escalated.</span>

  - > <span dir="ltr">The incident highlighted issues with our auditing
    > and logging capabilities. There was insufficient data to
    > thoroughly conduct an impact assessment . Some of these are
    > already being addressed as we align with Enterprise Security
    > Guide:</span>
    
      - > <span dir="ltr">Data retention is only 2 weeks</span>
    
      - > <span dir="ltr">Some logs were missing due to an underlying
        > Openshift</span>
        > <span dir="ltr">[<span class="underline">issue</span>](https://redhat.service-now.com/surl.do?n=INC0846127).</span>
    
      - > <span dir="ltr">3Scale does not log account number of
        > principal making a request. This makes it impossible to trace
        > request origin for users authenticating with
        > certificates.</span>
    
      - > <span dir="ltr">Inconsistent audit logging</span>

  - > <span dir="ltr">\[dbaker\] Initial response was to reach out on
    > \#security, not \#libra-noc to find SREs where the current on-call
    > rota is frequently published.</span>

> <span dir="ltr"></span>
> 
> <span dir="ltr"></span>

<span dir="ltr"></span>

## <span dir="ltr">Action Items</span>

*<span dir="ltr">Include action items such as:</span>*

*<span dir="ltr">(1) fixes required to prevent the issue in the
future,</span>*

*<span dir="ltr">(2) preparedness tasks that could help mitigate a
similar incident if it came up again,</span>*

*<span dir="ltr">(3) remaining postmortem steps, such as an internal
follow-up email, updating the public status page, etc</span>*

<span dir="ltr"></span>

<span dir="ltr"></span>

<table>
<thead>
<tr class="header">
<th><strong><span dir="ltr">Summit?</span></strong></th>
<th><strong><span dir="ltr">Action Item</span></strong></th>
<th><strong><span dir="ltr">Owner</span></strong></th>
<th><strong><span dir="ltr">Status</span></strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><span dir="ltr">Yes</span></td>
<td><span dir="ltr">Grant prod dedicated admin access to Jozef &amp; Pete to cover EMEA time zones</span></td>
<td><span dir="ltr">Stephen</span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Yes</span></td>
<td><span dir="ltr">Make sure key folks have their cell phones listed in Rover</span></td>
<td><span dir="ltr">Dave/Jonathan</span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Yes</span></td>
<td><span dir="ltr">Setup a system in PagerDuty to allow for sending an email which results in a page to the right people.</span></td>
<td><span dir="ltr">Jonathan</span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Minimal</span></td>
<td><p><span dir="ltr">Our incident management process is listed in a Google doc but it's very complicated. We need to break it down at the top to a much simpler set of steps (e.g., ping this channel, send this email, do XYZ)</span></p>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">[Jonathan Newton, 21-Jun-2019]: Calling this done as it works as of today. We are constantly iterating on it, making it better</span></p></td>
<td><span dir="ltr">Jonathan</span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Yes</span></td>
<td><p><span dir="ltr">Conduct training so engineers know what/when is escalation worthy</span></p>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">Tied to the code review process (top 5 things people should consider for security)</span></p></td>
<td><span dir="ltr">Lindani</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr"></span></td>
<td><p><span dir="ltr">Nuclear key process written down and discussed/communicated for two person agreement to shut items down?</span></p>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">Update the incident response process to indicate we want several folks available to help make the decision (e.g, oncall person + leads in time zone?)</span></p></td>
<td><span dir="ltr">Jonathan</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">No</span></td>
<td><span dir="ltr">Process around messaging the team when an event like this happens. QE was trying to do a test day and didn;t realize inventory was shutdown.</span></td>
<td><span dir="ltr">Jonathan</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="even">
<td><span dir="ltr">No</span></td>
<td><p><span dir="ltr">Review and decide if code review process changes are needed? How good are our reviews?</span></p>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">Related to training engineers on being more security focused.</span></p>
<p><span dir="ltr">Develop a formal code review checklist for the Platform</span></p>
<ul>
<li><blockquote>
<p><span dir="ltr">E..g, checking for account leakage</span></p>
</blockquote></li>
</ul>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">We can start with some other team and build from tha</span></p></td>
<td><span dir="ltr">Lindani</span></td>
<td><span dir="ltr"></span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">No</span></td>
<td><span dir="ltr">Simple QE functional test to see if account A cannot see account B “stuff” across apps (including hosts on inventory).</span></td>
<td><span dir="ltr">Dave</span></td>
<td><span dir="ltr">Some, inventory test in place, need other apps to have similar tests</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">Yes</span></td>
<td><p><span dir="ltr">Improve issue tracking for Critical bugs in JIRA:</span></p>
<ol type="1">
<li><blockquote>
<p><span dir="ltr">Bugs should be marked as Critical in JIRA</span></p>
</blockquote></li>
<li><blockquote>
<p><span dir="ltr">Daily digest email to Engineering manager to include status of Critical bugs</span></p>
</blockquote>
<ol type="a">
<li><blockquote>
<p><span dir="ltr">Sent to Jonathan’s engineering managers; Also available on our JIRA <a href="https://projects.engineering.redhat.com/secure/Dashboard.jspa?selectPageId=12730"><span class="underline">dashboard</span></a></span></p>
</blockquote></li>
</ol></li>
</ol></td>
<td><span dir="ltr">Jonathan</span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">Yes</span></td>
<td><p><span dir="ltr">Improve platform logging:</span></p>
<ol type="1">
<li><blockquote>
<p><span dir="ltr">Increase log retention period to at least 1year</span></p>
</blockquote></li>
<li><blockquote>
<p><span dir="ltr">Standardize audit log format for applications running on the platform (At a minimum the account number and principal must be recorded for each CRUD operation)</span></p>
</blockquote></li>
<li><blockquote>
<p><span dir="ltr">Monitor when there are issues with logging to improve reliability. <a href="https://redhat.service-now.com/surl.do?n=INC0846127"><span class="underline">https://redhat.service-now.com/surl.do?n=INC0846127</span></a></span></p>
</blockquote></li>
</ol>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">https://projects.engineering.redhat.com/browse/RHCLOUD-671</span></p>
<p><span dir="ltr">https://projects.engineering.redhat.com/browse/RHCLOUD-670</span></p>
<p><span dir="ltr">https://projects.engineering.redhat.com/browse/RHCLOUD-675</span></p>
<p><span dir="ltr"></span></p></td>
<td><span dir="ltr">Lindani</span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">No</span></td>
<td><p><span dir="ltr">Pipelines of fixing bugs verse pushing features and updates to services are different. Need further discussion,</span></p>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">Get together with some leads and PMs and QE to discuss this; Maybe look into some type or release train concept</span></p>
<p><span dir="ltr"></span></p>
<p><span dir="ltr">[Jonathan Newton, 21-Jun-2019] This is something that is ongoing and doesn’t need to be tracked here. Its a larger feature that we are looking into alongside CI/CD</span></p></td>
<td><span dir="ltr"></span></td>
<td><span dir="ltr">N/A</span></td>
</tr>
<tr class="odd">
<td><span dir="ltr">No</span></td>
<td><span dir="ltr">Would like to move further into cross-functional daily standups across QE and engineering, where we are looking at JIRAs</span></td>
<td><span dir="ltr"></span></td>
<td><span dir="ltr">Done</span></td>
</tr>
<tr class="even">
<td><span dir="ltr">No</span></td>
<td><span dir="ltr">Document the manual process for Insights + Platform deploying to production</span></td>
<td><span dir="ltr"></span></td>
<td><span dir="ltr"></span></td>
</tr>
</tbody>
</table>

<span dir="ltr"></span>

<span dir="ltr"></span>

<span dir="ltr"></span>
