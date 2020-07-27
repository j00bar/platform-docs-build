---
date: 2020-06-04 22:14:59.273992
title: Versioning
weight: 80
---
<div id="versioning" class="section">


Consistent rules for versioning of APIs MUST be followed. Old clients
must be able to communicate with new servers for as long as reasonably
possible.

<div id="semantic-versioning" class="section">

## Semantic Versioning

API versioning in the Insights Platform MUST follow the [semver
specification](https://semver.org/) , using the major and minor
versions:

**major.minor**

  - *major* version increments describes non-backwards-compatible API
    changes.

  - *minor* version increments describe additional features that do not
    break backward compatibility.

( *Patch-level versioning is not applicable at the API level.* )

Some examples of changes that require *major* version increments
include:

  - Removed or renamed methods

  - Removed or renamed API fields in either the request or the response

  - Changes to data validation requirements

Example of changes that require *minor* version increments include:

  - New API methods

  - Added or aliased API fields in either the request or the response

</div>

</div>