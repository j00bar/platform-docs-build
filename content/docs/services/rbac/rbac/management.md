---
date: 2020-08-03 17:09:33
title: management package
---

## Subpackages

  - [management.access package](../management.access/)
      - [Submodules](../management.access/#submodules)
      - [management.access.view
        module](../management.access/#module-management.access.view)
      - [Module
        contents](../management.access/#module-management.access)
  - [management.group package](../management.group/)
      - [Submodules](../management.group/#submodules)
      - [management.group.definer
        module](../management.group/#module-management.group.definer)
      - [management.group.model
        module](../management.group/#module-management.group.model)
      - [management.group.serializer
        module](../management.group/#module-management.group.serializer)
      - [management.group.view
        module](../management.group/#module-management.group.view)
      - [Module contents](../management.group/#module-management.group)
  - [management.permission package](../management.permission/)
      - [Submodules](../management.permission/#submodules)
      - [management.permission.model
        module](../management.permission/#module-management.permission.model)
      - [management.permission.serializer
        module](../management.permission/#module-management.permission.serializer)
      - [management.permission.view
        module](../management.permission/#module-management.permission.view)
      - [Module
        contents](../management.permission/#module-management.permission)
  - [management.permissions package](../management.permissions/)
      - [Submodules](../management.permissions/#submodules)
      - [management.permissions.admin\_access
        module](../management.permissions/#module-management.permissions.admin_access)
      - [management.permissions.group\_access
        module](../management.permissions/#module-management.permissions.group_access)
      - [management.permissions.policy\_access
        module](../management.permissions/#module-management.permissions.policy_access)
      - [management.permissions.role\_access
        module](../management.permissions/#module-management.permissions.role_access)
      - [management.permissions.utils
        module](../management.permissions/#module-management.permissions.utils)
      - [Module
        contents](../management.permissions/#module-management.permissions)
  - [management.policy package](../management.policy/)
      - [Submodules](../management.policy/#submodules)
      - [management.policy.model
        module](../management.policy/#module-management.policy.model)
      - [management.policy.serializer
        module](../management.policy/#module-management.policy.serializer)
      - [management.policy.view
        module](../management.policy/#module-management.policy.view)
      - [Module
        contents](../management.policy/#module-management.policy)
  - [management.principal package](../management.principal/)
      - [Submodules](../management.principal/#submodules)
      - [management.principal.cleaner
        module](../management.principal/#module-management.principal.cleaner)
      - [management.principal.model
        module](../management.principal/#module-management.principal.model)
      - [management.principal.proxy
        module](../management.principal/#module-management.principal.proxy)
      - [management.principal.serializer
        module](../management.principal/#module-management.principal.serializer)
      - [management.principal.view
        module](../management.principal/#module-management.principal.view)
      - [Module
        contents](../management.principal/#module-management.principal)
  - [management.role package](../management.role/)
      - [Submodules](../management.role/#submodules)
      - [management.role.definer
        module](../management.role/#module-management.role.definer)
      - [management.role.model
        module](../management.role/#module-management.role.model)
      - [management.role.serializer
        module](../management.role/#module-management.role.serializer)
      - [management.role.view
        module](../management.role/#module-management.role.view)
      - [Module contents](../management.role/#module-management.role)

## Submodules

## management.apps module

Management application configuration module.

  -  *class* ` management.apps. ` ` ManagementConfig `  (  * app\_name *
    , * app\_module *  )  [ \[source\]
    ](../../_modules/management/apps/#ManagementConfig)   
    Bases: ` django.apps.config.AppConfig `
    
    Management application configuration.
    
      -  ` name ` *= 'management'* 
    
    <!-- end list -->
    
      -  ` ready `  (   )  [ \[source\]
        ](../../_modules/management/apps/#ManagementConfig.ready)   
        Determine if app is ready on application startup.

## management.cache module

Redis-based caching of per-Principal per-app access policy.

  -  *class* ` management.cache. ` ` AccessCache `  (  * tenant *  )  [
    \[source\] ](../../_modules/management/cache/#AccessCache)   
    Bases: ` object `
    
    Redis-based caching of per-Principal per-app access policy.
    
      -  *property* ` connection `   
        Get Redis connection from the pool.
    
    <!-- end list -->
    
      -  ` delete_all_policies_for_tenant `  (   )  [ \[source\]
        ](../../_modules/management/cache/#AccessCache.delete_all_policies_for_tenant)
          
        Purge users’ policies for a given tenant from the cache.
    
    <!-- end list -->
    
      -  ` delete_handler `  (  * err\_msg *  )  [ \[source\]
        ](../../_modules/management/cache/#AccessCache.delete_handler)
          
        Handle policy delete events.
    
    <!-- end list -->
    
      -  ` delete_policy `  (  * uuid *  )  [ \[source\]
        ](../../_modules/management/cache/#AccessCache.delete_policy)   
        Purge the given user’s policy from the cache.
    
    <!-- end list -->
    
      -  ` get_policy `  (  * uuid * , * application *  )  [ \[source\]
        ](../../_modules/management/cache/#AccessCache.get_policy)   
        Get the given user’s policy for the given application.
    
    <!-- end list -->
    
      -  ` key_for `  (  * uuid *  )  [ \[source\]
        ](../../_modules/management/cache/#AccessCache.key_for)   
        Redis key for a given user policy.
    
    <!-- end list -->
    
      -  ` save_policy `  (  * uuid * , * application * , * policy *  ) 
        [ \[source\]
        ](../../_modules/management/cache/#AccessCache.save_policy)   
        Write the policy for a given user for a given app to Redis.

## management.filters module

Filters for RBAC.

  -  *class* ` management.filters. ` ` CommonFilters `  (  * data   =  
    None * , * queryset   =   None * , * \* * , * request   =   None * ,
    * prefix   =   None *  )  [ \[source\]
    ](../../_modules/management/filters/#CommonFilters)   
    Bases: ` django_filters.rest_framework.filterset.FilterSet `
    
    Common filters.
    
      -  ` base_filters ` *= {}* 
    
    <!-- end list -->
    
      -  ` declared_filters ` *= {}* 
    
    <!-- end list -->
    
      -  ` name_filter `  (  * queryset * , * field * , * value *  )  [
        \[source\]
        ](../../_modules/management/filters/#CommonFilters.name_filter)
          
        Filter to lookup name, partial or exact.

## management.models module

API models for import organization.

## management.querysets module

Queryset helpers for management module.

  -  ` management.querysets. ` ` annotate_roles_with_counts `  (  *
    queryset *  )  [ \[source\]
    ](../../_modules/management/querysets/#annotate_roles_with_counts)
      
    Annotate the queryset for roles with counts.

<!-- end list -->

  -  ` management.querysets. ` ` get_access_queryset `  (  * request * 
    )  [ \[source\]
    ](../../_modules/management/querysets/#get_access_queryset)   
    Obtain the queryset for policies.

<!-- end list -->

  -  ` management.querysets. ` ` get_annotated_groups `  (   )  [
    \[source\]
    ](../../_modules/management/querysets/#get_annotated_groups)   
    Return an annotated set of groups for the tenant.

<!-- end list -->

  -  ` management.querysets. ` ` get_group_queryset `  (  * request *  )
     [ \[source\]
    ](../../_modules/management/querysets/#get_group_queryset)   
    Obtain the queryset for groups.

<!-- end list -->

  -  ` management.querysets. ` ` get_object_principal_queryset `  (  *
    request * , * scope * , * clazz * , * \*\*   kwargs *  )  [
    \[source\]
    ](../../_modules/management/querysets/#get_object_principal_queryset)
      
    Get the query set for the specific object for principal scope.

<!-- end list -->

  -  ` management.querysets. ` ` get_policy_queryset `  (  * request * 
    )  [ \[source\]
    ](../../_modules/management/querysets/#get_policy_queryset)   
    Obtain the queryset for policies.

<!-- end list -->

  -  ` management.querysets. ` ` get_role_queryset `  (  * request *  ) 
    [ \[source\]
    ](../../_modules/management/querysets/#get_role_queryset)   
    Obtain the queryset for roles.

<!-- end list -->

  -  ` management.querysets. ` ` has_group_all_access `  (  * request * 
    )  [ \[source\]
    ](../../_modules/management/querysets/#has_group_all_access)   
    Quick check to determine if a request should have access to all
    groups on a tenant.

## management.rbac\_fields module

Module for specialized fields used by RBAC.

  -  *class* ` management.rbac_fields. ` ` AutoDateTimeField `  (  *
    verbose\_name   =   None * , * name   =   None * , * auto\_now   =  
    False * , * auto\_now\_add   =   False * , * \*\*   kwargs *  )  [
    \[source\]
    ](../../_modules/management/rbac_fields/#AutoDateTimeField)   
    Bases: ` django.db.models.fields.DateTimeField `
    
    Class that defines is pre\_save value.
    
      -  ` pre_save `  (  * model\_instance * , * add *  )  [ \[source\]
        ](../../_modules/management/rbac_fields/#AutoDateTimeField.pre_save)
          
        Save its time as now.

## management.seeds module

Seeds module.

  -  ` management.seeds. ` ` group_seeding `  (   )  [ \[source\]
    ](../../_modules/management/seeds/#group_seeding)   
    Execute group seeding.

<!-- end list -->

  -  ` management.seeds. ` ` on_complete `  (  * completed\_log\_message
    * , * tenant * , * future *  )  [ \[source\]
    ](../../_modules/management/seeds/#on_complete)   
    Explicitly close the connection for the thread.

<!-- end list -->

  -  ` management.seeds. ` ` permission_seeding `  (   )  [ \[source\]
    ](../../_modules/management/seeds/#permission_seeding)   
    Execute permission seeding.

<!-- end list -->

  -  ` management.seeds. ` ` role_seeding `  (   )  [ \[source\]
    ](../../_modules/management/seeds/#role_seeding)   
    Execute role seeding.

<!-- end list -->

  -  ` management.seeds. ` ` run_seeds `  (  * seed\_type *  )  [
    \[source\] ](../../_modules/management/seeds/#run_seeds)   
    Update platform objects at startup.

## management.serializers module

API models for import organization.

## management.tasks module

Celery tasks.

## management.urls module

Describes the urls and patterns for the management application.

## management.utils module

Helper utilities for management module.

  -  ` management.utils. ` ` access_for_principal `  (  * principal * ,
    * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/utils/#access_for_principal)   
    Gathers all access for a principal for an application.

<!-- end list -->

  -  ` management.utils. ` ` access_for_roles `  (  * roles * , *
    param\_applications *  )  [ \[source\]
    ](../../_modules/management/utils/#access_for_roles)   
    Gathers all access for the given roles and application(s).

<!-- end list -->

  -  ` management.utils. ` ` get_principal `  (  * username * , *
    account * , * verify\_principal   =   True *  )  [ \[source\]
    ](../../_modules/management/utils/#get_principal)   
    Get principals from username.

<!-- end list -->

  -  ` management.utils. ` ` get_principal_from_request `  (  * request
    *  )  [ \[source\]
    ](../../_modules/management/utils/#get_principal_from_request)   
    Obtain principal from the request object.

<!-- end list -->

  -  ` management.utils. ` ` groups_for_principal `  (  * principal * ,
    * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/utils/#groups_for_principal)   
    Gathers all groups for a principal, including the default.

<!-- end list -->

  -  ` management.utils. ` ` policies_for_groups `  (  * groups *  )  [
    \[source\] ](../../_modules/management/utils/#policies_for_groups)
      
    Gathers all policies for the given groups.

<!-- end list -->

  -  ` management.utils. ` ` policies_for_principal `  (  * principal *
    , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/utils/#policies_for_principal)   
    Gathers all policies for a principal.

<!-- end list -->

  -  ` management.utils. ` ` queryset_by_id `  (  * objects * , * clazz
    * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/utils/#queryset_by_id)   
    Return a queryset of from the class ordered by id.

<!-- end list -->

  -  ` management.utils. ` ` roles_for_policies `  (  * policies *  )  [
    \[source\] ](../../_modules/management/utils/#roles_for_policies)   
    Gathers all roles for the given policies.

<!-- end list -->

  -  ` management.utils. ` ` roles_for_principal `  (  * principal * , *
    \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/management/utils/#roles_for_principal)   
    Gathers all roles for a principal.

<!-- end list -->

  -  ` management.utils. ` ` validate_and_get_key `  (  * params * , *
    query\_key * , * valid\_values * , * default\_value *  )  [
    \[source\] ](../../_modules/management/utils/#validate_and_get_key)
      
    Validate the key.

<!-- end list -->

  -  ` management.utils. ` ` validate_psk `  (  * psk * , * client\_id *
     )  [ \[source\] ](../../_modules/management/utils/#validate_psk)   
    Validate the PSK for the client.

## management.views module

API views for import organization

## Module contents