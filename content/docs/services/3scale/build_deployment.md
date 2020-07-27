---
date: 2020-07-27 13:51:55.867676
title: Build and Deployment of the API Gateways
---

## The sources

The API gateways are always built and deployed from their source and image repos. This includes Github, Gitlab and Quay registries for the image built based on the 3scale APIcast gateway.

### Setting up a build environment

* First thing is to setup a new directory for the Insights-3scale gateway builds.

* Fork (for pushing updates) and Clone the following repos in the new directory:


| Repo | Description | Type |
|------|-------------|------|
| github.com:RedHatInsights/**insights-3scale**.git             | Build and Deployment scripts      | Private |
| github.com:RedHatInsights/**insights-3scale-docs**.git        | All Insights-3scale documentation | Private |
| gitlab.cee.redhat.com:abellott/**insights-3scale-config**.git | Source of certs, secrets and configurations for the OpenShift pods as well as 3scale and OpenShift account info. | Private |


### Relevant files & directories

| Repo                   | File(s) | Content |
|------------------------|---------|---------|
| insights-3scale        | insights-3scale.sh                   | Build and Deployment script |
| insights-3scale        | secrets.sh                           | Secret management script    |
| insights-3scale        | build/docker-assets/ <br> templates/ | Directories for Insights specific updates to the APIcast image <br> and template to use for building the APIcast gateways |
| insights-3scale-config | environment.sh                       | Default ENV variables used for builds and deployments |
| insights-3scale-config | config/                              | Source for the apicast-insights-3scale-config config |
| insights-3scale-config | config/insights\_3scale.json         | 3scale service definitions and PSKs |
| insights-3scale-config | config/insights\_akamai.json         | Akamai/Fakamai PSK |
| insights-3scale-config | config/insights\_auth.json           | Environment-specific auth config |
| insights-3scale-config | config/insights\_classic.json        | Insights Classic/Legacy PSKs |
| insights-3scale-config | config/insights\_config.json         | Base config for all environments |
| insights-3scale-config | config/insights\_entitlements.json   | Entitlements service config |
| insights-3scale-config | config/insights\_logger.json         | Config for logger |
| insights-3scale-config | config/insights\_services.json       | Insights Services URLs & PSKs |
| insights-3scale-config | config/uhc\_service.json             | Config for UHC auth service |
| insights-3scale-config | certs/                               | Certs, keys and CA's used with Akamai/Fakamai & Insights Services |
| insights-3scale-config | ephemeral/certs/                     | Ephemeral (self-signed) Certs, keys and CA's used with Akamai/Fakamai & Insights Services in ephemeral deployments |
| insights-3scale-config | ephemeral/config/*                   | Config ephemeral deployments |


**Note:** All of the above files are checked into Github/Gitlab with defaults for Dev builds and deployments. Triggering production or staging builds and deployments can be done by updating the above or simply use the appropriate options to the insights-3scale.sh script (_recommended_).


## The Environments


| OpenShift Project | Environments            | Gateways | Route | Target Port |
|-------------------|-------------------------|----------|-------|-------------|
| 3scale				    | Production <br> Stage   | api-gateway.1b13.insights.openshiftapps.com    <br> api-gateway-stage.1b13.insights.openshiftapps.com  | api-gateway <br> api-gateway-stage | 9091 <br> 9092 |
| 3scale-staging    | CI <br> QA              | api-gateway-qa.5a9f.insights.openshiftapps.com <br> api-gateway-ci.5a9f.insights.openshiftapps.com     | api-gateway-qa <br> api-gateway-ci | 9191 <br> 9192 |
| 3scale-dev        | Dev (_default_)         | api-gateway-dev.5a9f.insights-dev.openshiftapps.com                                                    | api-gateway-dev                    | 9291 |

| Gateway           | Used by  | Accessed via                                        |
|-------------------|----------|-----------------------------------------------------|
| api-gateway       | Akamai   | cloud.redhat.com                                    |
| api-gateway-stage | Fakamai  | stage.cloud.redhat.com                 |
| api-gateway-qa    | Fakamai  | qa.cloud.redhat.com                    |
| api-gateway-ci    | Fakamai  | ci.cloud.redhat.com                    |
| api-gateway-dev   | Dev/curl | api-gateway-dev.5a9f.insights-dev.openshiftapps.com |



## Building a new API gateway docker image in Quay

Relevant environment variables include:

| Env                         | Default         | Description                                                                                             |
|-----------------------------|-----------------|---------------------------------------------------------------------------------------------------------|
| DOCKER\_REGISTRY\_SERVER    | quay.io         | The Quay registry host                                                                                  |
| DOCKER\_USERID              |                 | Quay userid to use for pushing the built images to (requires access to `cloudservices/insights-3scale`) |
| DOCKER\_TOKEN               |                 | The Quay API Token to use for logging into the Quay registry                                            |
| DOCKER\_NAMESPACE           | cloudservices   | Quay namespace/org                                                                                      |
| DOCKER\_REPOSITORY          | insights-3scale | Quay repository                                                                                         |
| GITLAB\_USER                |                 | The GitLab deploy token username for insights-3scale-config                                             |
| GITLAB\_TOKEN               |                 | The GitLab deploy token pass for insights-3scale-config                                                 |

Before building and pushing a new image, you must login to the DOCKER\_USERID account via

```
docker login -u ${DOCKER_USERID} -p ${DOCKER_APITOKEN} ${DOCKER_REGISTRY_SERVER}
```

### Building an image:

From the insights-3scale directory, use the following commands for building new docker images:

| Command                     | Environments            | OpenShift Project | OpenShift Image Streams          |
|-----------------------------|-------------------------|-------------------|----------------------------------|
| insights-3scale.sh -p build | Production  <br> Stage  | 3scale            | apicast-gateway:insights-latest  |
| insights-3scale.sh -s build | CI <br> QA              | 3scale-staging    | apicast-gateway:insights-staging |
| insights-3scale.sh -d build | Dev                     | 3scale-dev        | apicast-gateway:insights-dev     |

### Updating config:

_NOTE: in order to update cert secrets, currently you'll need to delete the secret and redeploy with `ocdeployer`_

From the insights-3scale directory, use the following commands for updating config in the secrets projects:

| Command                     | Environments            | OpenShift Project          | Description                  |
|-----------------------------|-------------------------|----------------------------|------------------------------|
| secrets.sh -p update-config | Production  <br> Stage  | gateway-secrets            | updates the config secret    |
| secrets.sh -s update-config | CI <br> QA              | gateway-secrets-staging    | updates the config secret    |
| secrets.sh -d update-config | Dev                     | gateway-secrets-dev        | updates the config secret    |
| secrets.sh -p reset-secrets | Production  <br> Stage  | gateway-secrets            | resets/recreates all secrets |
| secrets.sh -s reset-secrets | CI <br> QA              | gateway-secrets-staging    | resets/recreates all secrets |
| secrets.sh -d reset-secrets | Dev                     | gateway-secrets-dev        | resets/recreates all secrets |

### Adding a service to 3scale:

Now that we use e2e-deploy, when we provision a new service in 3scale, we need to take the service IDs for the environments we've created the service in, and open a PR into e2e-deploy, adding those IDs to the corresponding `/env/*.yml` files in the `SERVICES_LIST` yaml config.

We will still add the config to `/config/insights_3scale.json` in the config project, which will update the secret via the `./secrets.sh` script above, when running `update-config`.

### Deploying:

For most cases, deployments should be managed using the e2e-deploy project, with `ocdeployer`: https://github.com/RedHatInsights/e2e-deploy/tree/master/templates/gateway#deploying-the-gateway

There are still some commands that can be run with install-3scale.sh, as follows:

```
Usage: insights-3scale.sh [-c <config_dir>] [-d|-s|-p] [build | deploy | destroy | redeploy | build-redeploy | rollout | build-rollout | enable-debug | disable-debug | set-env-var | unset-env-var]
```

| Option               | Description |
|----------------------|-------------|
| -d                   | Select Dev Environment |
| -s                   | Select Staging Environment |
| -p                   | Select Production Environment |
| build                | Build new API gateway images for the selected environment and pushes to Quay |
| deploy               | Deploys via local e2e-deploy/ocdeployer |
| destroy              | Destroys current API gateway (dc/services/routes/secrets/...) |
| redeploy             | Destroys current API gateway (dc/services/routes/secrets/...) and Deploys new API gateway |
| build-redeploy       | Compound subcommand to do a full build and redeploy of a new API gateway |
| rollout              | Rolls out the latest API gateway build without a destructive redeploy |
| build-rollout        | Rebuilds the app and deployes the latest API gateway build (with ocdeployer) without a destructive redeploy |
| enable-debug         | Sets the APICAST_INSIGHTS_GATEWAY_DEBUG environment variable for additional debugging |
| disable-debug        | Unsets the APICAST_INSIGHTS_GATEWAY_DEBUG environment variable, disabling additional debugging |
| set-env-var          | Sets the specified environment variable, enabling it |
| unset-env-var        | Unsets the specified environment variable, disabling it |

Relevant environment variables (defaults from environment.sh) for deployment include:

| Env            | Default                             | Description |
|----------------|-------------------------------------|-------------|
| OC\_PROJECT    | 3scale-dev                          | The OpenShift project to use for deploying/redeploying/updating-config <br> Variable is overwritten when specifying the environment via -p, -s or -d.|
| OC\_APIDOMAIN  | api.insights-dev.openshift.com      | The OpenShift API Domain to use for oc login |
| OC\_APITOKEN   |                                     | The OpenShift API Token to use for oc login <br> Must obtain a token from https://${OC\_APIDOMAIN} |
| OC\_DOMAIN     | 5a9f.insights-dev.openshiftapps.com | The Default domain for routes to the gateways |

### Examples

Update config only (example adding a new service):

```bash
# 1) run `itsadmin create ... ` for each environment, INCLUDING EPHEMERAL
itsadmin create --namespace=platform --env=ephemeral --url=http://new-service:8080 new-service

# 2) in the insights-3scale-config project, update configuration
itsadmin configuration > config/insights_3scale.json
itsadmin configuration ephemeral > ephemeral/config/insights_3scale.json

# 3) open a PR into insights-3scale-config with these changes
# 4) copy service ids to e2e-deploy with `itsadmin update-service-ids`
itsadmin update-service-ids

#5) open a PR into e2e-deploy with the new service IDs, per env file
  # dev-self-contained.yml (ephemeral) env config file: needs ephemeral IDs
  # DEV env config file: needs DEV and CI IDs
  # CI/QA env config files: need both CI/QA IDs
  # PROD env config file: needs both STAGE/PROD IDs

# 6) in the insights-3scale project directory, update the config in the secrets projects
./secrets.sh -d update-config
./secrets.sh -e update-config

# 6) run the shortcut command from ./insights-3scale.sh:
./insights-3scale.sh -d deploy

# the above will execute the equivalent of:
# ocdeployer deploy 3scale-dev -s gateway -e env/dev.yml --secrets-src-project gateway-secrets-dev
```

Update code/build only:

```bash
# 1) run the shortcut command from ./insights-3scale.sh, which will build the image and run `ocdeployer`:
./insights-3scale.sh -d build-rollout

# the above will execute the equivalent of:
# ./insights-3scale.sh -d build
# ocdeployer deploy 3scale-dev -s gateway -e env/dev.yml --secrets-src-project gateway-secrets-dev
```