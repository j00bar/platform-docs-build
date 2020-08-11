---
date: 2020-08-11 18:34:43.729025
title: management.access package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


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

### [Table of Contents](../../index/)

  - [management.access package](#)
      - [Submodules](#submodules)
      - [management.access.view module](#module-management.access.view)
      - [Module contents](#module-management.access)

### This Page

  - [Show Source](../../_sources/rbac/management.access.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.