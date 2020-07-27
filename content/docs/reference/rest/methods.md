---
date: 2020-06-04 22:14:59.497993
title: API Methods
weight: 30
---
<div id="api-methods" class="section">


Handling HTTP request methods properly and consistently is one of the
most important parts of good REST API design. There are many resources
describing the various kinds of HTTP methods and how they should be used
in an API, so we will not reiterate all of that here. For more
information, please see the [Microsoft REST API
Guidelines](https://github.com/Microsoft/api-guidelines/blob/vNext/Guidelines.md#74-supported-methods)
for a more detailed discussion of each method and how it should be used.

<div id="get" class="section">

## GET

The GET method is for retrieving information about a resource. It MUST
not have side effects.

</div>

<div id="post" class="section">

## POST

The POST method creates new objects or execute a command or an
operation.

</div>

<div id="put-patch" class="section">

## PUT/PATCH

The PUT method updates an existing object with a full set of new values.
PATCH can do partial changes of an object.

</div>

<div id="delete" class="section">

## DELETE

The DELETE method deletes an object. It MAY NOT take data payloads and
strictly applies to a single resource or object.

</div>

</div>