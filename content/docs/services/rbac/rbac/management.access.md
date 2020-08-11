---
date: 2020-08-03 17:09:33
title: management.access package
---

## Submodules

## management.access.view module

View for principal access.

  -  *class* ` management.access.view. ` ` AccessView `  (  * \*\*  
    kwargs *  )  [ \[source\]
    ](../../_modules/management/access/view/#AccessView)   
    Bases: ` rest_framework.views.APIView `
    
    Obtain principal access list.
    
      -  ` get `  (  * request *  )  [ \[source\]
        ](../../_modules/management/access/view/#AccessView.get)   
        Provide access data for prinicpal.
    
    <!-- end list -->
    
      -  ` get_paginated_response `  (  * data *  )  [ \[source\]
        ](../../_modules/management/access/view/#AccessView.get_paginated_response)
          
        Return a paginated style Response object for the given output
        data.
    
    <!-- end list -->
    
      -  ` get_queryset `  (   )  [ \[source\]
        ](../../_modules/management/access/view/#AccessView.get_queryset)
          
        Define the query set.
    
    <!-- end list -->
    
      -  ` paginate_queryset `  (  * queryset *  )  [ \[source\]
        ](../../_modules/management/access/view/#AccessView.paginate_queryset)
          
        Return a single page of results, or None if pagination is
        disabled.
    
    <!-- end list -->
    
      -  ` pagination_class `   
        alias of [` api.common.pagination.StandardResultsSetPagination
        `](../api.common/#api.common.pagination.StandardResultsSetPagination "api.common.pagination.StandardResultsSetPagination")
    
    <!-- end list -->
    
      -  *property* ` paginator `   
        Return the paginator instance associated with the view, or None
        .
    
    <!-- end list -->
    
      -  ` permission_classes ` *= (\<class
        'rest\_framework.permissions.AllowAny'\>,)* 
    
    <!-- end list -->
    
      -  ` serializer_class `   
        alias of [` management.role.serializer.AccessSerializer
        `](../management.role/#management.role.serializer.AccessSerializer "management.role.serializer.AccessSerializer")

## Module contents