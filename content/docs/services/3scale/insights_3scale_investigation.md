---
date: 2020-07-27 10:12:30.568109
title: Insights-3scale
---


## Initial Investigation

**Caveat**: The information here is from the initial investigation for the IPP. Some of which has been modified with the latest implementation of the API gateway. Please refer to the Insights-3scale configuration/onboarding guide for the latest details.


### Summary

Having a centralized location for defining, controlling and analyzing our Insights APIs with Red Hat 3scale will help us better manage our APIs as we morph our legacy API to multiple self-contained entities like Insights Inventory, Advisory, Security, etc. each with their relevant services.

### Motivation and Rationale

With the move of Insights to multiple SaaS offerings, the complexity of managing our API grows N-fold. Without a centralized way to define, manage, and analyze the APIs and their usage, problem of usage tracking, control and billing could worsen over time. Leveraging the Red Hat 3scale API Management Platform and using a common APIcast gateway for the Insights APIs, we will have the ability to view all of our SaaS offerings API usage, management and analytics from a single location.

# 3scale

## Recommended Configuration

### Account Requirement
In order to be able to manage multiple Red Hat Insights API’s with 3scale, allowing for multiple administrators, full SLA, and unlimited endpoints, an Enterprise account is recommended.

redhatinsights-admin.3scale.net has been setup for the Insights-3scale POC and can be updated as needed for production use.

### Deployment options

While integration with 3scale can be accomplished via different mechanisms, including:

- Insights API endpoints targeting the cloud based 3scale Insights service for authentication, authorization, analytics, etc. before getting redirected to the API service implementation. This is done with APIcast that is cloud hosted by 3scale.

- Having each Insights client app delegate to 3scale.net the authorization, rate limit, analytics with an included 3scale plugin library.

The recommended deployment option for enterprise production environments is to deploy a self-managed APIcast gateway. A very scalable Nginx gateway that we can customize as needed with lua configuration scripts.
Requirements

### Service definitions

#### OpenAPI (swagger) specifications

As per the current 3scale implementation, Service API's must be defined with the Swagger 2.0 specification. While our preference is the OpenAPI 3.0 specification, that will only be looked at by the 3scale team around end of year 2018.

### Metrics/Analytics

Any call to a service API is seen as a 'Hit' metric for seeing the usage analytics of an API. While that is the default is sufficient for us to see the volume of API calls against each of the Insights services, we can optionally declare the individual  API entry points as Methods. This allows for finer granularity in the analytics.

For example:

| Path       |
|------------|
| /systems   |
| /tags      |
| /cve       |
| /entities  |

Each Insights service could define their own metric as needed.

  **Insights Inventory**

| Verb  | Pattern   |   Methods  |
|-------|-----------|------------|
| GET   | /systems  | systems    |
| GET   | /tags     | tags       |


  **Insights Security**

| Verb  | Pattern   | Methods    |
|-------|-----------|------------|
| GET   | /cves     | cves       |


### Application definitions

Once we define an Insights API service specification, endpoints, metrics and integration via the 3scale service, accessing an Insights API is via the application definition. For example, an application would be analogous to Insights-Advisor that is accessing the Insights-Advisor-API.


| Application       | Account             | Service             | Plan      |
|-------------------|---------------------|---------------------|-----------|
| Insights-security | Redhat-InsightsDev  | insights_security   | Unlimited |
| Insights-advisor  | Redhat-InsightsDev  | insights_advisor    | Unlimited |



### APIcast Deployment

The self-managed APIcast gateway can be deployed in a number of ways. This includes a native deployment on our own server, as a docker container and finally on OpenShift. The latter being the recommendation for Insights.

#### OpenShift Deployment

For OpenShift, the image for the self-managed APIcast gateway can be obtained from:

registry.access.redhat.com/3scale-amp22/apicast-gateway:1.8

The template to use is obtained from git@github.com:3scale/3scale-amp-openshift-templates.git
with the template being apicast-gateway/apicast.yml

Before deploying the APIcast, the following basic-auth needs to be created:

```
$ oc secret apicast-configuration-url-secret
--password="https://<access_token>@redhatinsights-admin.3scale.net"
```

Access token must be created ahead of time for the redhatinsights 3scale account at the following location:

```
https://redhatinsights-admin.3scale.net/p/admin/user/access_tokens
```

For the APIcast gateway, it is best to define the parameters in an apicast.parameters file. following parameters are required:

```
SERVICES_LIST="2555417757973,2555417758299,2555417758300,...."
```

