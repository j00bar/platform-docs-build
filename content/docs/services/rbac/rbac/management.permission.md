---
date: 2020-08-30 16:01:49.412984
title: management.permission package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Submodules

## management.permission.model module

Model for permission management.

  -  *class* ` management.permission.model. ` ` Permission `  (  * \*  
    args * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/permission/model/#Permission)   
    Bases: ` django.db.models.base.Model `
    
    A Permission.
    
      -  *exception* ` DoesNotExist `   
        Bases: ` django.core.exceptions.ObjectDoesNotExist `
    
    <!-- end list -->
    
      -  *exception* ` MultipleObjectsReturned `   
        Bases: ` django.core.exceptions.MultipleObjectsReturned `
    
    <!-- end list -->
    
      -  ` application `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` id `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` objects ` *= \<django.db.models.manager.Manager object\>* 
    
    <!-- end list -->
    
      -  ` permission `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` resource_type `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.
    
    <!-- end list -->
    
      -  ` save `  (  * \*   args * , * \*\*   kwargs *  )  [ \[source\]
        ](../../_modules/management/permission/model/#Permission.save)
          
        Populate the application, resource\_type and verb field before
        saving.
    
    <!-- end list -->
    
      -  ` verb `   
        A wrapper for a deferred-loading field. When the value is read
        from this object the first time, the query is executed.

## management.permission.serializer module

Serializer for permission management.

  -  *class* ` management.permission.serializer. ` `
    PermissionSerializer `  (  *instance=None* , *data=\<class
    'rest\_framework.fields.empty'\>* , *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/management/permission/serializer/#PermissionSerializer)
      
    Bases: ` rest_framework.serializers.ModelSerializer `
    
    Serializer for the Permission model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/management/permission/serializer/#PermissionSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= ('application', 'resource\_type', 'verb',
            'permission')* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` management.permission.model.Permission
            `](#management.permission.model.Permission "management.permission.model.Permission")

## management.permission.view module

View for permission management.

  -  *class* ` management.permission.view. ` ` PermissionFilter `  (  *
    data   =   None * , * queryset   =   None * , * \* * , * request   =
      None * , * prefix   =   None *  )  [ \[source\]
    ](../../_modules/management/permission/view/#PermissionFilter)   
    Bases: [` management.filters.CommonFilters
    `](../management/#management.filters.CommonFilters "management.filters.CommonFilters")
    
    Filter for role.
    
      -  ` base_filters ` *= {'application':
        \<django\_filters.filters.CharFilter object\>, 'permission':
        \<django\_filters.filters.CharFilter object\>, 'resource\_type':
        \<django\_filters.filters.CharFilter object\>, 'verb':
        \<django\_filters.filters.CharFilter object\>}* 
    
    <!-- end list -->
    
      -  ` declared_filters ` *= {'application':
        \<django\_filters.filters.CharFilter object\>, 'permission':
        \<django\_filters.filters.CharFilter object\>, 'resource\_type':
        \<django\_filters.filters.CharFilter object\>, 'verb':
        \<django\_filters.filters.CharFilter object\>}* 

<!-- end list -->

  -  *class* ` management.permission.view. ` ` PermissionViewSet `  (  *
    \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/permission/view/#PermissionViewSet)   
    Bases: ` rest_framework.mixins.ListModelMixin ` , `
    rest_framework.viewsets.GenericViewSet `
    
    Permission View.
    
    A viewset that provides the default list() action.
    
      -  ` basename ` *= None* 
    
    <!-- end list -->
    
      -  ` description ` *= None* 
    
    <!-- end list -->
    
      -  ` detail ` *= None* 
    
    <!-- end list -->
    
      -  ` filter_backends ` *= (\<class
        'django\_filters.rest\_framework.backends.DjangoFilterBackend'\>,
        \<class 'rest\_framework.filters.OrderingFilter'\>)* 
    
    <!-- end list -->
    
      -  ` filterset_class `   
        alias of [` PermissionFilter
        `](#management.permission.view.PermissionFilter "management.permission.view.PermissionFilter")
    
    <!-- end list -->
    
      -  ` list `  (  * request * , * \*   args * , * \*\*   kwargs *  )
         [ \[source\]
        ](../../_modules/management/permission/view/#PermissionViewSet.list)
          
        Obtain the list of permissions for the tenant.
        
        @api {get} /api/v1/permissions/ Obtain a list of permissions
        @apiName getPermissions @apiGroup Permission @apiVersion 1.0.0
        @apiDescription Obtain a list of permissions
        
        @apiHeader {String} token User authorization token
        
        @apiParam (Query) {String} application Filter by permission
        name. @apiParam (Query) {String} resource\_type Filter by
        permission name. @apiParam (Query) {String} verb Filter by
        permission name. @apiParam (Query) {Number} offset Parameter for
        selecting the start of data (default is 0). @apiParam (Query)
        {Number} limit Parameter for selecting the amount of data
        (default is 10).
        
        @apiSuccess {Object} meta The metadata for pagination.
        @apiSuccess {Object} links The object containing links of
        results. @apiSuccess {Object\[\]} data The array of results.
        
          -  @apiSuccessExample {json} Success-Response:   
            HTTP/1.1 200 OK
        
        <!-- end list -->
        
          -  { 
            
              -  “meta”: {   
                “count”: 2
            
            }, “links”: {
            
            > “first”: “/api/v1/permissions/?offset=0\&limit=10”,
            > “next”: null, “previous”: null, “last”:
            > “/api/v1/permissions/?offset=0\&limit=10”
            
            }, “data”: \[
            
            >   -  {   
            >     “application”: “rbac”, “resource\_type”: “\*”, “verb”:
            >     “read”, “permission”: “rbac: [ \* ](#id1) :read”
            > 
            > }
            
            \]
        
        }
    
    <!-- end list -->
    
      -  ` name ` *= None* 
    
    <!-- end list -->
    
      -  ` ordering ` *= ('application',)* 
    
    <!-- end list -->
    
      -  ` ordering_fields ` *= ('application', 'resource\_type',
        'verb', 'permission')* 
    
    <!-- end list -->
    
      -  ` permission_classes ` *= (\<class
        'management.permissions.admin\_access.AdminAccessPermission'\>,)*
        
    
    <!-- end list -->
    
      -  ` queryset ` 
    
    <!-- end list -->
    
      -  ` serializer_class `   
        alias of [`
        management.permission.serializer.PermissionSerializer
        `](#management.permission.serializer.PermissionSerializer "management.permission.serializer.PermissionSerializer")
    
    <!-- end list -->
    
      -  ` suffix ` *= None* 

## Module contents

### [Table of Contents](../../index/)

  - [management.permission package](#)
      - [Submodules](#submodules)
      - [management.permission.model
        module](#module-management.permission.model)
      - [management.permission.serializer
        module](#module-management.permission.serializer)
      - [management.permission.view
        module](#module-management.permission.view)
      - [Module contents](#module-management.permission)

### This Page

  - [Show Source](../../_sources/rbac/management.permission.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.