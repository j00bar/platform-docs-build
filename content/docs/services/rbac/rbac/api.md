---
date: 2020-07-27 13:50:42.748194
title: api package
---
<div id="api-package" class="section">


<div id="subpackages" class="section">

## Subpackages

<div class="toctree-wrapper compound">

  - [api.common package](../api.common/)
      - [Submodules](../api.common/#submodules)
      - [api.common.exception\_handler
        module](../api.common/#module-api.common.exception_handler)
      - [api.common.pagination
        module](../api.common/#module-api.common.pagination)
      - [Module contents](../api.common/#module-api.common)
  - [api.status package](../api.status/)
      - [Submodules](../api.status/#submodules)
      - [api.status.model
        module](../api.status/#module-api.status.model)
      - [api.status.serializer
        module](../api.status/#module-api.status.serializer)
      - [api.status.view module](../api.status/#module-api.status.view)
      - [Module contents](../api.status/#module-api.status)

</div>

</div>

<div id="submodules" class="section">

## Submodules

</div>

<div id="module-api.apps" class="section">

<span id="api-apps-module"> </span>

## api.apps module

API application configuration module.

  - *class* `  api.apps.  ` `  ApiConfig  ` <span class="sig-paren"> (
    </span> *<span class="n"> app\_name </span>* , *<span class="n">
    app\_module </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/api/apps/#ApiConfig)  
    Bases: `  django.apps.config.AppConfig  `
    
    API application configuration.
    
      - `  name  ` *= 'api'*

</div>

<div id="module-api.models" class="section">

<span id="api-models-module"> </span>

## api.models module

API models for import organization.

  - *class* `  api.models.  ` `  Tenant  ` <span class="sig-paren"> (
    </span> *<span class="o"> \* </span> <span class="n"> args </span>*
    , *<span class="o"> \*\* </span> <span class="n"> kwargs </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\] </span>](../../_modules/api/models/#Tenant)  
    Bases: `  tenant_schemas.models.TenantMixin  `
    
    The model used to create a tenant schema.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
    <!-- end list -->
    
      - `  auto_drop_schema  ` *= True*
    
    <!-- end list -->
    
      - `  domain_url  ` *= None*
    
    <!-- end list -->
    
      - `  id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  - *class* `  api.models.  ` `  User  ` [<span class="viewcode-link">
    \[source\] </span>](../../_modules/api/models/#User)  
    Bases: `  object  `
    
    A request User.
    
      - `  access  ` *= {}*
    
    <!-- end list -->
    
      - `  account  ` *= None*
    
    <!-- end list -->
    
      - `  admin  ` *= False*
    
    <!-- end list -->
    
      - `  is_active  ` *= True*
    
    <!-- end list -->
    
      - `  system  ` *= False*
    
    <!-- end list -->
    
      - `  username  ` *= None*

</div>

<div id="module-api.serializers" class="section">

<span id="api-serializers-module"> </span>

## api.serializers module

API models for import organization.

  - `  api.serializers.  ` `  add_padding  ` <span class="sig-paren"> (
    </span> *<span class="n"> encoded\_header </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\] </span>](../../_modules/api/serializers/#add_padding)  
    Calculate and add padding to header.
    
      - Args:  
        header(str): The header to decode
    
      - Returns:  
        Encoded(str): Base64 header with padding

<!-- end list -->

  - `  api.serializers.  ` `  create_schema_name  `
    <span class="sig-paren"> ( </span> *<span class="n"> account
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/api/serializers/#create_schema_name)  
    Create a database schema name.

<!-- end list -->

  - `  api.serializers.  ` `  error_obj  ` <span class="sig-paren"> (
    </span> *<span class="n"> key </span>* , *<span class="n"> message
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/api/serializers/#error_obj)  
    Create an error object.

<!-- end list -->

  - `  api.serializers.  ` `  extract_header  ` <span class="sig-paren">
    ( </span> *<span class="n"> request </span>* , *<span class="n">
    header </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/api/serializers/#extract_header)  
    Extract and decode json header.
    
      - Args:  
        request(object): The incoming request header(str): The header to
        decode
    
      - Returns:  
        Encoded(str): Base64 header Decoded(dict): Identity dictionary

</div>

<div id="module-api.urls" class="section">

<span id="api-urls-module"> </span>

## api.urls module

Describes the urls and patterns for the API application.

</div>

<div id="module-api.views" class="section">

<span id="api-views-module"> </span>

## api.views module

API views for import organization

</div>

<div id="module-api" class="section">

<span id="module-contents"> </span>

## Module contents

Configuration for the api app.

</div>

</div>