SERVICES_LIST is the list of 3scale insights API services that we want the gateway to process. The individual service IDs can be found in each insights service definition under https://redhatinsights-admin.3scale.net/apiconfig/services

Additional useful options for production:

```
APICAST_WORKERS=10
RESPONSE_CODES=true
CONFIGURATION_CACHE=300
```

Useful options for testing/debugging APicast:

```
LOG_LEVEL=debug
```

```
$ oc new-app -f apicast/insights-template.yml --param-file="apicast.parameters"
```

### Routing

For the API Gateway, services are defined with public facing URLs and Private URL (our implementation of the Insights APIs)

The gateway supports 'Staging' and 'Production' environments, each with their public URLs. Once a Staging API been thoroughly tested and verified, it can be  promoted to the Production stage.

One requirement for the API gateway is that the public URLs must be unique for each service API defined.

So for the Insights Inventory or Advisor API's their URLs must be unique. The single API gateway supports multiple services so the URL's must be carefully constructed.

The following example/approach would work for us:

We'd have the multiple Insights services implemented in different OpenShift pods, for example:

```
https://insights-inventory-api.<namespace>.svc.cluster.local:8080
https://insights-security-api.<namespace>.svc.cluster.local:8080
https://insights-advisor-api.<namespace>.svc.cluster.local:8080
```

These do not need to be externally facing with exposed routes as only the APIcast gateway needs to be able to get to them. Then we can bring up the APIcast in an OpenShift Pod, service 'apicast', port '8080' being the default, but we would declare the routes for the Insights services we expose. via APIcast.


So for the APIcast OpenShift pod at https://apicast-3scale.1b13.insights.openshiftapps.com, Insights service can be differentiated with the following exposed routes:

**Insights-inventory**

```
https://insights-inventory.apicast-3scale.1b13.insights.openshiftapps.com
→ apicast:8080
```

**Insights-security**

```
https://insights-security.apicast-3scale.1b13.insights.openshiftapps.com
→ apicast:8080
```

**Insights-advisor**

```
https://insights-advisor.apicast-3scale.1b13.insights.openshiftapps.com
→ apicast:8080
```


The APIcast service then processes the inbound requests and based on the Insight service definition's URL, redirecting the request to the private service URLs for that API request after the 3scale authorization.

Insights Client/App API request goes to the externally facing URLs :

```
https://access.redhat.com/insights/inventory/systems
https://access.redhat.com/insights/security/cves
https://access.redhat.com/insights/advisor/plugins
etc.
```

In which case we can have just a single rule defined in Akamai that would rewrite the request as follows:

```
   https://access.redhat.com/insights/<service>/<path>
     →   https://insights-<service>.apicast-3scale.1b13.insights.openshiftapps.com/<path>
```

Then APIcast gateway then forwards the request accordingly to https://insights-<service>.<namespace>.svc.cluster.local/<path> as defined by the Insights API service definition in 3scale.



| Type                 | URL |
|----------------------|-----|
| External             | https://access.redhat.com/insights/\<service\>/\<path\>
|                      | requirement for all services
| APIcast              | https://insights-\<service\>.apicast-3scale.1b13.insights.openshiftapps.com/\<path\>
|                      | requirement for all services
| Insights Service     | https://insights-\<service\>.\<namespacenamespace\>.svc.cluster.local/\<path\>
|                      | can be service specific

## Service Authentication
### Background

Note that services define how they are to be authenticated in their APIcast Integration settings.
API requests are authenticated by properly identifying the application.

Authentication options include:
An API key (user_key)
Application ID and Key pair (app_id and app_key),
OAuth 2.0
OpenID Connect

How these API keys or Application ID/key pairs are specified in the API requests is defined in  the APIcast configuration.

- user\_key in HTTP Header or as a Query parameter
- app\_id and app\_key pairs in HTTP Header or as Query parameters.
- OAuth Authorization Endpoint
- OpenID Connect Issuer

User\_key or app\_id and app\_key pairs can be specified in the request Query or via Headers, the actual values for these keys are defined in the application definition under API Credentials.

Only a single API key (user\_key) can be defined in a 3scale application, however Application ID and Key pairs is more flexible as it allows us to define multiple application keys that can go with the single Application Id. Application keys can individually be revoked if needed.

While OpenID Connect can be configured to wire the APIcast gateway against RH SSO/Keycloak, we need to support certAuth authentication. certAuth authentication can be done by leveraging the Backoffice-Proxy (Insights Platform Services) from the gateway. Choosing the Application ID/Key pair authentication for 3scale above for our integration gives us the most flexibility.

### Definition

