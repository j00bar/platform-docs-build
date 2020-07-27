---
date: 2020-07-27 13:41:14.258494
title: management.group package
---
<div id="management-group-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.group.definer" class="section">

<span id="management-group-definer-module"> </span>

## management.group.definer module

Handler for system defined group.

  - `  management.group.definer.  ` `  add_roles  `
    <span class="sig-paren"> ( </span> *<span class="n"> group </span>*
    , *<span class="n"> roles\_or\_role\_ids </span>* ,
    *<span class="n"> replace </span> <span class="o"> = </span>
    <span class="default_value"> False </span>* <span class="sig-paren">
    ) </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/group/definer/#add_roles)  
    Process list of roles and add them to the group.

<!-- end list -->

  - `  management.group.definer.  ` `  remove_roles  `
    <span class="sig-paren"> ( </span> *<span class="n"> group </span>*
    , *<span class="n"> role\_ids </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/group/definer/#remove_roles)  
    Process list of roles and remove them from the group.

<!-- end list -->

  - `  management.group.definer.  ` `  seed_group  `
    <span class="sig-paren"> ( </span> *<span class="n"> tenant </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/group/definer/#seed_group)  
    For a tenant create or update default group.

<!-- end list -->

  - `  management.group.definer.  ` `  set_system_flag_post_update  `
    <span class="sig-paren"> ( </span> *<span class="n"> group </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/group/definer/#set_system_flag_post_update)  
    Update system flag on default groups.

</div>

<div id="module-management.group.model" class="section">

<span id="management-group-model-module"> </span>

## management.group.model module

Model for group management.

  - *class* `  management.group.model.  ` `  Group  `
    <span class="sig-paren"> ( </span> *<span class="o"> \* </span>
    <span class="n"> args </span>* , *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/group/model/#Group)  
    Bases: `  django.db.models.base.Model  `
    
    A group.
    
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
    
      - `  platform_default_set  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/model/#Group.platform_default_set)  
        Queryset for platform default group.
    
    <!-- end list -->
    
      - `  policies  `  
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
    
      - `  principals  `  
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
    
      - `  role_count  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/model/#Group.role_count)  
        Role count for a group.
    
    <!-- end list -->
    
      - `  roles  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/model/#Group.roles)  
        Roles for a group.
    
    <!-- end list -->
    
      - `  roles_with_access  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/model/#Group.roles_with_access)  
        Queryset for roles with access data prefetched.
    
    <!-- end list -->
    
      - `  system  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      - `  uuid  `  
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

<!-- end list -->

  - `  management.group.model.  ` `  group_deleted_cache_handler  `
    <span class="sig-paren"> ( </span> *<span class="n"> sender </span>
    <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> instance </span> <span class="o"> =
    </span> <span class="default_value"> None </span>* ,
    *<span class="n"> using </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="o"> \*\*
    </span> <span class="n"> kwargs </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/group/model/#group_deleted_cache_handler)  
    Signal handler to purge principal caches when a Group is deleted.

<!-- end list -->

  - `  management.group.model.  ` `  principals_to_groups_cache_handler
     ` <span class="sig-paren"> ( </span> *<span class="n"> sender
    </span> <span class="o"> = </span> <span class="default_value"> None
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
    </span>](../../_modules/management/group/model/#principals_to_groups_cache_handler)  
    Signal handler to purge caches when Group membership changes.

</div>

<div id="module-management.group.serializer" class="section">

<span id="management-group-serializer-module"> </span>

## management.group.serializer module

Serializer for group management.

  - *class* `  management.group.serializer.  ` `  GroupInputSerializer
     ` <span class="sig-paren"> ( </span> *instance=None* ,
    *data=\<class 'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/group/serializer/#GroupInputSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for Group input model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupInputSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description',
            'principalCount', 'platform\_default', 'roleCount',
            'created', 'modified', 'system')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.group.model.Group
             `](#management.group.model.Group "management.group.model.Group")
    
    <!-- end list -->
    
      - `  get_roleCount  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupInputSerializer.get_roleCount)  
        Role count for the serializer.

<!-- end list -->

  - *class* `  management.group.serializer.  ` ` 
    GroupPrincipalInputSerializer  ` <span class="sig-paren"> ( </span>
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/group/serializer/#GroupPrincipalInputSerializer)  
    Bases: `  rest_framework.serializers.Serializer  `
    
    Serializer for adding principals to a group.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupPrincipalInputSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('principals',)*

<!-- end list -->

  - *class* `  management.group.serializer.  ` `  GroupRoleSerializerIn
     ` <span class="sig-paren"> ( </span> *instance=None* ,
    *data=\<class 'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/group/serializer/#GroupRoleSerializerIn)  
    Bases: `  rest_framework.serializers.Serializer  `
    
    Serializer for managing roles for a group.
    
      - `  to_representation  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupRoleSerializerIn.to_representation)  
        Convert representation to dictionary object.

<!-- end list -->

  - *class* `  management.group.serializer.  ` `  GroupRoleSerializerOut
     ` <span class="sig-paren"> ( </span> *instance=None* ,
    *data=\<class 'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/group/serializer/#GroupRoleSerializerOut)  
    Bases: `  rest_framework.serializers.Serializer  `
    
    Serializer for getting roles for a group.
    
      - `  to_representation  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupRoleSerializerOut.to_representation)  
        Return the collection to be serialized.

<!-- end list -->

  - *class* `  management.group.serializer.  ` `  GroupSerializer  `
    <span class="sig-paren"> ( </span> *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/group/serializer/#GroupSerializer)  
    Bases: `  rest_framework.serializers.ModelSerializer  `
    
    Serializer for the Group model.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupSerializer.Meta)  
        Bases: `  object  `
        
        Metadata for the serializer.
        
          - `  fields  ` *= ('uuid', 'name', 'description',
            'principals', 'platform\_default', 'created', 'modified',
            'roles', 'roleCount', 'system')*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.group.model.Group
             `](#management.group.model.Group "management.group.model.Group")
    
    <!-- end list -->
    
      - `  get_roleCount  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupSerializer.get_roleCount)  
        Role count for the serializer.
    
    <!-- end list -->
    
      - `  get_roles  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupSerializer.get_roles)  
        Role constructor for the serializer.
    
    <!-- end list -->
    
      - `  to_representation  ` <span class="sig-paren"> ( </span>
        *<span class="n"> obj </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/serializer/#GroupSerializer.to_representation)  
        Convert representation to dictionary object.

</div>

<div id="module-management.group.view" class="section">

<span id="management-group-view-module"> </span>

## management.group.view module

View for group management.

  - *class* `  management.group.view.  ` `  GroupFilter  `
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
    </span>](../../_modules/management/group/view/#GroupFilter)  
    Bases: [`  management.filters.CommonFilters
     `](../management/#management.filters.CommonFilters "management.filters.CommonFilters")
    
    Filter for group.
    
      - *class* `  Meta  ` [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupFilter.Meta)  
        Bases: `  object  `
        
          - `  fields  ` *= \['name', 'role\_names', 'uuid'\]*
        
        <!-- end list -->
        
          - `  model  `  
            alias of [`  management.group.model.Group
             `](#management.group.model.Group "management.group.model.Group")
    
    <!-- end list -->
    
      - `  base_filters  ` *= {'name':
        \<django\_filters.filters.CharFilter object\>, 'role\_names':
        \<django\_filters.filters.CharFilter object\>, 'uuid':
        \<django\_filters.filters.CharFilter object\>}*
    
    <!-- end list -->
    
      - `  declared_filters  ` *= {'name':
        \<django\_filters.filters.CharFilter object\>, 'role\_names':
        \<django\_filters.filters.CharFilter object\>, 'uuid':
        \<django\_filters.filters.CharFilter object\>}*
    
    <!-- end list -->
    
      - `  roles_filter  ` <span class="sig-paren"> ( </span>
        *<span class="n"> queryset </span>* , *<span class="n"> field
        </span>* , *<span class="n"> values </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupFilter.roles_filter)  
        Filter for group to lookup list of role name.
    
    <!-- end list -->
    
      - `  uuid_filter  ` <span class="sig-paren"> ( </span>
        *<span class="n"> queryset </span>* , *<span class="n"> field
        </span>* , *<span class="n"> values </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupFilter.uuid_filter)  
        Filter for group uuid lookup.

<!-- end list -->

  - *class* `  management.group.view.  ` `  GroupViewSet  `
    <span class="sig-paren"> ( </span> *<span class="o"> \*\* </span>
    <span class="n"> kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/group/view/#GroupViewSet)  
    Bases: `  rest_framework.mixins.CreateModelMixin  ` , ` 
    rest_framework.mixins.DestroyModelMixin  ` , ` 
    rest_framework.mixins.ListModelMixin  ` , ` 
    rest_framework.mixins.RetrieveModelMixin  ` , ` 
    rest_framework.mixins.UpdateModelMixin  ` , ` 
    rest_framework.viewsets.GenericViewSet  `
    
    Group View.
    
    A viewset that provides default create() , destroy , retrieve() ,
    and list() actions.
    
      - `  add_principals  ` <span class="sig-paren"> ( </span>
        *<span class="n"> group </span>* , *<span class="n"> principals
        </span>* , *<span class="n"> account </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.add_principals)  
        Process list of principals and add them to the group.
    
    <!-- end list -->
    
      - `  basename  ` *= None*
    
    <!-- end list -->
    
      - `  create  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.create)  
        Create a group.
        
        @api {post} /api/v1/groups/ Create a group @apiName createGroup
        @apiGroup Group @apiVersion 1.0.0 @apiDescription Create a Group
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Request Body) {String} name Group name
        @apiParamExample {json} Request Body:
        
        > 
        > 
        > <div>
        > 
        >   - {  
        >     “name”: “GroupA”
        > 
        > }
        > 
        > </div>
        
        @apiSuccess {String} uuid Group unique identifier @apiSuccess
        {String} name Group name @apiSuccessExample {json}
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
        > > “GroupA”, “principals”: \[\]
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
        </span>](../../_modules/management/group/view/#GroupViewSet.destroy)  
        Delete a group.
        
        @api {delete} /api/v1/groups/:uuid Delete a group @apiName
        deleteGroup @apiGroup Group @apiVersion 1.0.0 @apiDescription
        Delete a group
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} uuid Group unique identifier
        
          - @apiSuccessExample {json} Success-Response:  
            HTTP/1.1 204 NO CONTENT
    
    <!-- end list -->
    
      - `  detail  ` *= None*
    
    <!-- end list -->
    
      - `  filter_backends  ` *= (\<class
        'django\_filters.rest\_framework.backends.DjangoFilterBackend'\>,
        \<class 'rest\_framework.filters.OrderingFilter'\>)*
    
    <!-- end list -->
    
      - `  filtered_principals  ` <span class="sig-paren"> ( </span>
        *<span class="n"> group </span>* , *<span class="n"> request
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.filtered_principals)  
        Return filtered principals for group from query params.
    
    <!-- end list -->
    
      - `  filtered_roles  ` <span class="sig-paren"> ( </span>
        *<span class="n"> roles </span>* , *<span class="n"> request
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.filtered_roles)  
        Return filtered roles for group from query params.
    
    <!-- end list -->
    
      - `  filters_from_params  ` <span class="sig-paren"> ( </span>
        *<span class="n"> valid\_filters </span>* , *<span class="n">
        model\_name </span>* , *<span class="n"> request </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.filters_from_params)  
        Build filters from group params.
    
    <!-- end list -->
    
      - `  filterset_class  `  
        alias of [`  GroupFilter
         `](#management.group.view.GroupFilter "management.group.view.GroupFilter")
    
    <!-- end list -->
    
      - `  get_queryset  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.get_queryset)  
        Obtain queryset for requesting user based on access.
    
    <!-- end list -->
    
      - `  get_serializer_class  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.get_serializer_class)  
        Get serializer based on route.
    
    <!-- end list -->
    
      - `  list  ` <span class="sig-paren"> ( </span> *<span class="n">
        request </span>* , *<span class="o"> \* </span> <span class="n">
        args </span>* , *<span class="o"> \*\* </span> <span class="n">
        kwargs </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.list)  
        Obtain the list of groups for the tenant.
        
        @api {get} /api/v1/groups/ Obtain a list of groups @apiName
        getGroups @apiGroup Group @apiVersion 1.0.0 @apiDescription
        Obtain a list of groups
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Query) {String} name Filter by group name. @apiParam
        (Query) {array} uuid Filter by comma separated list of uuids
        @apiParam (Query) {Number} offset Parameter for selecting the
        start of data (default is 0). @apiParam (Query) {Number} limit
        Parameter for selecting the amount of data (default is 10).
        
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
            > > ‘first’: /api/v1/groups/?offset=0\&limit=10, ‘next’:
            > > None, ‘previous’: None, ‘last’:
            > > /api/v1/groups/?offset=0\&limit=10
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
            > > >     “name”: “GroupA”
            > > > 
            > > > }, {
            > > > 
            > > > > 
            > > > > 
            > > > > <div>
            > > > > 
            > > > > “uuid”: “20ecdcd0-397c-4ede-8940-f3439bf40212”,
            > > > > “name”: “GroupB”
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
    
      - `  obtain_roles  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> group
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.obtain_roles)  
        Obtain roles based on request, supports exclusion.
    
    <!-- end list -->
    
      - `  obtain_roles_with_exclusion  ` <span class="sig-paren"> (
        </span> *<span class="n"> request </span>* , *<span class="n">
        group </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.obtain_roles_with_exclusion)  
        Obtain the queryset for roles based on scope.
    
    <!-- end list -->
    
      - `  order_queryset  ` <span class="sig-paren"> ( </span>
        *<span class="n"> queryset </span>* , *<span class="n">
        valid\_fields </span>* , *<span class="n"> order\_field </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.order_queryset)  
        Return queryset ordered according to order\_by query param.
    
    <!-- end list -->
    
      - `  ordering  ` *= ('name',)*
    
    <!-- end list -->
    
      - `  ordering_fields  ` *= ('name', 'modified', 'principalCount',
        'policyCount')*
    
    <!-- end list -->
    
      - `  permission_classes  ` *= (\<class
        'management.permissions.group\_access.GroupAccessPermission'\>,)*
    
    <!-- end list -->
    
      - `  principals  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> uuid
        </span> <span class="o"> = </span> <span class="default_value">
        None </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.principals)  
        Get, add or remove principals from a group.
    
    <!-- end list -->
    
      - `  protect_default_groups  ` <span class="sig-paren"> ( </span>
        *<span class="n"> action </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.protect_default_groups)  
        Deny modifications on platform\_default groups.
    
    <!-- end list -->
    
      - `  proxy  ` *= \<management.principal.proxy.PrincipalProxy
        object\>*
    
    <!-- end list -->
    
      - `  queryset  `
    
    <!-- end list -->
    
      - `  remove_principals  ` <span class="sig-paren"> ( </span>
        *<span class="n"> group </span>* , *<span class="n"> principals
        </span>* , *<span class="n"> account </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.remove_principals)  
        Process list of principals and remove them from the group.
    
    <!-- end list -->
    
      - `  retrieve  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.retrieve)  
        Get a group.
        
        @api {get} /api/v1/groups/:uuid Get a group @apiName getGroup
        @apiGroup Group @apiVersion 1.0.0 @apiDescription Get a group
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Group unique identifier.
        
        @apiSuccess {String} uuid Group unique identifier @apiSuccess
        {String} name Group name @apiSuccess {Array} principals Array of
        principals @apiSuccess {Array} roles Array of roles
        @apiSuccessExample {json} Success-Response:
        
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
        > > “GroupA”, “principals”: \[
        > > 
        > > > 
        > > > 
        > > > <div>
        > > > 
        > > > { “username”: “jsmith” }
        > > > 
        > > > </div>
        > > 
        > > \], “roles”: \[
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
    
      - `  roles  ` <span class="sig-paren"> ( </span> *<span class="n">
        request </span>* , *<span class="n"> uuid </span>
        <span class="o"> = </span> <span class="default_value"> None
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.roles)  
        Get, add or remove roles from a group.
    
    <!-- end list -->
    
      - `  suffix  ` *= None*
    
    <!-- end list -->
    
      - `  update  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="o"> \*
        </span> <span class="n"> args </span>* , *<span class="o"> \*\*
        </span> <span class="n"> kwargs </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/group/view/#GroupViewSet.update)  
        Update a group.
        
        @api {post} /api/v1/groups/:uuid Update a group @apiName
        updateGroup @apiGroup Group @apiVersion 1.0.0 @apiDescription
        Update a group
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Path) {String} id Group unique identifier
        
        @apiSuccess {String} uuid Group unique identifier @apiSuccess
        {String} name Group name @apiSuccessExample {json}
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
        > > “GroupA”
        > > 
        > > </div>
        > 
        > }
        > 
        > </div>

</div>

<div id="module-management.group" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>