---
date: 2020-07-27 10:12:28.871110
title: api.common package
---
<div id="api-common-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-api.common.exception_handler" class="section">

<span id="api-common-exception-handler-module"> </span>

## api.common.exception\_handler module

Common exception handler class.

  - `  api.common.exception_handler.  ` `  custom_exception_handler  `
    <span class="sig-paren"> ( </span> *<span class="n"> exc </span>* ,
    *<span class="n"> context </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/api/common/exception_handler/#custom_exception_handler)  
    Create custom response for exceptions.

</div>

<div id="module-api.common.pagination" class="section">

<span id="api-common-pagination-module"> </span>

## api.common.pagination module

Common pagination class.

  - *class* `  api.common.pagination.  ` `  StandardResultsSetPagination
     ` [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination)  
    Bases: `  rest_framework.pagination.LimitOffsetPagination  `
    
    Create standard paginiation class with page size.
    
      - `  default_limit  ` *= 10*
    
    <!-- end list -->
    
      - `  get_first_link  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_first_link)  
        Create first link with partial url rewrite.
    
    <!-- end list -->
    
      - `  get_last_link  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_last_link)  
        Create last link with partial url rewrite.
    
    <!-- end list -->
    
      - `  get_next_link  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_next_link)  
        Create next link with partial url rewrite.
    
    <!-- end list -->
    
      - `  get_paginated_response  ` <span class="sig-paren"> ( </span>
        *<span class="n"> data </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_paginated_response)  
        Override pagination output.
    
    <!-- end list -->
    
      - `  get_previous_link  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination.get_previous_link)  
        Create previous link with partial url rewrite.
    
    <!-- end list -->
    
      - *static* `  link_rewrite  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> link
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/api/common/pagination/#StandardResultsSetPagination.link_rewrite)  
        Rewrite the link based on the path header to only provide
        partial url.
    
    <!-- end list -->
    
      - `  max_limit  ` *= 1000*

</div>

<div id="module-api.common" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>