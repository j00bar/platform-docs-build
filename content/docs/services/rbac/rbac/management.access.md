---
date: 2020-07-27 13:50:42.748194
title: management.access package
---
<div id="management-access-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.access.view" class="section">

<span id="management-access-view-module"> </span>

## management.access.view module

View for principal access.

  - *class* `  management.access.view.  ` `  AccessView  `
    <span class="sig-paren"> ( </span> *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/access/view/#AccessView)  
    Bases: `  rest_framework.views.APIView  `
    
    Obtain principal access list.
    
      - `  get  ` <span class="sig-paren"> ( </span> *<span class="n">
        request </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/access/view/#AccessView.get)  
        Provide access data for prinicpal.
    
    <!-- end list -->
    
      - `  get_paginated_response  ` <span class="sig-paren"> ( </span>
        *<span class="n"> data </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/access/view/#AccessView.get_paginated_response)  
        Return a paginated style Response object for the given output
        data.
    
    <!-- end list -->
    
      - `  get_queryset  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/access/view/#AccessView.get_queryset)  
        Define the query set.
    
    <!-- end list -->
    
      - `  paginate_queryset  ` <span class="sig-paren"> ( </span>
        *<span class="n"> queryset </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/access/view/#AccessView.paginate_queryset)  
        Return a single page of results, or None if pagination is
        disabled.
    
    <!-- end list -->
    
      - `  pagination_class  `  
        alias of [`  api.common.pagination.StandardResultsSetPagination
         `](../api.common/#api.common.pagination.StandardResultsSetPagination "api.common.pagination.StandardResultsSetPagination")
    
    <!-- end list -->
    
      - *property* `  paginator  `  
        Return the paginator instance associated with the view, or None
        .
    
    <!-- end list -->
    
      - `  permission_classes  ` *= (\<class
        'rest\_framework.permissions.AllowAny'\>,)*
    
    <!-- end list -->
    
      - `  serializer_class  `  
        alias of [`  management.role.serializer.AccessSerializer
         `](../management.role/#management.role.serializer.AccessSerializer "management.role.serializer.AccessSerializer")

</div>

<div id="module-management.access" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>