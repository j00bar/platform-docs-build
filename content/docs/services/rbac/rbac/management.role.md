---
date: 2020-08-25 00:00:48.985413
title: management.role package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Submodules

## management.role.definer module

Handler for system defined roles.

  -  ` management.role.definer. ` ` seed_permissions `  (  * tenant *  )
     [ \[source\]
    ](../../_modules/management/role/definer/#seed_permissions)   
    For a tenant update or create defined permissions.

<!-- end list -->

  -  ` management.role.definer. ` ` seed_roles `  (  * tenant *  )  [
    \[source\] ](../../_modules/management/role/definer/#seed_roles)   
    For a tenant update or create system defined roles.

## management.role.model module

Model for role management.

  -  *class* ` management.role.model. ` ` Access `  (  * \*   args * , *
    \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/role/model/#Access)   
    Bases: ` django.db.models.base.Model `
    
    An access object.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` objects ` *= \<management.role.model.CustomManager object\>* 
    
    <!-- end list -->
    
      -  ` perm `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` permission `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` permission_application `  (   )  [ \[source\]
        ](../../_modules/management/role/model/#Access.permission_application)
          
        Return the application name from the permission.
    
    <!-- end list -->
    
      -  ` resourceDefinitions `   
        Accessor to the related objects manager on the reverse side of a
        many-to-one relation.
        
        In the example:
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        ` Parent.children ` is a ` ReverseManyToOneDescriptor `
        instance.
        
        Most of the implementation is delegated to a dynamically defined
        manager class built by ` create_forward_many_to_many_manager() `
        defined below.
    
    <!-- end list -->
    
      -  ` role `   
        Accessor to the related object on the forward side of a
        many-to-one or one-to-one (via ForwardOneToOneDescriptor
        subclass) relation.
        
        In the example:
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        ` Child.parent ` is a ` ForwardManyToOneDescriptor ` instance.
    
    <!-- end list -->
    
      -  ` role_id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` save `  (  * \*   args * , * \*\*   kwargs *  )  [ \[source\]
        ](../../_modules/management/role/model/#Access.save)   
        When new Access object get created, populate the permission
        field.
    
    <!-- end list -->
    
      -  ` split_permission `  (   )  [ \[source\]
        ](../../_modules/management/role/model/#Access.split_permission)
          
        Split the permission.

<!-- end list -->

  -  *class* ` management.role.model. ` ` CustomManager ` [ \[source\]
    ](../../_modules/management/role/model/#CustomManager)   
    Bases: ` django.db.models.manager.Manager `
    
    Control which fields to query.
    
      -  ` get_queryset `  (   )  [ \[source\]
        ](../../_modules/management/role/model/#CustomManager.get_queryset)
          
        Override default get\_queryset to defer fields.

<!-- end list -->

  -  *class* ` management.role.model. ` ` ResourceDefinition `  (  * \* 
     args * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/role/model/#ResourceDefinition)   
    Bases: ` django.db.models.base.Model `
    
    A resource definition.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` access `   
        Accessor to the related object on the forward side of a
        many-to-one or one-to-one (via ForwardOneToOneDescriptor
        subclass) relation.
        
        In the example:
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        ` Child.parent ` is a ` ForwardManyToOneDescriptor ` instance.
    
    <!-- end list -->
    
      -  ` access_id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` attributeFilter `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` objects ` *= \<django.db.models.manager.Manager object\>* 
    
    <!-- end list -->
    
      -  *property* ` role `   
        Get role for RD.

<!-- end list -->

  -  *class* ` management.role.model. ` ` Role `  (  * \*   args * , *
    \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/role/model/#Role)   
    Bases: ` django.db.models.base.Model `
    
    A role.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` access `   
        Accessor to the related objects manager on the reverse side of a
        many-to-one relation.
        
        In the example:
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        ` Parent.children ` is a ` ReverseManyToOneDescriptor `
        instance.
        
        Most of the implementation is delegated to a dynamically defined
        manager class built by ` create_forward_many_to_many_manager() `
        defined below.
    
    <!-- end list -->
    
      -  ` created `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` description `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` display_name `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` get_next_by_created `  (  *\** ,
        *field=\<django.db.models.fields.DateTimeField: created\>* ,
        *is\_next=True* , *\*\*kwargs*  )  
    
    <!-- end list -->
    
      -  ` get_next_by_modified `  (  *\** ,
        *field=\<management.rbac\_fields.AutoDateTimeField: modified\>*
        , *is\_next=True* , *\*\*kwargs*  )  
    
    <!-- end list -->
    
      -  ` get_previous_by_created `  (  *\** ,
        *field=\<django.db.models.fields.DateTimeField: created\>* ,
        *is\_next=False* , *\*\*kwargs*  )  
    
    <!-- end list -->
    
      -  ` get_previous_by_modified `  (  *\** ,
        *field=\<management.rbac\_fields.AutoDateTimeField: modified\>*
        , *is\_next=False* , *\*\*kwargs*  )  
    
    <!-- end list -->
    
      -  ` id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` modified `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` name `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` objects ` *= \<django.db.models.manager.Manager object\>* 
    
    <!-- end list -->
    
      -  ` platform_default `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` policies `   
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
    
      -  *property* ` role `   
        Get role for self.
    
    <!-- end list -->
    
      -  ` save `  (  * \*   args * , * \*\*   kwargs *  )  [ \[source\]
        ](../../_modules/management/role/model/#Role.save)   
        Ensure that display\_name is populated on save.
    
    <!-- end list -->
    
      -  ` system `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` uuid `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` version `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  -  ` management.role.model. ` ` role_related_obj_change_cache_handler
    `  (  * sender   =   None * , * instance   =   None * , * using   = 
     None * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/role/model/#role_related_obj_change_cache_handler)
      
    Signal handler for invalidating Principal cache on Role object
    change.

## management.role.serializer module

Serializer for role management.

  -  *class* ` management.role.serializer. ` ` AccessSerializer `  ( 
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/role/serializer/#AccessSerializer)   
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the Access model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/role/serializer/#AccessSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('resourceDefinitions', 'permission')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.role.model.Access
            `](#management.role.model.Access "management.role.model.Access")
    
    <!-- end list -->
    
      -  ` validate_permission `  (  * value *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#AccessSerializer.validate_permission)
          
        Validate the permissions input.

<!-- end list -->

  -  *class* ` management.role.serializer. ` `
    DynamicFieldsModelSerializer `  (  * \*   args * , * \*\*   kwargs *
     )  [ \[source\]
    ](../../_modules/management/role/serializer/#DynamicFieldsModelSerializer)
      
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    A ModelSerializer that controls which fields should be displayed.

<!-- end list -->

  -  *class* ` management.role.serializer. ` `
    ResourceDefinitionSerializer `  (  *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/role/serializer/#ResourceDefinitionSerializer)
      
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the ResourceDefinition model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/role/serializer/#ResourceDefinitionSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('attributeFilter',)* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.role.model.ResourceDefinition
            `](#management.role.model.ResourceDefinition "management.role.model.ResourceDefinition")

<!-- end list -->

  -  *class* ` management.role.serializer. ` ` RoleDynamicSerializer ` 
    (  * \*   args * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/role/serializer/#RoleDynamicSerializer)
      
    Bases: [` management.role.serializer.DynamicFieldsModelSerializer
    `](#management.role.serializer.DynamicFieldsModelSerializer "management.role.serializer.DynamicFieldsModelSerializer")
    
    Serializer for the Role model that could dynamically return required
    field.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/role/serializer/#RoleDynamicSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('uuid', 'name', 'display\_name',
            'description', 'created', 'modified', 'policyCount',
            'groups\_in', 'groups\_in\_count', 'accessCount',
            'applications', 'system', 'platform\_default')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.role.model.Role
            `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      -  ` get_applications `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#RoleDynamicSerializer.get_applications)
          
        Get the list of applications in the role.
    
    <!-- end list -->
    
      -  ` get_groups_in `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#RoleDynamicSerializer.get_groups_in)
          
        Get the groups where the role is in.
    
    <!-- end list -->
    
      -  ` get_groups_in_count `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#RoleDynamicSerializer.get_groups_in_count)
          
        Get the totoal count of groups where the role is in.

<!-- end list -->

  -  *class* ` management.role.serializer. ` ` RoleMinimumSerializer ` 
    (  *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>*
    , *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/role/serializer/#RoleMinimumSerializer)
      
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the Role model that doesn’t return access info.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/role/serializer/#RoleMinimumSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('uuid', 'name', 'display\_name',
            'description', 'created', 'modified', 'policyCount',
            'accessCount', 'applications', 'system',
            'platform\_default')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.role.model.Role
            `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      -  ` get_applications `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#RoleMinimumSerializer.get_applications)
          
        Get the list of applications in the role.

<!-- end list -->

  -  *class* ` management.role.serializer. ` ` RoleSerializer `  ( 
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/role/serializer/#RoleSerializer)   
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the Role model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/role/serializer/#RoleSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('uuid', 'name', 'display\_name',
            'description', 'access', 'policyCount', 'accessCount',
            'applications', 'system', 'platform\_default', 'created',
            'modified')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.role.model.Role
            `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      -  ` create `  (  * validated\_data *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#RoleSerializer.create)
          
        Create the role object in the database.
    
    <!-- end list -->
    
      -  ` get_applications `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/role/serializer/#RoleSerializer.get_applications)
          
        Get the list of applications in the role.
    
    <!-- end list -->
    
      -  ` update `  (  * instance * , * validated\_data *  )  [
        \[source\]
        ](../../_modules/management/role/serializer/#RoleSerializer.update)
          
        Update the role object in the database.

<!-- end list -->

  -  ` management.role.serializer. ` ` obtain_applications `  (  * obj *
     )  [ \[source\]
    ](../../_modules/management/role/serializer/#obtain_applications)   
    Shared function to get the list of applications in the role.

<!-- end list -->

  -  ` management.role.serializer. ` ` obtain_groups_in `  (  * obj * ,
    * request *  )  [ \[source\]
    ](../../_modules/management/role/serializer/#obtain_groups_in)   
    Shared function to get the groups the roles is in.

## management.role.view module

View for role management.

  -  *class* ` management.role.view. ` ` RoleFilter `  (  * data   =  
    None * , * queryset   =   None * , * \* * , * request   =   None * ,
    * prefix   =   None *  )  [ \[source\]
    ](../../_modules/management/role/view/#RoleFilter)   
    Bases: [` management.filters.CommonFilters
    `](../management/#management.filters.CommonFilters "management.filters.CommonFilters")
    
    Filter for role.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/role/view/#RoleFilter.Meta)   
        Bases: ` object `
        
          -  ` fields ` *= \['name'\]* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.role.model.Role
            `](#management.role.model.Role "management.role.model.Role")
    
    <!-- end list -->
    
      -  ` base_filters ` *= {'name':
        \<django\_filters.filters.CharFilter object\>}* 
    
    <!-- end list -->
    
      -  ` declared_filters ` *= {'name':
        \<django\_filters.filters.CharFilter object\>}* 

<!-- end list -->

  -  *class* ` management.role.view. ` ` RoleViewSet `  (  * \*\*  
    kwargs *  )  [ \[source\]
    ](../../_modules/management/role/view/#RoleViewSet)   
    Bases: ` rest_framework.mixins.CreateModelMixin ` , `
    rest_framework.mixins.DestroyModelMixin ` , `
    rest_framework.mixins.ListModelMixin ` , `
    rest_framework.mixins.RetrieveModelMixin ` , `
    rest_framework.mixins.UpdateModelMixin ` , `
    rest_framework.viewsets.GenericViewSet `
    
    Role View.
    
    A viewset that provides default create() , destroy , retrieve() ,
    and list() actions.
    
      -  ` access `  (  * request * , * uuid   =   None *  )  [
        \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.access)   
        Return access objects for specified role.
    
    <!-- end list -->
    
      -  ` basename ` *= None* 
    
    <!-- end list -->
    
      -  ` create `  (  * request * , * \*   args * , * \*\*   kwargs * 
        )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.create)   
        Create a roles.
        
        @api {post} /api/v1/roles/ Create a role @apiName createRole
        @apiGroup Role @apiVersion 1.0.0 @apiDescription Create a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Request Body) {String} name Role name @apiParam
        (Request Body) {Array} access Access definition @apiParamExample
        {json} Request Body:
        
        >   -  {   
        >     “name”: “RoleA”, “access”: \[
        >     
        >     > { “permission”: “app: [ \* ](#id1) :read”,
        >     > “resourceDefinitions”: \[
        >     > 
        >     > >   -  { 
        >     > >     
        >     > >       -  “attributeFilter”: {   
        >     > >         “key”: “app.attribute.case”, “operation”:
        >     > >         “equal”, “value”: “thevalue”
        >     > >     
        >     > >     }
        >     > > 
        >     > > }
        >     
        >     \]
        > 
        > }
        
        @apiSuccess {String} uuid Role unique identifier @apiSuccess
        {String} name Role name @apiSuccessExample {json}
        Success-Response:
        
        > HTTP/1.1 201 CREATED {
        > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “RoleA”, “display\_name”: “RoleA”, “access”: \[
        > > 
        > > > { “permission”: “app: [ \* ](#id3) :read”,
        > > > “resourceDefinitions”: \[
        > > > 
        > > > >   -  { 
        > > > >     
        > > > >       -  “attributeFilter”: {   
        > > > >         “key”: “app.attribute.case”, “operation”:
        > > > >         “equal”, “value”: “thevalue”
        > > > >     
        > > > >     }
        > > > > 
        > > > > }
        > > 
        > > \]
        > 
        > }
    
    <!-- end list -->
    
      -  ` description ` *= None* 
    
    <!-- end list -->
    
      -  ` destroy `  (  * request * , * \*   args * , * \*\*   kwargs *
         )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.destroy)   
        Delete a role.
        
        @api {delete} /api/v1/roles/:uuid Delete a role @apiName
        deleteRole @apiGroup Role @apiVersion 1.0.0 @apiDescription
        Delete a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} uuid Role unique identifier
        
          -  @apiSuccessExample {json} Success-Response:   
            HTTP/1.1 204 NO CONTENT
    
    <!-- end list -->
    
      -  ` detail ` *= None* 
    
    <!-- end list -->
    
      -  ` filter_backends ` *= (\<class
        'django\_filters.rest\_framework.backends.DjangoFilterBackend'\>,
        \<class 'rest\_framework.filters.OrderingFilter'\>)* 
    
    <!-- end list -->
    
      -  ` filterset_class `   
        alias of [` RoleFilter
        `](#management.role.view.RoleFilter "management.role.view.RoleFilter")
    
    <!-- end list -->
    
      -  ` get_queryset `  (   )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.get_queryset)
          
        Obtain queryset for requesting user based on access.
    
    <!-- end list -->
    
      -  ` get_serializer `  (  * \*   args * , * \*\*   kwargs *  )  [
        \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.get_serializer)
          
        Get serializer.
    
    <!-- end list -->
    
      -  ` get_serializer_class `  (   )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.get_serializer_class)
          
        Get serializer class based on route.
    
    <!-- end list -->
    
      -  ` list `  (  * request * , * \*   args * , * \*\*   kwargs *  )
         [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.list)   
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
        
          -  @apiSuccessExample {json} Success-Response:   
            HTTP/1.1 200 OK {
            
            >   -  ‘meta’: {   
            >     ‘count’: 2
            > 
            > } ‘links’: {
            > 
            > > ‘first’: /api/v1/roles/?offset=0\&limit=10, ‘next’:
            > > None, ‘previous’: None, ‘last’:
            > > /api/v1/roles/?offset=0\&limit=10
            > 
            > }, ‘data’: \[
            > 
            > > >   -  {   
            > > >     “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”,
            > > >     “name”: “RoleA”
            > > > 
            > > > }, {
            > > > 
            > > > > “uuid”: “20ecdcd0-397c-4ede-8940-f3439bf40212”,
            > > > > “name”: “RoleB”
            > > > 
            > > > }
            > > 
            > > \]
            
            }
    
    <!-- end list -->
    
      -  ` lookup_field ` *= 'uuid'* 
    
    <!-- end list -->
    
      -  ` name ` *= None* 
    
    <!-- end list -->
    
      -  ` ordering ` *= ('name',)* 
    
    <!-- end list -->
    
      -  ` ordering_fields ` *= ('name', 'display\_name', 'modified',
        'policyCount')* 
    
    <!-- end list -->
    
      -  ` permission_classes ` *= (\<class
        'management.permissions.role\_access.RoleAccessPermission'\>,)* 
    
    <!-- end list -->
    
      -  ` queryset ` 
    
    <!-- end list -->
    
      -  ` retrieve `  (  * request * , * \*   args * , * \*\*   kwargs
        *  )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.retrieve)   
        Get a role.
        
        @api {get} /api/v1/roles/:uuid Get a role @apiName getRole
        @apiGroup Role @apiVersion 1.0.0 @apiDescription Get a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Role unique identifier.
        
        @apiSuccess {String} uuid Role unique identifier @apiSuccess
        {String} name Role name @apiSuccessExample {json}
        Success-Response:
        
        > HTTP/1.1 200 OK {
        > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “RoleA”, “display\_name”: “RoleA”, “access”: \[
        > > 
        > > > { “permission”: “app: [ \* ](#id5) :read”,
        > > > “resourceDefinitions”: \[
        > > > 
        > > > >   -  { 
        > > > >     
        > > > >       -  “attributeFilter”: {   
        > > > >         “key”: “app.attribute.case”, “operation”:
        > > > >         “equal”, “value”: “thevalue”
        > > > >     
        > > > >     }
        > > > > 
        > > > > }
        > > 
        > > \]
        > 
        > }
    
    <!-- end list -->
    
      -  ` serializer_class `   
        alias of [` management.role.serializer.RoleSerializer
        `](#management.role.serializer.RoleSerializer "management.role.serializer.RoleSerializer")
    
    <!-- end list -->
    
      -  ` suffix ` *= None* 
    
    <!-- end list -->
    
      -  ` update `  (  * request * , * \*   args * , * \*\*   kwargs * 
        )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.update)   
        Update a group.
        
        @api {post} /api/v1/roles/:uuid Update a role @apiName
        updateRole @apiGroup Role @apiVersion 1.0.0 @apiDescription
        Update a role
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Role unique identifier
        
        @apiParam (Request Body) {String} name Role name @apiParam
        (Request Body) {Array} access Access definition @apiParamExample
        {json} Request Body:
        
        >   -  {   
        >     “name”: “RoleA”, “access”: \[
        >     
        >     > { “permission”: “app: [ \* ](#id7) :read”,
        >     > “resourceDefinitions”: \[
        >     > 
        >     > >   -  { 
        >     > >     
        >     > >       -  “attributeFilter”: {   
        >     > >         “key”: “app.attribute.case”, “operation”:
        >     > >         “equal”, “value”: “change\_value”
        >     > >     
        >     > >     }
        >     > > 
        >     > > }
        >     
        >     \]
        > 
        > }
        
        @apiSuccess {String} uuid Role unique identifier @apiSuccess
        {String} name Role name @apiSuccessExample {json}
        Success-Response:
        
        > HTTP/1.1 200 OK {
        > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “RoleA”, “display\_name”: “RoleA”, “access”: \[
        > > 
        > > > { “permission”: “app: [ \* ](#id9) :read”,
        > > > “resourceDefinitions”: \[
        > > > 
        > > > >   -  { 
        > > > >     
        > > > >       -  “attributeFilter”: {   
        > > > >         “key”: “app.attribute.case”, “operation”:
        > > > >         “equal”, “value”: “change\_value”
        > > > >     
        > > > >     }
        > > > > 
        > > > > }
        > > 
        > > \]
        > 
        > }
    
    <!-- end list -->
    
      -  ` validate_and_get_access_list `  (  * data *  )  [ \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.validate_and_get_access_list)
          
        Validate if input data contains valid access list and return.
    
    <!-- end list -->
    
      -  ` validate_and_get_additional_field_key `  (  * params *  )  [
        \[source\]
        ](../../_modules/management/role/view/#RoleViewSet.validate_and_get_additional_field_key)
          
        Validate the add field key.

## Module contents

### [Table of Contents](../../index/)

  - [management.role package](#)
      - [Submodules](#submodules)
      - [management.role.definer
        module](#module-management.role.definer)
      - [management.role.model module](#module-management.role.model)
      - [management.role.serializer
        module](#module-management.role.serializer)
      - [management.role.view module](#module-management.role.view)
      - [Module contents](#module-management.role)

### This Page

  - [Show Source](../../_sources/rbac/management.role.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.