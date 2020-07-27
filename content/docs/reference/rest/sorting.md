---
date: 2020-06-04 22:14:59.360992
title: Sorting
weight: 70
---
<div id="sorting" class="section">


Our APIs SHOULD support sorting responses to GET requests of collections
by using the `  sort_by  ` query parameter.

<div id="requests" class="section">

## Requests

Our APIs SHOULD accept the query parameter `  sort_by  ` to allow for
result sorting.

The `  sort_by  ` parameter specifies which attribute name to sort the
results by, and may include a sort order of ascending `  asc  ` or
descending `  desc  ` . The default behavior when no sorting order is
specified is to sort by ascending order.

The syntax of the `  sort_by  ` parameter is as follows:

  - A single string representing the attribute name to sort by which may
    be followed by `  :asc  ` or `  :desc  ` for the sort order.
    
      - `  attribute  ` ( *default order is ascending* )
    
      - `  attribute:asc  ` ( *ascending order* )
    
      - `  attribute:desc  ` ( *descending order* )

  - An array of strings of the above syntax for selecting secondary
    sorting of records when initial attributes are matched.

</div>

<div id="responses" class="section">

## Responses

The response body MUST be a JSON object containing the key `  data  ` .

The `  data  ` object MUST be the array of objects sorted by the ` 
sort_by  ` parameters specified.

</div>

<div id="examples" class="section">

## Examples

`  GET /api/myapp/v1/collection  `

`  GET /api/myapp/v1/collection?sort_by=vendor  `

`  GET /api/myapp/v1/collection?sort_by[]=vendor&sort_by[]=name  `

`  GET
/api/myapp/v1/collection?sort_by[]=architecture:asc&sort_by[]=num_cpus:desc
 `

`  GET
/api/myapp/v1/collection?sort_by[]=power_state&sort_by[]=memory:desc&sort_by[]=architecture
 `

</div>

<div id="reference-implementations" class="section">

## Reference Implementations

[Sources, Topological Inventory, Catalog,
Approval](https://github.com/RedHatInsights/insights-api-common-rails/blob/master/lib/insights/api/common/paginated_response.rb)

</div>

</div>