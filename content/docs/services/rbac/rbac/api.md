---
date: 2020-08-24 20:29:21.726797
title: api package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Subpackages

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

## Submodules

## api.apps module

API application configuration module.

  -  *class* ` api.apps. ` ` ApiConfig `  (  * app\_name * , *
    app\_module *  )  [ \[source\] ](../../_modules/api/apps/#ApiConfig)
      
    Bases: ` django.apps.config.AppConfig `
    
    API application configuration.
    
      -  ` name ` *= 'api'* 

## api.models module

API models for import organization.

  -  *class* ` api.models. ` ` Tenant `  (  * \*   args * , * \*\*  
    kwargs *  )  [ \[source\] ](../../_modules/api/models/#Tenant)   
    Bases: ` tenant_schemas.models.TenantMixin `
    
    The model used to create a tenant schema.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` auto_drop_schema ` *= True* 
    
    <!-- end list -->
    
      -  ` domain_url ` *= None* 
    
    <!-- end list -->
    
      -  ` id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  -  *class* ` api.models. ` ` User ` [ \[source\]
    ](../../_modules/api/models/#User)   
    Bases: ` object `
    
    A request User.
    
      -  ` access ` *= {}* 
    
    <!-- end list -->
    
      -  ` account ` *= None* 
    
    <!-- end list -->
    
      -  ` admin ` *= False* 
    
    <!-- end list -->
    
      -  ` is_active ` *= True* 
    
    <!-- end list -->
    
      -  ` system ` *= False* 
    
    <!-- end list -->
    
      -  ` username ` *= None* 

## api.serializers module

API models for import organization.

  -  ` api.serializers. ` ` add_padding `  (  * encoded\_header *  )  [
    \[source\] ](../../_modules/api/serializers/#add_padding)   
    Calculate and add padding to header.
    
      -  Args:   
        header(str): The header to decode
    
      -  Returns:   
        Encoded(str): Base64 header with padding

<!-- end list -->

  -  ` api.serializers. ` ` create_schema_name `  (  * account *  )  [
    \[source\] ](../../_modules/api/serializers/#create_schema_name)   
    Create a database schema name.

<!-- end list -->

  -  ` api.serializers. ` ` error_obj `  (  * key * , * message *  )  [
    \[source\] ](../../_modules/api/serializers/#error_obj)   
    Create an error object.

<!-- end list -->

  -  ` api.serializers. ` ` extract_header `  (  * request * , * header
    *  )  [ \[source\] ](../../_modules/api/serializers/#extract_header)
      
    Extract and decode json header.
    
      -  Args:   
        request(object): The incoming request header(str): The header to
        decode
    
      -  Returns:   
        Encoded(str): Base64 header Decoded(dict): Identity dictionary

## api.urls module

Describes the urls and patterns for the API application.

## api.views module

API views for import organization

## Module contents

Configuration for the api app.

### [Table of Contents](../../index/)

  - [api package](#)
      - [Subpackages](#subpackages)
      - [Submodules](#submodules)
      - [api.apps module](#module-api.apps)
      - [api.models module](#module-api.models)
      - [api.serializers module](#module-api.serializers)
      - [api.urls module](#module-api.urls)
      - [api.views module](#module-api.views)
      - [Module contents](#module-api)

### This Page

  - [Show Source](../../_sources/rbac/api.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.