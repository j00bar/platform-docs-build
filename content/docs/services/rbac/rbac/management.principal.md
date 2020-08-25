---
date: 2020-08-25 00:00:48.985413
title: management.principal package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Submodules

## management.principal.cleaner module

Handler for principal clean up.

  -  ` management.principal.cleaner. ` ` clean_tenant_principals `  (  *
    tenant *  )  [ \[source\]
    ](../../_modules/management/principal/cleaner/#clean_tenant_principals)
      
    Check if all the principals in the tenant exist, remove non-existent
    principals.

<!-- end list -->

  -  ` management.principal.cleaner. ` ` clean_tenants_principals `  (  
    )  [ \[source\]
    ](../../_modules/management/principal/cleaner/#clean_tenants_principals)
      
    Update any roles at startup.

## management.principal.model module

Model for principal management.

  -  *class* ` management.principal.model. ` ` Principal `  (  * \*  
    args * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/principal/model/#Principal)   
    Bases: ` django.db.models.base.Model `
    
    A principal.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` group `   
        Accessor to the related objects manager on the forward and
        reverse sides of a many-to-many relation.
        
        In the example:
        
            class Pizza(Model):
                toppings = ManyToManyField(Topping, related_name='pizzas')
        
        ` Pizza.toppings ` and ` Topping.pizzas ` are `
        ManyToManyDescriptor ` instances.
        
        Most of the implementation is delegated to a dynamically defined
        manager class built by ` create_forward_many_to_many_manager() `
        defined below.
    
    <!-- end list -->
    
      -  ` id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` objects ` *= \<django.db.models.manager.Manager object\>* 
    
    <!-- end list -->
    
      -  ` username `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` uuid `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

## management.principal.proxy module

Proxy for principal management.

  -  *class* ` management.principal.proxy. ` ` PrincipalProxy ` [
    \[source\]
    ](../../_modules/management/principal/proxy/#PrincipalProxy)   
    Bases: ` object `
    
    A class to handle interactions with the Principal proxy service.
    
      -  ` request_filtered_principals `  (  * principals * , * account 
         =   None * , * limit   =   None * , * offset   =   None * , *
        sort\_order   =   None *  )  [ \[source\]
        ](../../_modules/management/principal/proxy/#PrincipalProxy.request_filtered_principals)
          
        Request specific principals for an account.
    
    <!-- end list -->
    
      -  ` request_principals `  (  * account * , * email   =   None * ,
        * limit   =   None * , * offset   =   None * , * sort\_order   =
          None *  )  [ \[source\]
        ](../../_modules/management/principal/proxy/#PrincipalProxy.request_principals)
          
        Request principals for an account.

## management.principal.serializer module

Serializer for principal management.

  -  *class* ` management.principal.serializer. ` `
    PrincipalInputSerializer `  (  *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/principal/serializer/#PrincipalInputSerializer)
      
    Bases: ` rest_framework.serializers.Serializer `
    
    Serializer for the Principal model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/principal/serializer/#PrincipalInputSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('username',)* 

<!-- end list -->

  -  *class* ` management.principal.serializer. ` ` PrincipalSerializer
    `  (  *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/principal/serializer/#PrincipalSerializer)
      
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the Principal model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/principal/serializer/#PrincipalSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('username',)* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.principal.model.Principal
            `](#management.principal.model.Principal "management.principal.model.Principal")

## management.principal.view module

View for principal management.

  -  *class* ` management.principal.view. ` ` PrincipalView `  (  * \*\*
      kwargs *  )  [ \[source\]
    ](../../_modules/management/principal/view/#PrincipalView)   
    Bases: ` rest_framework.views.APIView `
    
    Obtain the list of principals for the tenant.
    
      -  ` get `  (  * request *  )  [ \[source\]
        ](../../_modules/management/principal/view/#PrincipalView.get)
          
        List principals for account.
    
    <!-- end list -->
    
      -  ` permission_classes ` *= (\<class
        'management.permissions.admin\_access.AdminAccessPermission'\>,)*
        

## Module contents

### [Table of Contents](../../index/)

  - [management.principal package](#)
      - [Submodules](#submodules)
      - [management.principal.cleaner
        module](#module-management.principal.cleaner)
      - [management.principal.model
        module](#module-management.principal.model)
      - [management.principal.proxy
        module](#module-management.principal.proxy)
      - [management.principal.serializer
        module](#module-management.principal.serializer)
      - [management.principal.view
        module](#module-management.principal.view)
      - [Module contents](#module-management.principal)

### This Page

  - [Show Source](../../_sources/rbac/management.principal.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.