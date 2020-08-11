---
date: 2020-08-03 17:09:33
title: api.common package
---

## Submodules

## api.common.exception\_handler module

Common exception handler class.

  -  ` api.common.exception_handler. ` ` custom_exception_handler `  ( 
    * exc * , * context *  )  [ \[source\]
    ](../../_modules/api/common/exception_handler/#custom_exception_handler)
      
    Create custom response for exceptions.

## api.common.pagination module

Common pagination class.

  -  *class* ` api.common.pagination. ` ` StandardResultsSetPagination `
    [ \[source\]
    ](../../_modules/api/common/pagination/#StandardResultsSetPagination)
      
    Bases: ` rest_framework.pagination.LimitOffsetPagination `
    
    Create standard paginiation class with page size.
    
      -  ` default_limit ` *= 10* 
    
    <!-- end list -->
    
      -  ` get_first_link `  (   )  [ \[source\]
        ](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_first_link)
          
        Create first link with partial url rewrite.
    
    <!-- end list -->
    
      -  ` get_last_link `  (   )  [ \[source\]
        ](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_last_link)
          
        Create last link with partial url rewrite.
    
    <!-- end list -->
    
      -  ` get_next_link `  (   )  [ \[source\]
        ](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_next_link)
          
        Create next link with partial url rewrite.
    
    <!-- end list -->
    
      -  ` get_paginated_response `  (  * data *  )  [ \[source\]
        ](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_paginated_response)
          
        Override pagination output.
    
    <!-- end list -->
    
      -  ` get_previous_link `  (   )  [ \[source\]
        ](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_previous_link)
          
        Create previous link with partial url rewrite.
    
    <!-- end list -->
    
      -  *static* ` link_rewrite `  (  * request * , * link *  )  [
        \[source\]
        ](../../_modules/api/common/pagination/#StandardResultsSetPagination.link_rewrite)
          
        Rewrite the link based on the path header to only provide
        partial url.
    
    <!-- end list -->
    
      -  ` max_limit ` *= 1000* 

## Module contents