---
date: 2020-06-04 22:14:59.723993
title: Authentication
weight: 110
---
<div id="authentication" class="section">


All Insights Platform applications will be hosted behind the 3Scale API
gateway, which will handle authentication. Please see the [Web API
Gateway](https://docs.google.com/document/d/1nm03Ha95UnjZnT-5h2lQSStU73AW3_DIYqYHwDZoSPQ/edit?usp=sharing)
IPWG proposal for more detail.

Once authenticated, 3scale will issue a JWT (JsonWebToken) that is then
evaluated by Chrome to set various parameters like the user name.

3Scale also ensures that any request to the REST-Apis is authenticated.
Requests cary the x-rh-identity header, which is a base64 encoded
JSON-representation. The format looks like the following.

[![../\_images/x-rh-identity.png](../_images/x-rh-identity.png)](../../_static/x-rh-identity.png)

The data is also available in the UI via insights.chrome.auth.getUser()
e.g.:

<div class="highlight-javascript notranslate">

<div class="highlight">

    insights.chrome.auth.getUser().then((value: any) =>
    {
        this.setState({ accountNumber: value.identity.account_number,
            username: value.identity.user.username });
    });

</div>

</div>

</div>