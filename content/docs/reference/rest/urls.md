---
date: 2020-06-04 22:14:59.313992
title: URLs and URL Paths
weight: 20
---
<div id="urls-and-url-paths" class="section">


<div id="path-prefixes" class="section">

## Path Prefixes

Applications in the Insights Platform MUST read the $PATH\_PREFIX
environment variable, append the application name to that string, and
mount URL routes accordingly. For example, if `  PATH_PREFIX="/api"  `
and the application name is advisor, then the API must set up its routes
on `  /api/advisor  ` .

The 3Scale API gateway will proxy requests without rewriting the path,
so your applications must always expect to see requests prepended with
this path prefix plus application name. Applications must get their ` 
PATH_PREFIX  ` and `  APP_NAME  ` from environment variables. In
OpenShift, these will be set via a config map. For development and test
purposes, you can set these environment variables yourself.

Applications must expect to be restarted if the configuration maps
change.

</div>

<div id="url-path-structure" class="section">

## URL Path Structure

URLs and the path components of those URLs SHOULD be structured to be
generally as human-readable as possible. This is a subjective
requirement and is open to interpretation, and the outcome of following
this guideline may vary on an application-by-application basis.

The basic path structure should be:

`  /$PATH_PREFIX/$APP/v$VERSION/$RESOURCE/$ID  `

`  $VERSION  ` may be a full major.minor version (eg., /v1.5/), or just
the major version (eg,. /v1/) of the API you wish to use. If you only
specify a major version, the application should serve the latest minor
version available. Please see the Versioning section below for more
discussion.

We prefer “flat” APIs without a lot of nesting of resources. For
example, consider an application that has an object called a Job. Jobs
have associated Job Event objects. The basic path for a Job looks like:

`  /$PATH_PREFIX/$APP/v$VERSION/jobs/N  `

Where `  N  ` is the job ID. You can request the Job Events associated
with a particular Job using this path: ` 
/$PATH_PREFIX/$APP/v$VERSION/jobs/321/job_events  `

To access a specific Job Event, then, use:

`  /$PATH_PREFIX/$APP/v$VERSION/job_events/9876  ` instead of ` 
/$PATH_PREFIX/$APP/v$VERSION/jobs/321/job_events/9876  `

This way, there is no ambiguity as to what a resource URL refers to.
This is just one example of a pair of linked objects–use your best
judgement and discuss with your colleagues what is appropriate for your
particular application and API.

</div>

<div id="other-url-design-guidelines" class="section">

## Other URL Design Guidelines

  - Applications SHOULD use plural URL forms. For example, ` 
    /job_events/ID  ` versus `  /job_event/ID  `

  - Applications should separate words in path components with the `  _
     ` character.

  - If your request has a verb and a noun, the verb SHOULD come before
    the noun. For instance, `  search_projects  ` is preferred, instead
    of `  projects_search  ` or `  project_search  ` . Better still,
    separate these like: `  /projects/search  `

These are subjective guidelines that may or may not be applicable to
your application. Use your best judgement to ensure a consistent and
developer-friendly experience when working with your API.

</div>

</div>