---
date: 2020-07-27 10:12:28.081110
title: management.principal package
---
<div id="management-principal-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.principal.cleaner" class="section">

<span id="management-principal-cleaner-module"> </span>

## management.principal.cleaner module

Handler for principal clean up.

  - `  management.principal.cleaner.  ` `  clean_tenant_principals  `
    <span class="sig-paren"> ( </span> *<span class="n"> tenant </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/principal/cleaner/#clean_tenant_principals)  
    Check if all the principals in the tenant exist, remove non-existent
    principals.

<!-- end list -->

  - `  management.principal.cleaner.  ` `  clean_tenants_principals  `
    <span class="sig-paren"> ( </span> <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/principal/cleaner/#clean_tenants_principals)  
    Update any roles at startup.

</div>

<div id="module-management.principal.model" class="section">

<span id="management-principal-model-module"> </span>

## management.principal.model module

Model for principal management.

  - *class* `  management.principal.model.  ` `  Principal  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/principal/model/#Principal)  
    Bases: `  django.db.models.base.Model  `
    
    A principal.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
    <!-- end list -->
    
      - `  group  `  
        Accessor to the related objects manager on the forward and
        reverse sides of a many-to-many relation.
        
        In the example:
        
        <div class="highlight-default notranslate">
        
        <div class="highlight">
        
            class Pizza(Model):
                toppings = ManyToManyField(Topping, related_name='pizzas')
        
        </div>
        
        </div>
        
        `  Pizza.toppings  ` and `  Topping.pizzas  ` are ` 
        ManyToManyDescriptor  ` instances.
        
        Most of the implementation is delegated to a dynamically defined
        manager class built by `  create_forward_many_to_many_manager()
         ` defined below.
    
    <!-- end list -->
    
      - `  id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  objects  ` *= \<django.db.models.manager.Manager object\>*
    
    <!-- end list -->
    
      - `  username  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  uuid  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

</div>

<div id="module-management.principal.proxy" class="section">

<span id="management-principal-proxy-module"> </span>

## management.principal.proxy module

Proxy for principal management.

  - *class* `  management.principal.proxy.  ` `  PrincipalProxy  `
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/principal/proxy/#PrincipalProxy)  
    Bases: `  object  `
    
    A class to handle interactions with the Principal proxy service.
    
      - `  request_filtered_principals  ` <span class="sig-paren"> (
        </span> *<span class="n"> principals </span>* ,
        *<span class="n"> account </span> <span class="o"> = </span>
        <span class="default_value"> None </span>* , *<span class="n">
        limit </span> <span class="o"> = </span>
        <span class="default_value"> None </span>* , *<span class="n">
        offset </span> <span class="o"> = </span>
        <span class="default_value"> None </span>* , *<span class="n">
        sort\_order </span> <span class="o"> = </span>
        <span class="default_value"> None </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/principal/proxy/#PrincipalProxy.request_filtered_principals)  
        Request specific principals for an account.
    
    <!-- end list -->
    
      - `  request_principals  ` <span class="sig-paren"> ( </span>
        *<span class="n"> account </span>* , *<span class="n"> email
        </span> <span class="o"> = </span> <span class="default_value">
        None </span>* , *<span class="n"> limit </span> <span class="o">
        = </span> <span class="default_value"> None </span>* ,
        *<span class="n"> offset </span> <span class="o"> = </span>
        <span class="default_value"> None </span>* , *<span class="n">
        sort\_order </span> <span class="o"> = </span>
        <span class="default_value"> None </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/principal/proxy/#PrincipalProxy.request_principals)  
        Request principals for an account.

</div>

<div id="module-management.principal.serializer" class="section">

<span id="management-principal-serializer-module"> </span>

## management.principal.serializer module

Serializer for principal management.

  - *class* `  management.principal.serializer.  ` ` 
    PrincipalInputSerializer  ` <span class="sig-paren"> ( </span>
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/principal/serializer/#PrincipalInputSerializer)  
    Bases: `  rest_framework.serializers.Serializer  `
    
    Serializer for the Principal model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/principal/serializer/#PrincipalInputSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('username',)*

<!-- end list -->

  - *class* `  management.principal.serializer.  ` ` 
    PrincipalSerializer  ` <span class="sig-paren"> ( </span>
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/principal/serializer/#PrincipalSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the Principal model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/principal/serializer/#PrincipalSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('username',)*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.principal.model.Principal
             `](#management.principal.model.Principal "management.principal.model.Principal")

</div>

<div id="module-management.principal.view" class="section">

<span id="management-principal-view-module"> </span>

## management.principal.view module

View for principal management.

  - *class* `  management.principal.view.  ` `  PrincipalView  `
    <span class="sig-paren"> ( </span> *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/principal/view/#PrincipalView)  
    Bases: `  rest_framework.views.APIView  `
    
    Obtain the list of principals for the tenant.
    
      - `  get  ` <span class="sig-paren"> ( </span> *<span class="n">
        request </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/principal/view/#PrincipalView.get)  
        List prinicpals for account.
    
    <!-- end list -->
    
      - `  permission_classes  ` *= (\<class
        'management.permissions.admin\_access.AdminAccessPermission'\>,)*

</div>

<div id="module-management.principal" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>