First step in enabling the Application ID/Key pair authentication, the swagger spec for the Insights Service must declare the authentication requirements as follows:

```
  ...
  "securityDefinitions": {
    "ApplicationId": {
      "type": "apiKey",
      "in": "header",
      "name": "application-id"
    },
    "ApplicationKey": {
      "type": "apiKey",
      "in": "header",
      "name": "application-key"
    }
  },
  "security": [
    {
      "ApplicationId": [],
      "ApplicationKey": []
    }
  ],
  ...
```

Next, the Integration Settings for the Insights API service must define the following:

#### insights_inventory->Integration & Configuration

##### Integration settings


    Deployment Option   APIcast self-managed
    Authentication      App_ID and App_Key Pair

##### APIcast Configuration


##### insights_inventory->Integration

    API Gateway

###### Authentication Settings

Credentials location:

* As HTTP Headers


App ID parameter

```
application-id
```

App Key parameter

```
application-key
```




## Insights
### Request/Process Flow

Insights Application
Initiates an SSL cert mutual authentication to cloud.redhat.com
Makes an Insights Inventory API call

```GET https://access.redhat.com/insights/inventory/systems ```

Akamai
Creates the necessary Issuer and CN from the trusted certificate
Forwards request to APIcast gateway

```GET https://insights-inventory.apicast-3scale.1b13.insights.openshiftapps.com/systems```

Headers:

* x-rh-certauth-issuer
* x-rh-certauth-cn


### APIcast Gateway
Verifies inbound request is only from Akamai
If this is a non-Akamai request, the APIcast Gateway will return an HTTP 403 Forbidden.

_Otherwise:_

Initiates an SSL cert mutual authentication with the backoffice-proxy
Calls the Insights Platform Service backoffice-proxy to authenticate the CN/Issuer

```GET https://<backoffice-proxy>:8083/v1/auth```

Headers:

* x-rh-certauth-issuer
* x-rh-certauth-cn

Note: x-rh-insights-certauth-secret is no longer needed as only Akamai requests will be accepted by the 3scale APIcast gateway.
Upon failed auth, return an HTTP 403 Forbidden
      Otherwise:
Based on the inbound URL, determine the 3scale service and related application credentials. Update request headers accordingly to include the relevant application-id and application-key  (currently prototyped).
Also, add to the request headers x-rh-auth-identity. A key identifying the authenticated system/principal. An example of the x-rh-auth-identity object is included here below.

```GET https://insights-inventory.apicast-3scale.1b13.insights.openshiftapps.com/systems```

Headers:

* x-rh-certauth-issuer
* x-rh-certauth-cn
* x-rh-auth-identity    - details on content to be proposed in a separate IPP.
* application-id
* application-key

APIcast gateway will then have 3scale authorize the request.
Upon failed authorization, 3scale could return one of the following:

* HTTP 403 Authentication failed
* HTTP 403 Authentication parameters missing
* HTTP 403 No Mapping Rule matches
* HTTP 403 Throttling due to too many requests

_Otherwise:_

Request gets forwarded to the Insights API service.


### Insights API Service

```GET https://insights-inventory.<namespace>.svc.cluster.local/systems```

Headers:

* x-rh-certauth-issuer
* x-rh-certauth-cn
* x-rh-auth-identity



## X-rh-auth-identity Example

The x-rh-auth-identity is a plain json object representing the identity of the authenticated principal. This is irregardless of the authenticated method (cert, RH SSO, etc). The object could include the following sections:

settings section that may include user preferences
Identity section that would include the user/principal identification from RHN. This is based on the current object returned by the backoffice-proxy.
authorization section wouldcould include information about the user’s group membership and implied role that would determine the RBACuser’s constraints and permissions for the authenticated principal as per the role definition in the RBAC proposal.

```
{
  "settings" : {
    "locale" : "en_US"
  },
  "identity" : {
    "id" : 1122334,
    "org_id" : "3340851",
    "account_number" : "0369233",
    "username" : "jdoe@acme.com",
    "email" : "jdoe@acme.com",
    "first_name" : "john",
    "last_name" : "doe"
    "address_string": "\"john doe\" jdoe@acme.com"
    "is_active" : true,
    "is_org_admin" : false,
    "is_internal" : false,
    “locale” : “en_US”
  },
  "authorization" : {
    "current_groupgroup" : "Operators",
    “role” : “OperatorRole”,
    "groupsgroup_membership" : [ "Operators", "Auditors", "Support", "Approvers" ],
    "role" : "OperatorRole"
  }
}
```

The above is just an example, the definition of the object would be defined in a separate proposal.
