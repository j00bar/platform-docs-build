---
date: 2020-07-27 13:43:42.047566
title: Insights Role Based Access Control README
---
<div id="insights-role-based-access-control-readme" class="section">


[![license](https://img.shields.io/github/license/RedHatInsights/insights-rbac.svg)](https://github.com/RedHatInsights/insights-rbac/blob/master/LICENSE)
[![Build
Status](https://travis-ci.org/RedHatInsights/insights-rbac.svg?branch=master)](https://travis-ci.org/RedHatInsights/insights-rbac)
[![codecov](https://codecov.io/gh/RedHatInsights/insights-rbac/branch/master/graph/badge.svg)](https://codecov.io/gh/RedHatInsights/insights-rbac)
[![Updates](https://pyup.io/repos/github/RedHatInsights/insights-rbac/shield.svg?t=1524249231720)](https://pyup.io/repos/github/RedHatInsights/insights-rbac/)
[![Python 3](https://pyup.io/repos/github/RedHatInsights/insights-rbac/python-3-shield.svg?t=1524249231720)](https://pyup.io/repos/github/RedHatInsights/insights-rbac/)
[![Docs](https://readthedocs.org/projects/insights-rbac/badge/)](https://insights-rbac.readthedocs.io/en/latest/)

<div id="about" class="section">

## About

Insights RBAC’s goal is to provide an open source solution for storing
roles, permissions and groups.

Full documentation is available through
[readthedocs](http://insights-rbac.readthedocs.io/en/latest/) . More
info is available through
[platformdocs](https://platform-docs.cloud.paas.psi.redhat.com/backend/rbac.html)
.

<div id="getting-started" class="section">

### Getting Started

This is a Python project developed using Python 3.6. Make sure you have
at least this version installed.

</div>

<div id="development" class="section">

### Development

To get started developing against Insights-rbac first clone a local copy
of the git repository.

<div class="highlight-default notranslate">

<div class="highlight">

    git clone https://github.com/RedHatInsights/insights-rbac.git

</div>

</div>

Developing inside a virtual environment is recommended. A Pipfile is
provided. Pipenv is recommended for combining virtual environment
(virtualenv) and dependency management (pip). To install pipenv, use pip

<div class="highlight-default notranslate">

<div class="highlight">

    pip3 install pipenv

</div>

</div>

Then project dependencies and a virtual environment can be created using

<div class="highlight-default notranslate">

<div class="highlight">

    pipenv install --dev

</div>

</div>

To activate the virtual environment run

<div class="highlight-default notranslate">

<div class="highlight">

    pipenv shell

</div>

</div>

<div id="preferred-environment" class="section">

#### Preferred Environment

Please refer to [Working with
Openshift](https://insights-rbac.readthedocs.io/en/latest/openshift.html)
.

</div>

<div id="alternative-environment" class="section">

#### Alternative Environment

If deploying with Openshift seems overly complex you can try an
alternate local environment where you will need to install and setup
some of the dependencies and configuration.

<div id="configuration" class="section">

##### Configuration

This project is developed using the Django web framework. Many
configuration settings can be read in from a .env file. An example file
.env.example is provided in the repository. To use the defaults simply

<div class="highlight-default notranslate">

<div class="highlight">

    cp .env.example .env

</div>

</div>

Modify as you see fit.

</div>

<div id="database" class="section">

##### Database

PostgreSQL is used as the database backend for Insights-rbac. A
docker-compose file is provided for creating a local database container.
If modifications were made to the .env file the docker-compose file will
need to be modified to ensure matching database credentials. Several
commands are available for interacting with the database.

<div class="highlight-default notranslate">

<div class="highlight">

    # This will launch a Postgres container
    make start-db
    
    # This will run Django's migrations against the database
    make run-migrations
    
    # This will stop and remove a currently running database and run the above commands
    make reinitdb

</div>

</div>

Assuming the default .env file values are used, to access the database
directly using psql run

<div class="highlight-default notranslate">

<div class="highlight">

    psql rbac -U rbacadmin -h localhost -p 15432

</div>

</div>

There is a known limitation with docker-compose and Linux environments
with SELinux enabled. You may see the following error during the
postgres container deployment:

<div class="highlight-default notranslate">

<div class="highlight">

    "mkdir: cannot create directory '/var/lib/pgsql/data/userdata': Permission denied" can be resolved by granting ./pg_data ownership permissions to uid:26 (postgres user in centos/postgresql-96-centos7)

</div>

</div>

If a docker container running Postgres is not feasible, it is possible
to run Postgres locally as documented in the Postgres
[tutorial](https://www.postgresql.org/docs/10/static/tutorial-start.html)
. The default port for local Postgres installations is 5432 . Make sure
to modify the .env file accordingly. To initialize the database run

<div class="highlight-default notranslate">

<div class="highlight">

    make run-migrations

</div>

</div>

You may also run migrations explicitly, and in parallel, by specifying
TENANT\_PARALLEL\_MIGRATION\_MAX\_PROCESSES (the number of concurrent
processes to run migrations) and/or TENANT\_PARALLEL\_MIGRATION\_CHUNKS
(the number of migrations for each process to run at a time). Both of
these values default to 2. *Be mindful of the fact that bumping these
values will consume more database connections:*

> 
> 
> <div>
> 
> TENANT\_PARALLEL\_MIGRATION\_MAX\_PROCESSES=10
> TENANT\_PARALLEL\_MIGRATION\_CHUNKS=2 ./rbac/manage.py
> migrate\_schemas –executor=parallel
> 
> </div>

</div>

<div id="seeds" class="section">

##### Seeds

Default roles and groups are automatically seeded when the application
starts by default unless either of the following environment variables
are set to ‘False’ respectively:

<div class="highlight-default notranslate">

<div class="highlight">

    PERMISSION_SEEDING_ENABLED
    ROLE_SEEDING_ENABLED
    GROUP_SEEDING_ENABLED

</div>

</div>

Locally these are sourced from /rbac/management/role/definitions/\*.json
, while the config maps in deployed instances are source from our [RBAC
config repo](https://github.com/RedHatInsights/rbac-config.git) . **If
any changes to default roles/groups are required, they should be make
there.**

You can also execute the following Django command to run seeds manually.
It’s recommended that you disable db signals while running seeds with
ACCESS\_CACHE\_CONNECT\_SIGNALS=False . Caching will be busted after
seeding for each tenant has processed. You may also specify the number
of concurrent threads in which seeds should be run, by setting
MAX\_SEED\_THREADS either in the process, or the app environment. The
default value is 2. *Be mindful of the fact that bumping this value will
consume more database connections:*

<div class="highlight-default notranslate">

<div class="highlight">

    ACCESS_CACHE_CONNECT_SIGNALS=False MAX_SEED_THREADS=2 ./rbac/manage.py seeds [--roles|--groups|--permissions]

</div>

</div>

</div>

<div id="server" class="section">

##### Server

To run a local dev Django server you can use

<div class="highlight-default notranslate">

<div class="highlight">

    make serve

</div>

</div>

To run the local dev Django on a specific port use:

<div class="highlight-default notranslate">

<div class="highlight">

    make PORT=8111 serve

</div>

</div>

</div>

</div>

<div id="making-requests" class="section">

#### Making Requests

You can make requests to RBAC locally to mimic traffic coming from the
gateway, or locally within the same cluster from another internal
service.

<div id="basic-jwt-auth-with-an-identity-header" class="section">

##### Basic/JWT Auth with an Identity Header

By default, with the DEVELOPMENT variable set to True , the
dev\_middleware.py will be used. This will ensure that a mock identity
header will be set on all requests for you. You can modify this header
to add new users to your tenant by changing the username , create new
tenants by changing the account\_number , and toggling between
admin/non-admins by flipping is\_org\_admin from True to False .

This will allow you to simulate a JWT or basic-auth request from the
gateway.

</div>

<div id="serivce-to-service-requests" class="section">

##### Serivce to Service Requests

RBAC also allows for service-to-service requests. These requests require
a PSK, and some additional headers in order to authorize the request as
an “admin”. To test this locally, do the following:

First disable the local setting of the identity header in
dev\_middleware.py by \[commenting this line out\](
<https://github.com/RedHatInsights/insights-rbac/blob/master/rbac/rbac/dev_middleware.py#L53>
)

Next, start the server with:

<div class="highlight-default notranslate">

<div class="highlight">

    make serve SERVICE_PSKS='{"catalog": {"secret": "abc123"}}'

</div>

</div>

Verify that you cannot access any endpoints requiring auth:

<div class="highlight-default notranslate">

<div class="highlight">

    curl http://localhost:8000/api/rbac/v1/roles/ -v

</div>

</div>

Verify that if you pass in the correct headers/values, you \_can\_
access the endpoint:

<div class="highlight-default notranslate">

<div class="highlight">

    curl http://localhost:8000/api/rbac/v1/roles/ -v -H 'x-rh-rbac-psk: abc123' -H 'x-rh-rbac-account: 10001' -H 'x-rh-rbac-client-id: catalog'

</div>

</div>

Change the ‘x-rh-rbac-client-id’, ‘x-rh-rbac-psk’ and
‘x-rh-rbac-account’ header values to see that you should get back a
401 (or 400 with an account that doesn’t exist).

You can also send a request \_with\_ the identity header explicitly in
the curl command along with the service-to-service headers to verify
that the identity header will take precedence.

</div>

</div>

<div id="api-documentation-generation" class="section">

#### API Documentation Generation

To generate and host the API documentation locally you need to [Install
APIDoc](http://apidocjs.com/#install) .

Generate the project API documenttion by running the following command

<div class="highlight-default notranslate">

<div class="highlight">

    make gen-apidoc

</div>

</div>

In order to host the docs locally you need to collect the static files

<div class="highlight-default notranslate">

<div class="highlight">

    make collect-static

</div>

</div>

Now start the server with as described above and point your browser to
**http://127.0.0.1:8000/apidoc/index.html** .

</div>

<div id="testing-and-linting" class="section">

#### Testing and Linting

Insights-rbac uses tox to standardize the environment used when running
tests. Essentially, tox manages its own virtual environment and a copy
of required dependencies to run tests. To ensure a clean tox environment
run

<div class="highlight-default notranslate">

<div class="highlight">

    tox -r

</div>

</div>

This will rebuild the tox virtual env and then run all tests.

To run unit tests specifically:

<div class="highlight-default notranslate">

<div class="highlight">

    tox -e py36

</div>

</div>

To lint the code base

<div class="highlight-default notranslate">

<div class="highlight">

    tox -e lint

</div>

</div>

</div>

<div id="caveats" class="section">

#### Caveats

For all requests to the Insights RBAC API, it is assumed and required
that principal information for the request be sent in a header named:
x-rh-identity . The information in this header is used to determine the
tenant, principal and other account-level information for the request.

Consumers of this API through cloud.redhat.com should not be concerned
with adding this header, as it will be overwritten by the gateway. All
traffic to the Insights RBAC API comes through Akamai and the Insights
3scale Gateway. The gateway is responsible for adding the x-rh-identity
header to all authenticated requests.

Any internal, service-to-service requests which do **not** go through
the gateway will need to have this header added to each request.

This header requirement is not reflected in the openapi.json spec, as it
would cause spec-based API clients to require the header, which would be
superfluously added to all requests on cloud.redhat.com.

</div>

</div>

<div id="contributing" class="section">

### Contributing

This repository uses \[pre-commit\]( <https://pre-commit.com> ) to check
and enforce code style. It uses \[Black\](
<https://github.com/psf/black> ) to reformat the Python code and
\[Flake8\]( <http://flake8.pycqa.org> ) to check it afterwards. Other
formats and text files are linted as well.

Install pre-commit hooks to your local repository by running:

> 
> 
> <div>
> 
> $ pre-commit install
> 
> </div>

After that, all your commited files will be linted. If the checks don’t
succeed, the commit will be rejected. Please make sure all checks pass
before submitting a pull request. Thanks\!

<div id="repositories-of-the-roles-to-be-seeded" class="section">

#### Repositories of the roles to be seeded

Default roles can be found in the [RBAC config
repo](https://github.com/RedHatInsights/rbac-config.git) .

For additional information please refer to
[Contributing](https://insights-rbac.readthedocs.io/en/latest/CONTRIBUTING.html)
.

</div>

</div>

</div>

</div>