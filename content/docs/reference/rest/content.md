---
date: 2020-06-04 22:14:59.661993
title: Content, Errors, and Fault Handling
weight: 40
---
<div id="content-errors-and-fault-handling" class="section">


<div id="property-names" class="section">

## Property Names

When naming properties, it is important for user experience that APIs
across the platform do so in a consistent manner.

Property names SHOULD be lowercase, underscore spaced. An API SHOULD NOT
have property names that are CamelCase or properties that join words
without an underscore.

When a property refers to a data object from the platform, properties
should be named based on the object type as defined by the data service
API that owns it. For example, as the Host Inventory calls its objects
hosts, when an API request or response refers to a host object:

  - If referring only to the globally unique identifier for the host,
    the property SHOULD be host\_id.

  - If returning an object for the host, the property SHOULD be host,
    and the properties of that object should map to the properties as
    returned by the Host Inventory.

  - If returning an array of objects for several hosts, the property
    SHOULD be host\_list.

The property name may be prefixed if a modifier more clearly describes
the property, which still otherwise adhering to the above naming
guidelines; e.g. a response about a clustered service may identify the
host elected as the cluster master as master\_host\_id for better
clarity.

</div>

<div id="error-codes" class="section">

## Error Codes

Error and fault handling MUST be done following regular HTTP/REST
principles: using the appropriate HTTP 4xx error codes to indicate a
problem caused by and resolvable by the client, and the 5xx error codes
to indicate faults caused by or originating on the server side. These
guidelines do not attempt to list and describe all of the various HTTP
error codes. Please review [RFC
2616](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html) for the
list of response codes.

If a client is not authorized to see an object, the application SHOULD
NOT allow the unauthorized client to determine the existence or
non-existence of an object. For example, if an unauthorized client
requests two different objects, one that exists and one that does not,
the returned HTTP error code should be 404 Not Found for both requests.

</div>

<div id="error-objects" class="section">

## Error Objects

API results SHOULD contain a dictionary element called “errors”
containing an array of objects that conform to the [JSON API error
objects](https://jsonapi.org/format/#errors) .

</div>

<div id="content-types-and-type-negotiation" class="section">

## Content Types and Type Negotiation

Insights Platform APIs SHOULD conform to the [JSON API content
negotiation](https://jsonapi.org/format/#content-negotiation)
specifications.

</div>

</div>