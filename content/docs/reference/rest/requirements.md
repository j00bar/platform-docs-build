---
date: 2020-06-04 22:14:59.391992
title: Basic Requirements
weight: 10
---
<div id="basic-requirements" class="section">


<div id="key-words" class="section">

## Key Words

The key words MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY are to be
interpreted per [IETF RFC](https://www.ietf.org/rfc/rfc2119.txt)
[2119](https://www.ietf.org/rfc/rfc2119.txt) .

</div>

<div id="openapi" class="section">

## OpenAPI

All customer-facing APIs built inside the Insights Platform MUST be
described via an OpenAPI version 3 specification.

All OpenAPI specifications SHOULD maintain this specification file in
its VCS repository alongside the code that it describes.

For consistency and to support automated testing of APIs, all
applications MUST serve the current OpenAPI specification in JSON format
on `  $PATH_PREFIX/$APP/v$VERSION/openapi.json  ` .

To facilitate automated testing of APIs, all operations MUST have an ` 
operationId  ` defined. For more information, please see [OpenAPI: Paths
and
Operations](https://swagger.io/docs/specification/paths-and-operations/)
.

</div>

</div>