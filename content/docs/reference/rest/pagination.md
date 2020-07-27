---
date: 2020-06-04 22:14:59.442992
title: Pagination
weight: 50
---
<div id="pagination" class="section">


Our APIs MUST return consistent paginated responses to GET requests on
collections.

<div id="requests" class="section">

## Requests

Our APIs MUST accept the query parameters `  limit  ` and `  offset  `
to allow for client navigation.

`  limit  ` is the maximum number of results to be returned in the
paginated response. Applications MUST define a maximum value for ` 
limit  ` which SHOULD protect the server from long running requests
causing timeouts. Applications SHOULD define a default value for ` 
limit  ` allowing the client to query the first page without specifying
the parameter.

`  offset  ` indicates the starting position of the query relative to
the complete set of items that match the client’s query. Applications
SHOULD define a default value for `  offset  ` allowing the client to
query the first page without specifying the parameter.

</div>

<div id="responses" class="section">

## Responses

The response body MUST be a JSON object containing the keys `  meta  ` ,
`  links  ` and `  data  ` .

The `  meta  ` object MUST contain a `  count  ` of total records in the
collection. The `  meta  ` object MAY also contain other information
like the `  limit  ` and `  offset  ` being applied.

The `  links  ` object MUST contain `  first  ` and `  last  ` links and
MAY contain `  next  ` and `  prev  ` links if applicable. All links
MUST be in relative format.

The `  data  ` object MUST be an array of objects.

</div>

<div id="examples" class="section">

## Examples

`  GET /api/myapp/v1/collection  `

<div class="highlight-text notranslate">

<div class="highlight">

    {
      "meta": {
        "count": 11
      },
      "links": {
        "first": "/api/myapp/v1/collection/?limit=10&offset=0",
        "last": "/api/myapp/v1/collection/?limit=10&offset=10",
        "next": "/api/myapp/v1/collection/?limit=10&offset=10"
      },
      "data": [
        {...}
      ]
    }

</div>

</div>

`  GET /api/myapp/v1/collection?limit=5  `

<div class="highlight-text notranslate">

<div class="highlight">

    {
      "meta": {
        "count": 11
      },
      "links": {
        "first": "/api/myapp/v1/collection/?limit=5&offset=0",
        "last": "/api/myapp/v1/collection/?limit=5&offset=10",
        "next": "/api/myapp/v1/collection/?limit=5&offset=5"
      },
      "data": [
        {...}
      ]
    }

</div>

</div>

`  GET /api/myapp/v1/collection?limit=5&offset=5  `

<div class="highlight-text notranslate">

<div class="highlight">

    {
      "meta": {
        "count": 11
      },
      "links": {
        "first": "/api/myapp/v1/collection/?limit=5&offset=0",
        "last": "/api/myapp/v1/collection/?limit=5&offset=10",
        "next": "/api/myapp/v1/collection/?limit=5&offset=10",
        "prev": "/api/myapp/v1/collection/?limit=5&offset=0"
      },
      "data": [
        {...}
      ]
    }

</div>

</div>

`  GET /api/myapp/v1/collection?limit=5&offset=2  `

<div class="highlight-text notranslate">

<div class="highlight">

    {
      "meta": {
        "count": 11
      },
      "links": {
        "first": "/api/myapp/v1/collection/?limit=5&offset=0",
        "last": "/api/myapp/v1/collection/?limit=5&offset=10",
        "next": "/api/myapp/v1/collection/?limit=5&offset=7",
        "prev": "/api/myapp/v1/collection/?limit=5&offset=0"
      },
      "data": [
        {...}
      ]
    }

</div>

</div>

</div>

<div id="reference-implementations" class="section">

## Reference Implementations

[From Cost
Management/Koku](https://github.com/project-koku/koku/blob/master/koku/api/common/pagination.py)

[Sources, Topological Inventory, Catalog,
Approval](https://github.com/ManageIQ/manageiq-api-common/blob/master/lib/manageiq/api/common/paginated_response.rb)

</div>

<div id="notes" class="section">

## Notes

In the future, this pagination approach may be extended to support a
marker-based method, where the last returned object serves as the
request parameter for the next page. This will provide more constant
performance than a simple limit/offset mechanism, assuming that the
column used as a marker is indexed appropriately in the database.

</div>

</div>