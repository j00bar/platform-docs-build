---
date: 2020-07-27 13:41:13.974494
title: management.policy package
---
<div id="management-policy-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.policy.model" class="section">

<span id="management-policy-model-module"> </span>

## management.policy.model module

Model for policy management.

  - *class* `  management.policy.model.  ` `  Policy  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/policy/model/#Policy)  
    Bases: `  django.db.models.base.Model  `
    
    A policy.
    
      - *exception* `  DoesNotExist  `  
        Bases: `  django.core.exceptions.ObjectDoesNotExist  `
    
    <!-- end list -->
    
      - *exception* `  MultipleObjectsReturned  `  
        Bases: `  django.core.exceptions.MultipleObjectsReturned  `
    
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
    
      - `  group  `  
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
    
      - `  group_id  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
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
    
      - `  roles  `  
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
    
      - `  system  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  uuid  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  - `  management.policy.model.  ` `  policy_changed_cache_handler  `
    <span class="sig-paren"> ( </span> *<span class="n"> sender </span>
    <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> instance </span> <span class="o"> =
    </span> <span class="default_value"> None </span>* ,
    *<span class="n"> using </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="o"> \*\*
    </span> <span class="n"> kwargs </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/policy/model/#policy_changed_cache_handler)  
    Signal handler for Principal cache expiry on Policy deletion.

<!-- end list -->

  - `  management.policy.model.  ` `  policy_to_roles_cache_handler  `
    <span class="sig-paren"> ( </span> *<span class="n"> sender </span>
    <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> instance </span> <span class="o"> =
    </span> <span class="default_value"> None </span>* ,
    *<span class="n"> action </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="n">
    reverse </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="n"> model
    </span> <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> pk\_set </span> <span class="o"> =
    </span> <span class="default_value"> None </span>* ,
    *<span class="n"> using </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="o"> \*\*
    </span> <span class="n"> kwargs </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/policy/model/#policy_to_roles_cache_handler)  
    Signal handler for Principal cache expiry on Policy/Role m2m change.

</div>

<div id="module-management.policy.serializer" class="section">

<span id="management-policy-serializer-module"> </span>

## management.policy.serializer module

Serializer for policy management.

  - *class* `  management.policy.serializer.  ` `  PolicyInputSerializer
     ` <span class="sig-paren"> ( </span> *instance=None* ,
    *data=\<class 'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/policy/serializer/#PolicyInputSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the policy model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/serializer/#PolicyInputSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description', 'group',
            'roles', 'created', 'modified')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.policy.model.Policy
             `](#management.policy.model.Policy "management.policy.model.Policy")
    
    <!-- end list -->
    
      - `  create  ` <span class="sig-paren"> ( </span>
        *<span class="n"> validated\_data </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/policy/serializer/#PolicyInputSerializer.create)  
        Create the policy object in the database.
    
    <!-- end list -->
    
      - `  to_representation  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/serializer/#PolicyInputSerializer.to_representation)  
        Convert representation to dictionary object.
    
    <!-- end list -->
    
      - `  update  ` <span class="sig-paren"> ( </span>
        *<span class="n"> instance </span>* , *<span class="n">
        validated\_data </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/serializer/#PolicyInputSerializer.update)  
        Update the policy object in the database.

<!-- end list -->

  - *class* `  management.policy.serializer.  ` `  PolicySerializer  `
    <span class="sig-paren"> ( </span> *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/policy/serializer/#PolicySerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the policy model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/serializer/#PolicySerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description', 'group',
            'roles', 'created', 'modified')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.policy.model.Policy
             `](#management.policy.model.Policy "management.policy.model.Policy")
    
    <!-- end list -->
    
      - `  to_representation  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/serializer/#PolicySerializer.to_representation)  
        Convert representation to dictionary object.

<!-- end list -->

  - *class* `  management.policy.serializer.  ` `  UUIDListField  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/policy/serializer/#UUIDListField)  
    Bases: `  rest_framework.fields.ListField  `
    
    List of UUID Fields.
    
      - `  child  ` *= UUIDField()*

</div>

<div id="module-management.policy.view" class="section">

<span id="management-policy-view-module"> </span>

## management.policy.view module

View for policy management.

  - *class* `  management.policy.view.  ` `  PolicyFilter  `
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
    </span>](../../_modules/management/policy/view/#PolicyFilter)  
    Bases: `  django_filters.rest_framework.filterset.FilterSet  `
    
    Filter for policy.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/view/#PolicyFilter.Meta)  
        Bases: `  object  `
        
          - `  fields  ` *= \['name', 'group\_name', 'group\_uuid'\]*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.policy.model.Policy
             `](#management.policy.model.Policy "management.policy.model.Policy")
    
    <!-- end list -->
    
      - `  base_filters  ` *= {'group\_name':
        \<django\_filters.filters.CharFilter object\>, 'group\_uuid':
        \<django\_filters.filters.UUIDFilter object\>, 'name':
        \<django\_filters.filters.CharFilter object\>}*
    
    <!-- end list -->
    
      - `  declared_filters  ` *= {'group\_name':
        \<django\_filters.filters.CharFilter object\>, 'group\_uuid':
        \<django\_filters.filters.UUIDFilter object\>, 'name':
        \<django\_filters.filters.CharFilter object\>}*

<!-- end list -->

  - *class* `  management.policy.view.  ` `  PolicyViewSet  `
    <span class="sig-paren"> ( </span> *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/policy/view/#PolicyViewSet)  
    Bases: `  rest_framework.mixins.CreateModelMixin  ` , ` 
    rest_framework.mixins.DestroyModelMixin  ` , ` 
    rest_framework.mixins.ListModelMixin  ` , ` 
    rest_framework.mixins.RetrieveModelMixin  ` , ` 
    rest_framework.mixins.UpdateModelMixin  ` , ` 
    rest_framework.viewsets.GenericViewSet  `
    
    Policy View.
    
    A viewset that provides default create() , destroy , retrieve() ,
    and list() actions.
    
      - `  basename  ` *= None*
    
    <!-- end list -->
    
      - `  create  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/policy/view/#PolicyViewSet.create)  
        Create a policy.
        
        @api {post} /api/v1/policies/ Create a policy @apiName
        createPolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription
        Create a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Request Body) {String} name Policy name @apiParam
        (Request Body) {String} group UUID of group @apiParam (Request
        Body) {Array} roles Array of role UUIDs @apiParamExample {json}
        Request Body:
        
        > 
        > 
        > <div>
        > 
        >   - {  
        >     “name”: “PolicyA” “group”:
        >     “57e60f90-8c0c-4bd1-87a0-2143759aae1c”, “roles”: \[
        >     
        >     > 
        >     > 
        >     > <div>
        >     > 
        >     > “4df211e0-2d88-49a4-8802-728630224d15”
        >     > 
        >     > </div>
        >     
        >     \]
        > 
        > }
        > 
        > </div>
        
        @apiSuccess {String} uuid Policy unique identifier @apiSuccess
        {String} name Policy name @apiSuccessExample {json}
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
        > > “PolicyA”, “group”: {
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > “name”: “GroupA”, “uuid”:
        > > > “57e60f90-8c0c-4bd1-87a0-2143759aae1c”
        > > > 
        > > > </div>
        > > 
        > > }, “roles”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > >   - {  
        > > >     “name”: “RoleA”, “uuid”:
        > > >     “4df211e0-2d88-49a4-8802-728630224d15”
        > > > 
        > > > }
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
        </span>](../../_modules/management/policy/view/#PolicyViewSet.destroy)  
        Delete a policy.
        
        @api {delete} /api/v1/policies/:uuid Delete a policy @apiName
        deletePolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription
        Delete a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} uuid Policy unique identifier
        
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
        alias of [`  PolicyFilter
         `](#management.policy.view.PolicyFilter "management.policy.view.PolicyFilter")
    
    <!-- end list -->
    
      - `  get_queryset  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/policy/view/#PolicyViewSet.get_queryset)  
        Obtain queryset for requesting user based on access.
    
    <!-- end list -->
    
      - `  get_serializer_class  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/policy/view/#PolicyViewSet.get_serializer_class)  
        Get serializer based on route.
    
    <!-- end list -->
    
      - `  list  ` <span class="sig-paren"> ( </span> *<span class="n">
        request </span>* , *<span class="o"> \* </span> <span class="n">
        args </span>* , *<span class="o"> \*\* </span> <span class="n">
        kwargs </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/policy/view/#PolicyViewSet.list)  
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
            > > ‘first’: /api/v1/policies/?offset=0\&limit=10, ‘next’:
            > > None, ‘previous’: None, ‘last’:
            > > /api/v1/policies/?offset=0\&limit=10
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
            > > >     “name”: “PolicyA”
            > > > 
            > > > }, {
            > > > 
            > > > > 
            > > > > 
            > > > > <div>
            > > > > 
            > > > > “uuid”: “20ecdcd0-397c-4ede-8940-f3439bf40212”,
            > > > > “name”: “PolicyB”
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
    
      - `  ordering_fields  ` *= ('name', 'modified')*
    
    <!-- end list -->
    
      - `  permission_classes  ` *= (\<class
        'management.permissions.policy\_access.PolicyAccessPermission'\>,)*
    
    <!-- end list -->
    
      - `  queryset  `
    
    <!-- end list -->
    
      - `  retrieve  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/policy/view/#PolicyViewSet.retrieve)  
        Get a policy.
        
        @api {get} /api/v1/policies/:uuid Get a policy @apiName
        getPolicy @apiGroup Policy @apiVersion 1.0.0 @apiDescription Get
        a policy
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Policy unique identifier.
        
        @apiSuccess {String} uuid Policy unique identifier @apiSuccess
        {String} name Policy name @apiSuccessExample {json}
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
        > > “PolicyA”, “group”: {
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > “name”: “GroupA”, “uuid”:
        > > > “57e60f90-8c0c-4bd1-87a0-2143759aae1c”
        > > > 
        > > > </div>
        > > 
        > > }, “roles”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > >   - {  
        > > >     “name”: “RoleA”, “uuid”:
        > > >     “4df211e0-2d88-49a4-8802-728630224d15”
        > > > 
        > > > }
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
    
      - `  suffix  ` *= None*
    
    <!-- end list -->
    
      - `  update  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/policy/view/#PolicyViewSet.update)  
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
        
        > 
        > 
        > <div>
        > 
        >   - {  
        >     “name”: “PolicyA” “group”:
        >     “59e60f90-8c0c-4bd1-87a0-2143759aae1c”, “roles”: \[
        >     
        >     > 
        >     > 
        >     > <div>
        >     > 
        >     > “4df211e0-2d88-49a4-8802-728630224d15”
        >     > 
        >     > </div>
        >     
        >     \]
        > 
        > }
        > 
        > </div>
        
        @apiSuccess {String} uuid Policy unique identifier @apiSuccess
        {String} name Policy name @apiSuccessExample {json}
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
        > > “PolicyA”, “group”: {
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > “name”: “GroupC”, “uuid”:
        > > > “59e60f90-8c0c-4bd1-87a0-2143759aae1c”
        > > > 
        > > > </div>
        > > 
        > > }, “roles”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > >   - {  
        > > >     “name”: “RoleA”, “uuid”:
        > > >     “4df211e0-2d88-49a4-8802-728630224d15”
        > > > 
        > > > }
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

</div>

<div id="module-management.policy" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>