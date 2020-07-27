---
date: 2020-07-27 13:41:13.718494
title: management.role package
---
<div id="management-role-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.role.definer" class="section">

<span id="management-role-definer-module"> </span>

## management.role.definer module

Handler for system defined roles.

  - `  management.role.definer.  ` `  seed_permissions  `
    <span class="sig-paren"> ( </span> *<span class="n"> tenant </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/definer/#seed_permissions)  
    For a tenant update or create defined permissions.

<!-- end list -->

  - `  management.role.definer.  ` `  seed_roles  `
    <span class="sig-paren"> ( </span> *<span class="n"> tenant </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/definer/#seed_roles)  
    For a tenant update or create system defined roles.

</div>

<div id="module-management.role.model" class="section">

<span id="management-role-model-module"> </span>

## management.role.model module

Model for role management.

  - *class* `  management.role.model.  ` `  Access  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/model/#Access)  
    Bases: `  django.db.models.base.Model  `
    
    An access object.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
    <!-- end list -->
    
      - `  id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  objects  ` *= \<management.role.model.CustomManager object\>*
    
    <!-- end list -->
    
      - `  perm  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  permission  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  permission_application  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/model/#Access.permission_application)  
        Return the application name from the permission.
    
    <!-- end list -->
    
      - `  resourceDefinitions  `  
        Accessor to the related objects manager on the reverse side of a
        many-to-one relation.
        
        In the example:
        
        <div class="highlight-default notranslate">
        
        <div class="highlight">
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        </div>
        
        </div>
        
        `  Parent.children  ` is a `  ReverseManyToOneDescriptor  `
        instance.
        
        Most of the implementation is delegated to a dynamically defined
        manager class built by `  create_forward_many_to_many_manager()
         ` defined below.
    
    <!-- end list -->
    
      - `  role  `  
        Accessor to the related object on the forward side of a
        many-to-one or one-to-one (via ForwardOneToOneDescriptor
        subclass) relation.
        
        In the example:
        
        <div class="highlight-default notranslate">
        
        <div class="highlight">
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        </div>
        
        </div>
        
        `  Child.parent  ` is a `  ForwardManyToOneDescriptor  `
        instance.
    
    <!-- end list -->
    
      - `  role_id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  save  ` <span class="sig-paren"> ( </span> *<span class="o">
        \* </span> <span class="n"> args </span>* , *<span class="o">
        \*\* </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/model/#Access.save)  
        When new Access object get created, populate the permission
        field.
    
    <!-- end list -->
    
      - `  split_permission  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/model/#Access.split_permission)  
        Split the permission.

<!-- end list -->

  - *class* `  management.role.model.  ` `  CustomManager  `
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/model/#CustomManager)  
    Bases: `  django.db.models.manager.Manager  `
    
    Control which fields to query.
    
      - `  get_queryset  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/model/#CustomManager.get_queryset)  
        Override default get\_queryset to defer fields.

<!-- end list -->

  - *class* `  management.role.model.  ` `  Permission  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/model/#Permission)  
    Bases: `  django.db.models.base.Model  `
    
    Permission for access.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
    <!-- end list -->
    
      - `  application  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  objects  ` *= \<django.db.models.manager.Manager object\>*
    
    <!-- end list -->
    
      - `  permission  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  resource_type  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  save  ` <span class="sig-paren"> ( </span> *<span class="o">
        \* </span> <span class="n"> args </span>* , *<span class="o">
        \*\* </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/model/#Permission.save)  
        Populate the application, resource\_type and verb field before
        saving.
    
    <!-- end list -->
    
      - `  verb  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  - *class* `  management.role.model.  ` `  ResourceDefinition  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/model/#ResourceDefinition)  
    Bases: `  django.db.models.base.Model  `
    
    A resource definition.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
    <!-- end list -->
    
      - `  access  `  
        Accessor to the related object on the forward side of a
        many-to-one or one-to-one (via ForwardOneToOneDescriptor
        subclass) relation.
        
        In the example:
        
        <div class="highlight-default notranslate">
        
        <div class="highlight">
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        </div>
        
        </div>
        
        `  Child.parent  ` is a `  ForwardManyToOneDescriptor  `
        instance.
    
    <!-- end list -->
    
      - `  access_id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  attributeFilter  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  objects  ` *= \<django.db.models.manager.Manager object\>*
    
    <!-- end list -->
    
      - *property* `  role  `  
        Get role for RD.

<!-- end list -->

  - *class* `  management.role.model.  ` `  Role  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/model/#Role)  
    Bases: `  django.db.models.base.Model  `
    
    A role.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
    <!-- end list -->
    
      - `  access  `  
        Accessor to the related objects manager on the reverse side of a
        many-to-one relation.
        
        In the example:
        
        <div class="highlight-default notranslate">
        
        <div class="highlight">
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        </div>
        
        </div>
        
        `  Parent.children  ` is a `  ReverseManyToOneDescriptor  `
        instance.
        
        Most of the implementation is delegated to a dynamically defined
        manager class built by `  create_forward_many_to_many_manager()
         ` defined below.
    
    <!-- end list -->
    
      - `  created  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  description  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  get_next_by_created  ` <span class="sig-paren"> ( </span>
        *\** , *field=\<django.db.models.fields.DateTimeField:
        created\>* , *is\_next=True* , *\*\*kwargs*
        <span class="sig-paren"> ) </span>
    
    <!-- end list -->
    
      - `  get_next_by_modified  ` <span class="sig-paren"> ( </span>
        *\** , *field=\<management.rbac\_fields.AutoDateTimeField:
        modified\>* , *is\_next=True* , *\*\*kwargs*
        <span class="sig-paren"> ) </span>
    
    <!-- end list -->
    
      - `  get_previous_by_created  ` <span class="sig-paren"> ( </span>
        *\** , *field=\<django.db.models.fields.DateTimeField:
        created\>* , *is\_next=False* , *\*\*kwargs*
        <span class="sig-paren"> ) </span>
    
    <!-- end list -->
    
      - `  get_previous_by_modified  ` <span class="sig-paren"> (
        </span> *\** ,
        *field=\<management.rbac\_fields.AutoDateTimeField: modified\>*
        , *is\_next=False* , *\*\*kwargs* <span class="sig-paren"> )
        </span>
    
    <!-- end list -->
    
      - `  id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  modified  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  name  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  objects  ` *= \<django.db.models.manager.Manager object\>*
    
    <!-- end list -->
    
      - `  platform_default  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  policies  `  
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
    
      - *property* `  role  `  
        Get role for self.
    
    <!-- end list -->
    
      - `  system  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  uuid  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  version  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  - `  management.role.model.  ` ` 
    role_related_obj_change_cache_handler  ` <span class="sig-paren"> (
    </span> *<span class="n"> sender </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="n">
    instance </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="n"> using
    </span> <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="o"> \*\* </span> <span class="n"> kwargs
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/model/#role_related_obj_change_cache_handler)  
    Signal handler for invalidating Principal cache on Role object
    change.

</div>

<div id="module-management.role.serializer" class="section">

<span id="management-role-serializer-module"> </span>

## management.role.serializer module

Serializer for role management.

  - *class* `  management.role.serializer.  ` `  AccessSerializer  `
    <span class="sig-paren"> ( </span> *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/serializer/#AccessSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the Access model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#AccessSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('resourceDefinitions', 'permission')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.role.model.Access
             `](#management.role.model.Access "management.role.model.Access")
    
    <!-- end list -->
    
      - `  validate_permission  ` <span class="sig-paren"> ( </span>
        *<span class="n"> value </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#AccessSerializer.validate_permission)  
        Validate the permissions input.

<!-- end list -->

  - *class* `  management.role.serializer.  ` ` 
    DynamicFieldsModelSerializer  ` <span class="sig-paren"> ( </span>
    *<span class="o"> \* </span> <span class="n"> args </span>* ,
    *<span class="o"> \*\* </span> <span class="n"> kwargs </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/serializer/#DynamicFieldsModelSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    A ModelSerializer that controls which fields should be displayed.

<!-- end list -->

  - *class* `  management.role.serializer.  ` ` 
    ResourceDefinitionSerializer  ` <span class="sig-paren"> ( </span>
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/serializer/#ResourceDefinitionSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the ResourceDefinition model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#ResourceDefinitionSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('attributeFilter',)*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.role.model.ResourceDefinition
             `](#management.role.model.ResourceDefinition "management.role.model.ResourceDefinition")

<!-- end list -->

  - *class* `  management.role.serializer.  ` `  RoleDynamicSerializer
     ` <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/serializer/#RoleDynamicSerializer)  
    Bases: [`  management.role.serializer.DynamicFieldsModelSerializer
     `](#management.role.serializer.DynamicFieldsModelSerializer "management.role.serializer.DynamicFieldsModelSerializer")
    
    Serializer for the Role model that could dynamically return required
    field.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleDynamicSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description', 'created',
            'modified', 'policyCount', 'groups\_in',
            'groups\_in\_count', 'accessCount', 'applications',
            'system', 'platform\_default')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.role.model.Role
             `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      - `  get_applications  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleDynamicSerializer.get_applications)  
        Get the list of applications in the role.
    
    <!-- end list -->
    
      - `  get_groups_in  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleDynamicSerializer.get_groups_in)  
        Get the groups where the role is in.
    
    <!-- end list -->
    
      - `  get_groups_in_count  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleDynamicSerializer.get_groups_in_count)  
        Get the totoal count of groups where the role is in.

<!-- end list -->

  - *class* `  management.role.serializer.  ` `  RoleMinimumSerializer
     ` <span class="sig-paren"> ( </span> *instance=None* ,
    *data=\<class 'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/serializer/#RoleMinimumSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the Role model that doesn’t return access info.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleMinimumSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description', 'created',
            'modified', 'policyCount', 'accessCount', 'applications',
            'system', 'platform\_default')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.role.model.Role
             `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      - `  get_applications  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleMinimumSerializer.get_applications)  
        Get the list of applications in the role.

<!-- end list -->

  - *class* `  management.role.serializer.  ` `  RoleSerializer  `
    <span class="sig-paren"> ( </span> *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/serializer/#RoleSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the Role model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description', 'access',
            'policyCount', 'accessCount', 'applications', 'system',
            'platform\_default', 'created', 'modified')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.role.model.Role
             `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      - `  create  ` <span class="sig-paren"> ( </span>
        *<span class="n"> validated\_data </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/serializer/#RoleSerializer.create)  
        Create the role object in the database.
    
    <!-- end list -->
    
      - `  get_applications  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleSerializer.get_applications)  
        Get the list of applications in the role.
    
    <!-- end list -->
    
      - `  update  ` <span class="sig-paren"> ( </span>
        *<span class="n"> instance </span>* , *<span class="n">
        validated\_data </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/serializer/#RoleSerializer.update)  
        Update the role object in the database.

<!-- end list -->

  - `  management.role.serializer.  ` `  obtain_applications  `
    <span class="sig-paren"> ( </span> *<span class="n"> obj </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/serializer/#obtain_applications)  
    Shared function to get the list of applications in the role.

<!-- end list -->

  - `  management.role.serializer.  ` `  obtain_groups_in  `
    <span class="sig-paren"> ( </span> *<span class="n"> obj </span>* ,
    *<span class="n"> request </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/serializer/#obtain_groups_in)  
    Shared function to get the groups the roles is in.

</div>

<div id="module-management.role.view" class="section">

<span id="management-role-view-module"> </span>

## management.role.view module

View for role management.

  - *class* `  management.role.view.  ` `  RoleFilter  `
    <span class="sig-paren"> ( </span> *<span class="n"> data </span>
    <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> queryset </span> <span class="o"> =
    </span> <span class="default_value"> None </span>* ,
    *<span class="o"> \* </span>* , *<span class="n"> request </span>
    <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> prefix </span> <span class="o"> =
    </span> <span class="default_value"> None </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/role/view/#RoleFilter)  
    Bases: [`  management.filters.CommonFilters
     `](../management/#management.filters.CommonFilters "management.filters.CommonFilters")
    
    Filter for role.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/view/#RoleFilter.Meta)  
        Bases: `  object  `
        
          - `  fields  ` *= \['name'\]*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.role.model.Role
             `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      - `  base_filters  ` *= {'name':
        \<django\_filters.filters.CharFilter object\>}*
    
    <!-- end list -->
    
      - `  declared_filters  ` *= {'name':
        \<django\_filters.filters.CharFilter object\>}*

<!-- end list -->

  - *class* `  management.role.view.  ` `  RoleViewSet  `
    <span class="sig-paren"> ( </span> *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/role/view/#RoleViewSet)  
    Bases: `  rest_framework.mixins.CreateModelMixin  ` , ` 
    rest_framework.mixins.DestroyModelMixin  ` , ` 
    rest_framework.mixins.ListModelMixin  ` , ` 
    rest_framework.mixins.RetrieveModelMixin  ` , ` 
    rest_framework.mixins.UpdateModelMixin  ` , ` 
    rest_framework.viewsets.GenericViewSet  `
    
    Role View.
    
    A viewset that provides default create() , destroy , retrieve() ,
    and list() actions.
    
      - `  access  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> uuid
        </span> <span class="o"> = </span> <span class="default_value">
        None </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.access)  
        Return access objects for specified role.
    
    <!-- end list -->
    
      - `  basename  ` *= None*
    
    <!-- end list -->
    
      - `  create  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.create)  
        Create a roles.
        
        @api {post} /api/v1/roles/ Create a role @apiName createRole
        @apiGroup Role @apiVersion 1.0.0 @apiDescription Create a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Request Body) {String} name Role name @apiParam
        (Request Body) {Array} access Access definition @apiParamExample
        {json} Request Body:
        
        > 
        > 
        > <div>
        > 
        >   - {  
        >     “name”: “RoleA”, “access”: \[
        >     
        >     > 
        >     > 
        >     > <div>
        >     > 
        >     > { “permission”: “app:
        >     > [<span id="id2" class="problematic"> \* </span>](#id1)
        >     > :read”, “resourceDefinitions”: \[
        >     > 
        >     > > 
        >     > > 
        >     > > <div>
        >     > > 
        >     > >   - {
        >     > >     
        >     > >       - “attributeFilter”: {  
        >     > >         “key”: “app.attribute.case”, “operation”:
        >     > >         “equal”, “value”: “thevalue”
        >     > >     
        >     > >     }
        >     > > 
        >     > > }
        >     > > 
        >     > > </div>
        >     > 
        >     > </div>
        >     
        >     \]
        > 
        > }
        > 
        > </div>
        
        @apiSuccess {String} uuid Role unique identifier @apiSuccess
        {String} name Role name @apiSuccessExample {json}
        Success-Response:
        
        > 
        > 
        > <div>
        > 
        > HTTP/1.1 201 CREATED {
        > 
        > > 
        > > 
        > > <div>
        > > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “RoleA”, “access”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > { “permission”: “app: [<span id="id4" class="problematic">
        > > > \* </span>](#id3) :read”, “resourceDefinitions”: \[
        > > > 
        > > > > 
        > > > > 
        > > > > <div>
        > > > > 
        > > > >   - {
        > > > >     
        > > > >       - “attributeFilter”: {  
        > > > >         “key”: “app.attribute.case”, “operation”:
        > > > >         “equal”, “value”: “thevalue”
        > > > >     
        > > > >     }
        > > > > 
        > > > > }
        > > > > 
        > > > > </div>
        > > > 
        > > > </div>
        > > 
        > > \]
        > > 
        > > </div>
        > 
        > }
        > 
        > </div>
    
    <!-- end list -->
    
      - `  description  ` *= None*
    
    <!-- end list -->
    
      - `  destroy  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.destroy)  
        Delete a role.
        
        @api {delete} /api/v1/roles/:uuid Delete a role @apiName
        deleteRole @apiGroup Role @apiVersion 1.0.0 @apiDescription
        Delete a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} uuid Role unique identifier
        
          - @apiSuccessExample {json} Success-Response:  
            HTTP/1.1 204 NO CONTENT
    
    <!-- end list -->
    
      - `  detail  ` *= None*
    
    <!-- end list -->
    
      - `  filter_backends  ` *= (\<class
        'django\_filters.rest\_framework.backends.DjangoFilterBackend'\>,
        \<class 'rest\_framework.filters.OrderingFilter'\>)*
    
    <!-- end list -->
    
      - `  filterset_class  `  
        alias of [`  RoleFilter
         `](#management.role.view.RoleFilter "management.role.view.RoleFilter")
    
    <!-- end list -->
    
      - `  get_queryset  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.get_queryset)  
        Obtain queryset for requesting user based on access.
    
    <!-- end list -->
    
      - `  get_serializer  ` <span class="sig-paren"> ( </span>
        *<span class="o"> \* </span> <span class="n"> args </span>* ,
        *<span class="o"> \*\* </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.get_serializer)  
        Get serializer.
    
    <!-- end list -->
    
      - `  get_serializer_class  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.get_serializer_class)  
        Get serializer class based on route.
    
    <!-- end list -->
    
      - `  list  ` <span class="sig-paren"> ( </span> *<span class="n">
        request </span>* , *<span class="o"> \* </span> <span class="n">
        args </span>* , *<span class="o"> \*\* </span> <span class="n">
        kwargs </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.list)  
        Obtain the list of roles for the tenant.
        
        @api {get} /api/v1/roles/ Obtain a list of roles @apiName
        getRoles @apiGroup Role @apiVersion 1.0.0 @apiDescription Obtain
        a list of roles
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Query) {String} name Filter by role name. @apiParam
        (Query) {Number} offset Parameter for selecting the start of
        data (default is 0). @apiParam (Query) {Number} limit Parameter
        for selecting the amount of data (default is 10).
        
        @apiSuccess {Object} meta The metadata for pagination.
        @apiSuccess {Object} links The object containing links of
        results. @apiSuccess {Object\[\]} data The array of results.
        
          - @apiSuccessExample {json} Success-Response:  
            HTTP/1.1 200 OK {
            
            > 
            > 
            > <div>
            > 
            >   - ‘meta’: {  
            >     ‘count’: 2
            > 
            > } ‘links’: {
            > 
            > > 
            > > 
            > > <div>
            > > 
            > > ‘first’: /api/v1/roles/?offset=0\&limit=10, ‘next’:
            > > None, ‘previous’: None, ‘last’:
            > > /api/v1/roles/?offset=0\&limit=10
            > > 
            > > </div>
            > 
            > }, ‘data’: \[
            > 
            > > 
            > > 
            > > <div>
            > > 
            > > > 
            > > > 
            > > > <div>
            > > > 
            > > >   - {  
            > > >     “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”,
            > > >     “name”: “RoleA”
            > > > 
            > > > }, {
            > > > 
            > > > > 
            > > > > 
            > > > > <div>
            > > > > 
            > > > > “uuid”: “20ecdcd0-397c-4ede-8940-f3439bf40212”,
            > > > > “name”: “RoleB”
            > > > > 
            > > > > </div>
            > > > 
            > > > }
            > > > 
            > > > </div>
            > > 
            > > \]
            > > 
            > > </div>
            > 
            > </div>
            
            }
    
    <!-- end list -->
    
      - `  lookup_field  ` *= 'uuid'*
    
    <!-- end list -->
    
      - `  name  ` *= None*
    
    <!-- end list -->
    
      - `  ordering  ` *= ('name',)*
    
    <!-- end list -->
    
      - `  ordering_fields  ` *= ('name', 'modified', 'policyCount')*
    
    <!-- end list -->
    
      - `  permission_classes  ` *= (\<class
        'management.permissions.role\_access.RoleAccessPermission'\>,)*
    
    <!-- end list -->
    
      - `  queryset  `
    
    <!-- end list -->
    
      - `  retrieve  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.retrieve)  
        Get a role.
        
        @api {get} /api/v1/roles/:uuid Get a role @apiName getRole
        @apiGroup Role @apiVersion 1.0.0 @apiDescription Get a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Role unique identifier.
        
        @apiSuccess {String} uuid Role unique identifier @apiSuccess
        {String} name Role name @apiSuccessExample {json}
        Success-Response:
        
        > 
        > 
        > <div>
        > 
        > HTTP/1.1 200 OK {
        > 
        > > 
        > > 
        > > <div>
        > > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “RoleA”, “access”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > { “permission”: “app: [<span id="id6" class="problematic">
        > > > \* </span>](#id5) :read”, “resourceDefinitions”: \[
        > > > 
        > > > > 
        > > > > 
        > > > > <div>
        > > > > 
        > > > >   - {
        > > > >     
        > > > >       - “attributeFilter”: {  
        > > > >         “key”: “app.attribute.case”, “operation”:
        > > > >         “equal”, “value”: “thevalue”
        > > > >     
        > > > >     }
        > > > > 
        > > > > }
        > > > > 
        > > > > </div>
        > > > 
        > > > </div>
        > > 
        > > \]
        > > 
        > > </div>
        > 
        > }
        > 
        > </div>
    
    <!-- end list -->
    
      - `  serializer_class  `  
        alias of [`  management.role.serializer.RoleSerializer
         `](#management.role.serializer.RoleSerializer "management.role.serializer.RoleSerializer")
    
    <!-- end list -->
    
      - `  suffix  ` *= None*
    
    <!-- end list -->
    
      - `  update  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.update)  
        Update a group.
        
        @api {post} /api/v1/roles/:uuid Update a role @apiName
        updateRole @apiGroup Role @apiVersion 1.0.0 @apiDescription
        Update a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Role unique identifier
        
        @apiParam (Request Body) {String} name Role name @apiParam
        (Request Body) {Array} access Access definition @apiParamExample
        {json} Request Body:
        
        > 
        > 
        > <div>
        > 
        >   - {  
        >     “name”: “RoleA”, “access”: \[
        >     
        >     > 
        >     > 
        >     > <div>
        >     > 
        >     > { “permission”: “app:
        >     > [<span id="id8" class="problematic"> \* </span>](#id7)
        >     > :read”, “resourceDefinitions”: \[
        >     > 
        >     > > 
        >     > > 
        >     > > <div>
        >     > > 
        >     > >   - {
        >     > >     
        >     > >       - “attributeFilter”: {  
        >     > >         “key”: “app.attribute.case”, “operation”:
        >     > >         “equal”, “value”: “change\_value”
        >     > >     
        >     > >     }
        >     > > 
        >     > > }
        >     > > 
        >     > > </div>
        >     > 
        >     > </div>
        >     
        >     \]
        > 
        > }
        > 
        > </div>
        
        @apiSuccess {String} uuid Role unique identifier @apiSuccess
        {String} name Role name @apiSuccessExample {json}
        Success-Response:
        
        > 
        > 
        > <div>
        > 
        > HTTP/1.1 200 OK {
        > 
        > > 
        > > 
        > > <div>
        > > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “RoleA”, “access”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > { “permission”: “app:
        > > > [<span id="id10" class="problematic"> \* </span>](#id9)
        > > > :read”, “resourceDefinitions”: \[
        > > > 
        > > > > 
        > > > > 
        > > > > <div>
        > > > > 
        > > > >   - {
        > > > >     
        > > > >       - “attributeFilter”: {  
        > > > >         “key”: “app.attribute.case”, “operation”:
        > > > >         “equal”, “value”: “change\_value”
        > > > >     
        > > > >     }
        > > > > 
        > > > > }
        > > > > 
        > > > > </div>
        > > > 
        > > > </div>
        > > 
        > > \]
        > > 
        > > </div>
        > 
        > }
        > 
        > </div>
    
    <!-- end list -->
    
      - `  validate_and_get_access_list  ` <span class="sig-paren"> (
        </span> *<span class="n"> data </span>* <span class="sig-paren">
        ) </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.validate_and_get_access_list)  
        Validate if input data contains valid access list and return.
    
    <!-- end list -->
    
      - `  validate_and_get_additional_field_key  `
        <span class="sig-paren"> ( </span> *<span class="n"> params
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/role/view/#RoleViewSet.validate_and_get_additional_field_key)  
        Validate the add field key.

</div>

<div id="module-management.role" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>