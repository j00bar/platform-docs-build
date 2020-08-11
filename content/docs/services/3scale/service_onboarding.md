---
date: 2019-10-02 20:04:47
title: Service Onboarding in 3scale
---


## Prerequisites

* Service should be running in the same OpenShift Dedicated cluster as the Insights Platform
* Service should be deployed as part of the Pod implementing the micro-service
* Service should be accessible via the Cluster internal URL

For example:

```
http://sample-service.sample-project.svc.cluster.local:8080
```

In the example above, **sample-service** is the name of the new Insights service whose API we want to expose and access via 3scale.

| name              | description          | note |
|-------------------|----------------------|------|
| sample-service    | Name of the service  | should be unique for all Insights SaaS services |
| sample-project    | Name of the OpenShift project that implements the sample-service | |
| svc.cluster.local | Cluster local domain | |
| 8080              | Service Port         | the Port the sample-service is listening on |

## Information needed for onboarding the new service

* A unique service name - all lower-cased letters and optional dashes. [a-z-]*
 - i.e. **sample\-service**
 - Service name cannot include trailing -stage, -qa, -ci or -dev
* URL for the production service
 - i.e. **http://sample-service.sample-project.svc.cluster.local:8080**
* Optional URLs for the staging services (stage, qa and ci)
 - i.e. **http://sample-service.sample-project-stage.svc.cluster.local:8080**
 - i.e. **http://sample-service.sample-project-qa.svc.cluster.local:8080**
 - i.e. **http://sample-service.sample-project-ci.svc.cluster.local:8080**

___


## Accessing the service

For the new **sample-service** being onboarded, the following paths reflect how one accesses the service API:

### Production - Akamai

| Auth-Type  | URL     |
|------------|---------|
| Basic-Auth | https://cloud.redhat.com/api/**sample-service**/\<path\>      |
| Cert-Auth  | https://cert.cloud.redhat.com/api/**sample-service**/\<path\> |

### Staging - Fake Akamai

| Environment | Auth-Type  | URL     |
|-------------|------------|---------|
| Stage       | Basic-Auth/Cert-Auth | https://stage.cloud.redhat.com/api/**sample-service**/\<path\>           |
| QA          | Basic-Auth/Cert-Auth | https://qa.cloud.redhat.com/api/**sample-service**/\<path\>              |
| CI          | Basic-Auth/Cert-Auth | https://ci.cloud.redhat.com/api/**sample-service**/\<path\>              |


___


## Defining the service in 3scale

Service definition in 3scale is done on the RedHatInsights 3scale account.
First step is to login to that account at:

[https://redhatinsights-admin.3scale.net](https://redhatinsights-admin.3scale.net)

with an administrative user.

### 3scale service names

For each Insights service, a service must be defined in 3scale. One for production (accessing via Akamai), and optionally one for each of the environments (ci, qa and stage) to be accessed via Fakamai.


| Environment | 3scale Service Name              | Public URL |
|-------------|----------------------------------|------------|
| Production  | platform\_sample\_service        | https://cloud.redhat.com/api/**sample-service**/\<path\>                          |
| Stage       | platform\_sample\_service\_stage | https://stage.cloud.redhat.com/api/**sample-service**/\<path\> |
| QA          | platform\_sample\_service\_qa    | https://qa.cloud.redhat.com/api/**sample-service**/\<path\>    |
| CI          | platform\_sample\_service\_ci    | https://ci.cloud.redhat.com/api/**sample-service**/\<path\>    |



___


### Defining the Production Service


The following command will create the Threescale service, Application, Application Plan, Mapping Rules and necessary integration and proxy settings.


```
$ itsadmin --provider-key=<provider_key> create
			     --namespace=platform
			     --env=prod
			     --url=http://sample-service.sample-project.svc.cluster.local:8080
			     sample-service
```

The *provider-key* can be obtained from the Threescale Settings->Account page.

**Note:** *provider-key* can also be stored in the ~/.insights\_threescale\_provider\_key file so it does not need to be specified with every *itsadmin* command line invocation. If you do so, please make sure the file is read-only by the file owner.


#### Repeat the above steps for each of the environments the <sample\_service> is deployed.

i.e.

```
$ itsadmin --provider-key=<provider_key> create
			     --namespace=platform
			     --env=ci
			     --url=http://sample-service.sample-project-ci.svc.cluster.local:8080
			     sample-service
```

```
$ itsadmin --provider-key=<provider_key> create
			     --namespace=platform
			     --env=qa
			     --url=http://sample-service.sample-project-qa.svc.cluster.local:8080
			     sample-service
```

*Note:* Usage of other capabilities of the itsadmin tool is available via `itsadmin --help`

___

## Update the API gateways to accept requests for the new service

For the APIcast gateways to know about the new services, we need to get the relevant 3scale service names, ids then related application ids and keys.

From the Insights-3scale checked out build repos:

* github.com:RedHatInsights/insights-3scale.git
* gitlab.cee.redhat.com:abellott/insights-3scale-config.git

#### Update the insights-3scale-config repo

The new service definitions need to go to the insights-3scale-config repo.

* update the config/_insights\_3scale.json_ / ephemeral/config/_insights\_3scale.json_ files to include the service name, ids and related application ids and keys:

```
  $ cd insights-3scale-config/config
  $ itsadmin --provider-key=<provider_key> configuration > insights_3scale.json
  $ itsadmin --provider-key=<provider_key> configuration ephemeral > ephemeral/config/insights_3scale.json
```

* Commit and push the updated changes to the insights-3scale-config repo.

#### Update the e2e-deploy repo

The new service ids need to go to the e2e-deploy repo.

* edit the env files to include the service ids of **platform-sample-service** and related services from the other environments:

Requires the following ENV variables to be set:

```
E2E_PROJECT_PATH               # should be the root of the project
INSIGHTS_EPHEMERAL_CONFIG_PATH # should be the config dir for the ephemeral config
INSIGHTS_CONFIG_PATH           # should be the main config dir in insights-3scale-config
```

Then run:

```
  $ itsadmin update-service-ids
```

#### Update the configuration of the API gateways

* Go to the checked out _github.com:RedHatInsights/insights-3scale_ repo
* Setup the necessary Openshift API Token OC\_APITOKEN\_PROD for api.insights.openshift.com and OC\_APITOKEN\_DEV for api.insights-dev.openshift.com
* Push the configuration to the staging secret projects (qa & ci):

```
./secrets.sh -s update-config
```

* Finally, push the configuration to the production gateways (prod & stage):

```
./secrets.sh -p update-config
```


## Test the new service API

* Access the production back-end sample-service /api/widgets endpoint via Akamai:


```
curl -k https://cloud.redhat.com/api/sample-service/api/widgets \
     --user jdoe@redhat.com
```

* Access the staging back-end sample-service /api/widgets endpoint via Fake akamai:


```
curl -k https://qa.cloud.redhat.com/api/sample-service/api/widgets \
     --user jdoe@redhat.com
```