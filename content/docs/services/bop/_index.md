---
date: 2020-06-04 22:15:01.163996
title: Back Office Proxy (BOP)
---
<div id="back-office-proxy-bop" class="section">


This is a simple API to access Red Hat internal services from the Insights Platform.

The BOP OpenAPI is available here:
<https://access.redhat.com/r/insights-services/v1/docs/>

To get access to the BOP, a project needs to obtain an Application ID
(APP ID) and an access token.

There are two separate instances of BOP for

  - CI/QA

  - Production

That have need different tokens.

To request access, open a Jira at
<https://projects.engineering.redhat.com/secure/RapidBoard.jspa?rapidView=2415>
and tag Lindani Phiri in the request. The request needs to contain the
project namespaces - the tokens will then be provided in a Kubernetes
secret.


Details
---
The purpose of this project is to provide a consistent REST API to access Red Hat internal services. This allows the internal services to change without requiring each Insights Platform Applications to change. 

Each endpoint utilizes at least one internal service as mapped in this table:

| Backoffice Proxy Endpoint         | Internal Services Used |
| -----------------------------     | ---------------------- |
| /articles/{articleId}             | /rs/search?q=id:{articleId}
| /auth (basic)                     | /v2/verifyPassword <br> /v2/findUsers
| /auth (cert)                      | /subscription-admin/rest/findOwner/{cert}/
| /auth (systemid)                  | /REDHAT-XMLRPC
| /entitlements/{accountNumber}     | /svcrest/subscription/v5/search/criteria;status=active;oracle_account_number={accountNumber}/options;products=ALL
| /sendEmails                       | /svcrest/email/send <br> /v2/findUsers
| /users                            | /v2/findUsers <br> /v2/findAccounts
| /accounts/{accountNumber}/users   | /v2/findUsers
| /v2/accounts/{accountNumber}/users| /v2/findUsers <br> /v2/findUsersCount
</div>