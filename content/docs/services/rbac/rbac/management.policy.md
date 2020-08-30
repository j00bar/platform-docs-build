---
date: 2020-08-30 16:01:49.412984
title: management.policy package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Submodules

## management.policy.model module

Model for policy management.

  -  *class* ` management.policy.model. ` ` Policy `  (  * \*   args * ,
    * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/policy/model/#Policy)   
    Bases: ` django.db.models.base.Model `
    
    A policy.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` created `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` description `   
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
    
      -  ` group `   
        Accessor to the related object on the forward side of a
        many-to-one or one-to-one (via ForwardOneToOneDescriptor
        subclass) relation.
        
        In the example:
        
            class Child(Model):
                parent = ForeignKey(Parent, related_name='children')
        
        ` Child.parent ` is a ` ForwardManyToOneDescriptor ` instance.
    
    <!-- end list -->
    
      -  ` group_id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
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
    
      -  ` roles `   
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
    
      -  ` system `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` uuid `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  -  ` management.policy.model. ` ` policy_changed_cache_handler `  (  *
    sender   =   None * , * instance   =   None * , * using   =   None *
    , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/policy/model/#policy_changed_cache_handler)
      
    Signal handler for Principal cache expiry on Policy deletion.

<!-- end list -->

  -  ` management.policy.model. ` ` policy_to_roles_cache_handler `  ( 
    * sender   =   None * , * instance   =   None * , * action   =  
    None * , * reverse   =   None * , * model   =   None * , * pk\_set  
    =   None * , * using   =   None * , * \*\*   kwargs *  )  [
    \[source\]
    ](../../_modules/management/policy/model/#policy_to_roles_cache_handler)
      
    Signal handler for Principal cache expiry on Policy/Role m2m change.

## management.policy.serializer module

Serializer for policy management.

  -  *class* ` management.policy.serializer. ` ` PolicyInputSerializer `
     (  *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/policy/serializer/#PolicyInputSerializer)
      
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the policy model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/policy/serializer/#PolicyInputSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('uuid', 'name', 'description', 'group',
            'roles', 'created', 'modified')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.policy.model.Policy
            `](#management.policy.model.Policy "management.policy.model.Policy")
    
    <!-- end list -->
    
      -  ` create `  (  * validated\_data *  )  [ \[source\]
        ](../../_modules/management/policy/serializer/#PolicyInputSerializer.create)
          
        Create the policy object in the database.
    
    <!-- end list -->
    
      -  ` to_representation `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/policy/serializer/#PolicyInputSerializer.to_representation)
          
        Convert representation to dictionary object.
    
    <!-- end list -->
    
      -  ` update `  (  * instance * , * validated\_data *  )  [
        \[source\]
        ](../../_modules/management/policy/serializer/#PolicyInputSerializer.update)
          
        Update the policy object in the database.

<!-- end list -->

  -  *class* ` management.policy.serializer. ` ` PolicySerializer `  ( 
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/policy/serializer/#PolicySerializer)   
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the policy model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/policy/serializer/#PolicySerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('uuid', 'name', 'description', 'group',
            'roles', 'created', 'modified')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.policy.model.Policy
            `](#management.policy.model.Policy "management.policy.model.Policy")
    
    <!-- end list -->
    
      -  ` to_representation `  (  * obj *  )  [ \[source\]
        ](../../_modules/management/policy/serializer/#PolicySerializer.to_representation)
          
        Convert representation to dictionary object.

<!-- end list -->

  -  *class* ` management.policy.serializer. ` ` UUIDListField `  (  *
    \*   args * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/policy/serializer/#UUIDListField)   
    Bases: ` rest_framework.fields.ListField `
    
    List of UUID Fields.
    
      -  ` child ` *= UUIDField()* 

## management.policy.view module

View for policy management.

  -  *class* ` management.policy.view. ` ` PolicyFilter `  (  * data   =
      None * , * queryset   =   None * , * \* * , * request   =   None *
    , * prefix   =   None *  )  [ \[source\]
    ](../../_modules/management/policy/view/#PolicyFilter)   
    Bases: ` django_filters.rest_framework.filterset.FilterSet `
    
    Filter for policy.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/policy/view/#PolicyFilter.Meta)   
        Bases: ` object `
        
          -  ` fields ` *= \['name', 'group\_name', 'group\_uuid'\]* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.policy.model.Policy
            `](#management.policy.model.Policy "management.policy.model.Policy")
    
    <!-- end list -->
    
      -  ` base_filters ` *= {'group\_name':
        \<django\_filters.filters.CharFilter object\>, 'group\_uuid':
        \<django\_filters.filters.UUIDFilter object\>, 'name':
        \<django\_filters.filters.CharFilter object\>}* 
    
    <!-- end list -->
    
      -  ` declared_filters ` *= {'group\_name':
        \<django\_filters.filters.CharFilter object\>, 'group\_uuid':
        \<django\_filters.filters.UUIDFilter object\>, 'name':
        \<django\_filters.filters.CharFilter object\>}* 

<!-- end list -->

  -  *class* ` management.policy.view. ` ` PolicyViewSet `  (  * \*\*  
    kwargs *  )  [ \[source\]
    ](../../_modules/management/policy/view/#PolicyViewSet)   
    Bases: ` rest_framework.mixins.CreateModelMixin ` , `
    rest_framework.mixins.DestroyModelMixin ` , `
    rest_framework.mixins.ListModelMixin ` , `
    rest_framework.mixins.RetrieveModelMixin ` , `
    rest_framework.mixins.UpdateModelMixin ` , `
    rest_framework.viewsets.GenericViewSet `
    
    Policy View.
    
    A viewset that provides default create() , destroy , retrieve() ,
    and list() actions.
    
      -  ` basename ` *= None* 
    
    <!-- end list -->
    
      -  ` create `  (  * request * , * \*   args * , * \*\*   kwargs * 
        )  [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.create)
          
        Create a policy.
        
        @api {post} /api/v1/policies/ Create a policy @apiName
        createPolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription
        Create a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Request Body) {String} name Policy name @apiParam
        (Request Body) {String} group UUID of group @apiParam (Request
        Body) {Array} roles Array of role UUIDs @apiParamExample {json}
        Request Body:
        
        >   -  {   
        >     “name”: “PolicyA” “group”:
        >     “57e60f90-8c0c-4bd1-87a0-2143759aae1c”, “roles”: \[
        >     
        >     > “4df211e0-2d88-49a4-8802-728630224d15”
        >     
        >     \]
        > 
        > }
        
        @apiSuccess {String} uuid Policy unique identifier @apiSuccess
        {String} name Policy name @apiSuccessExample {json}
        Success-Response:
        
        > HTTP/1.1 201 CREATED {
        > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “PolicyA”, “group”: {
        > > 
        > > > “name”: “GroupA”, “uuid”:
        > > > “57e60f90-8c0c-4bd1-87a0-2143759aae1c”
        > > 
        > > }, “roles”: \[
        > > 
        > > >   -  {   
        > > >     “name”: “RoleA”, “uuid”:
        > > >     “4df211e0-2d88-49a4-8802-728630224d15”
        > > > 
        > > > }
        > > 
        > > \]
        > 
        > }
    
    <!-- end list -->
    
      -  ` description ` *= None* 
    
    <!-- end list -->
    
      -  ` destroy `  (  * request * , * \*   args * , * \*\*   kwargs *
         )  [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.destroy)
          
        Delete a policy.
        
        @api {delete} /api/v1/policies/:uuid Delete a policy @apiName
        deletePolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription
        Delete a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} uuid Policy unique identifier
        
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
        alias of [` PolicyFilter
        `](#management.policy.view.PolicyFilter "management.policy.view.PolicyFilter")
    
    <!-- end list -->
    
      -  ` get_queryset `  (   )  [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.get_queryset)
          
        Obtain queryset for requesting user based on access.
    
    <!-- end list -->
    
      -  ` get_serializer_class `  (   )  [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.get_serializer_class)
          
        Get serializer based on route.
    
    <!-- end list -->
    
      -  ` list `  (  * request * , * \*   args * , * \*\*   kwargs *  )
         [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.list)   
        Obtain the list of policies for the tenant.
        
        @api {get} /api/v1/policies/ Obtain a list of policies @apiName
        getPolicies @apiGroup Policy @apiVersion 1.0.0 @apiDescription
        Obtain a list of policies
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Query) {String} name Filter by policy name. @apiParam
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
            > > ‘first’: /api/v1/policies/?offset=0\&limit=10, ‘next’:
            > > None, ‘previous’: None, ‘last’:
            > > /api/v1/policies/?offset=0\&limit=10
            > 
            > }, ‘data’: \[
            > 
            > > >   -  {   
            > > >     “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”,
            > > >     “name”: “PolicyA”
            > > > 
            > > > }, {
            > > > 
            > > > > “uuid”: “20ecdcd0-397c-4ede-8940-f3439bf40212”,
            > > > > “name”: “PolicyB”
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
    
      -  ` ordering_fields ` *= ('name', 'modified')* 
    
    <!-- end list -->
    
      -  ` permission_classes ` *= (\<class
        'management.permissions.policy\_access.PolicyAccessPermission'\>,)*
        
    
    <!-- end list -->
    
      -  ` queryset ` 
    
    <!-- end list -->
    
      -  ` retrieve `  (  * request * , * \*   args * , * \*\*   kwargs
        *  )  [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.retrieve)
          
        Get a policy.
        
        @api {get} /api/v1/policies/:uuid Get a policy @apiName
        getPolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription Get
        a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Policy unique identifier.
        
        @apiSuccess {String} uuid Policy unique identifier @apiSuccess
        {String} name Policy name @apiSuccessExample {json}
        Success-Response:
        
        > HTTP/1.1 200 OK {
        > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “PolicyA”, “group”: {
        > > 
        > > > “name”: “GroupA”, “uuid”:
        > > > “57e60f90-8c0c-4bd1-87a0-2143759aae1c”
        > > 
        > > }, “roles”: \[
        > > 
        > > >   -  {   
        > > >     “name”: “RoleA”, “uuid”:
        > > >     “4df211e0-2d88-49a4-8802-728630224d15”
        > > > 
        > > > }
        > > 
        > > \]
        > 
        > }
    
    <!-- end list -->
    
      -  ` suffix ` *= None* 
    
    <!-- end list -->
    
      -  ` update `  (  * request * , * \*   args * , * \*\*   kwargs * 
        )  [ \[source\]
        ](../../_modules/management/policy/view/#PolicyViewSet.update)
          
        Update a policy.
        
        @api {post} /api/v1/policies/:uuid Update a policy @apiName
        updatePolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription
        Update a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Policy unique identifier
        
        @apiParam (Request Body) {String} name Policy name @apiParam
        (Request Body) {String} group UUID of group @apiParam (Request
        Body) {Array} roles Array of role UUIDs @apiParamExample {json}
        Request Body:
        
        >   -  {   
        >     “name”: “PolicyA” “group”:
        >     “59e60f90-8c0c-4bd1-87a0-2143759aae1c”, “roles”: \[
        >     
        >     > “4df211e0-2d88-49a4-8802-728630224d15”
        >     
        >     \]
        > 
        > }
        
        @apiSuccess {String} uuid Policy unique identifier @apiSuccess
        {String} name Policy name @apiSuccessExample {json}
        Success-Response:
        
        > HTTP/1.1 200 OK {
        > 
        > > “uuid”: “16fd2706-8baf-433b-82eb-8c7fada847da”, “name”:
        > > “PolicyA”, “group”: {
        > > 
        > > > “name”: “GroupC”, “uuid”:
        > > > “59e60f90-8c0c-4bd1-87a0-2143759aae1c”
        > > 
        > > }, “roles”: \[
        > > 
        > > >   -  {   
        > > >     “name”: “RoleA”, “uuid”:
        > > >     “4df211e0-2d88-49a4-8802-728630224d15”
        > > > 
        > > > }
        > > 
        > > \]
        > 
        > }

## Module contents

### [Table of Contents](../../index/)

  - [management.policy package](#)
      - [Submodules](#submodules)
      - [management.policy.model
        module](#module-management.policy.model)
      - [management.policy.serializer
        module](#module-management.policy.serializer)
      - [management.policy.view module](#module-management.policy.view)
      - [Module contents](#module-management.policy)

### This Page

  - [Show Source](../../_sources/rbac/management.policy.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.