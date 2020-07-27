---
date: 2020-07-27 10:12:28.727110
title: management package
---
<div id="management-package" class="section">


<div id="subpackages" class="section">

## Subpackages

<div class="toctree-wrapper compound">

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

</div>

</div>

<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.apps" class="section">

<span id="management-apps-module"> </span>

## management.apps module

Management application configuration module.

  - *class* `  management.apps.  ` `  ManagementConfig  `
    <span class="sig-paren"> ( </span> *<span class="n"> app\_name
    </span>* , *<span class="n"> app\_module </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/apps/#ManagementConfig)  
    Bases: `  django.apps.config.AppConfig  `
    
    Management application configuration.
    
      - `  name  ` *= 'management'*
    
    <!-- end list -->
    
      - `  ready  ` <span class="sig-paren"> ( </span>
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/apps/#ManagementConfig.ready)  
        Determine if app is ready on application startup.

</div>

<div id="module-management.cache" class="section">

<span id="management-cache-module"> </span>

## management.cache module

Redis-based caching of per-Principal per-app access policy.

  - *class* `  management.cache.  ` `  AccessCache  `
    <span class="sig-paren"> ( </span> *<span class="n"> tenant </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\] </span>](../../_modules/management/cache/#AccessCache)  
    Bases: `  object  `
    
    Redis-based caching of per-Principal per-app access policy.
    
      - *property* `  connection  `  
        Get Redis connection from the pool.
    
    <!-- end list -->
    
      - `  delete_all_policies_for_tenant  ` <span class="sig-paren"> (
        </span> <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/cache/#AccessCache.delete_all_policies_for_tenant)  
        Purge users’ policies for a given tenant from the cache.
    
    <!-- end list -->
    
      - `  delete_handler  ` <span class="sig-paren"> ( </span>
        *<span class="n"> err\_msg </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/cache/#AccessCache.delete_handler)  
        Handle policy delete events.
    
    <!-- end list -->
    
      - `  delete_policy  ` <span class="sig-paren"> ( </span>
        *<span class="n"> uuid </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/cache/#AccessCache.delete_policy)  
        Purge the given user’s policy from the cache.
    
    <!-- end list -->
    
      - `  get_policy  ` <span class="sig-paren"> ( </span>
        *<span class="n"> uuid </span>* , *<span class="n"> application
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/cache/#AccessCache.get_policy)  
        Get the given user’s policy for the given application.
    
    <!-- end list -->
    
      - `  key_for  ` <span class="sig-paren"> ( </span>
        *<span class="n"> uuid </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/cache/#AccessCache.key_for)  
        Redis key for a given user policy.
    
    <!-- end list -->
    
      - `  save_policy  ` <span class="sig-paren"> ( </span>
        *<span class="n"> uuid </span>* , *<span class="n"> application
        </span>* , *<span class="n"> policy </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/cache/#AccessCache.save_policy)  
        Write the policy for a given user for a given app to Redis.

</div>

<div id="module-management.filters" class="section">

<span id="management-filters-module"> </span>

## management.filters module

Filters for RBAC.

  - *class* `  management.filters.  ` `  CommonFilters  `
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
    </span>](../../_modules/management/filters/#CommonFilters)  
    Bases: `  django_filters.rest_framework.filterset.FilterSet  `
    
    Common filters.
    
      - `  base_filters  ` *= {}*
    
    <!-- end list -->
    
      - `  declared_filters  ` *= {}*
    
    <!-- end list -->
    
      - `  name_filter  ` <span class="sig-paren"> ( </span>
        *<span class="n"> queryset </span>* , *<span class="n"> field
        </span>* , *<span class="n"> value </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/management/filters/#CommonFilters.name_filter)  
        Filter to lookup name, partial or exact.

</div>

<div id="module-management.models" class="section">

<span id="management-models-module"> </span>

## management.models module

API models for import organization.

</div>

<div id="module-management.querysets" class="section">

<span id="management-querysets-module"> </span>

## management.querysets module

Queryset helpers for management module.

  - `  management.querysets.  ` `  annotate_roles_with_counts  `
    <span class="sig-paren"> ( </span> *<span class="n"> queryset
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#annotate_roles_with_counts)  
    Annotate the queryset for roles with counts.

<!-- end list -->

  - `  management.querysets.  ` `  get_access_queryset  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#get_access_queryset)  
    Obtain the queryset for policies.

<!-- end list -->

  - `  management.querysets.  ` `  get_annotated_groups  `
    <span class="sig-paren"> ( </span> <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#get_annotated_groups)  
    Return an annotated set of groups for the tenant.

<!-- end list -->

  - `  management.querysets.  ` `  get_group_queryset  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#get_group_queryset)  
    Obtain the queryset for groups.

<!-- end list -->

  - `  management.querysets.  ` `  get_object_principal_queryset  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* , *<span class="n"> scope </span>* , *<span class="n">
    clazz </span>* , *<span class="o"> \*\* </span> <span class="n">
    kwargs </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#get_object_principal_queryset)  
    Get the query set for the specific object for principal scope.

<!-- end list -->

  - `  management.querysets.  ` `  get_policy_queryset  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#get_policy_queryset)  
    Obtain the queryset for policies.

<!-- end list -->

  - `  management.querysets.  ` `  get_role_queryset  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#get_role_queryset)  
    Obtain the queryset for roles.

<!-- end list -->

  - `  management.querysets.  ` `  has_group_all_access  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/querysets/#has_group_all_access)  
    Quick check to determine if a request should have access to all
    groups on a tenant.

</div>

<div id="module-management.rbac_fields" class="section">

<span id="management-rbac-fields-module"> </span>

## management.rbac\_fields module

Module for specialized fields used by RBAC.

  - *class* `  management.rbac_fields.  ` `  AutoDateTimeField  `
    <span class="sig-paren"> ( </span> *<span class="n"> verbose\_name
    </span> <span class="o"> = </span> <span class="default_value"> None
    </span>* , *<span class="n"> name </span> <span class="o"> = </span>
    <span class="default_value"> None </span>* , *<span class="n">
    auto\_now </span> <span class="o"> = </span>
    <span class="default_value"> False </span>* , *<span class="n">
    auto\_now\_add </span> <span class="o"> = </span>
    <span class="default_value"> False </span>* , *<span class="o"> \*\*
    </span> <span class="n"> kwargs </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/rbac_fields/#AutoDateTimeField)  
    Bases: `  django.db.models.fields.DateTimeField  `
    
    Class that defines is pre\_save value.
    
      - `  pre_save  ` <span class="sig-paren"> ( </span>
        *<span class="n"> model\_instance </span>* , *<span class="n">
        add </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/rbac_fields/#AutoDateTimeField.pre_save)  
        Save its time as now.

</div>

<div id="module-management.seeds" class="section">

<span id="management-seeds-module"> </span>

## management.seeds module

Seeds module.

  - `  management.seeds.  ` `  group_seeding  ` <span class="sig-paren">
    ( </span> <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/seeds/#group_seeding)  
    Execute group seeding.

<!-- end list -->

  - `  management.seeds.  ` `  on_complete  ` <span class="sig-paren"> (
    </span> *<span class="n"> completed\_log\_message </span>* ,
    *<span class="n"> tenant </span>* , *<span class="n"> future
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/seeds/#on_complete)  
    Explicitly close the connection for the thread.

<!-- end list -->

  - `  management.seeds.  ` `  permission_seeding  `
    <span class="sig-paren"> ( </span> <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/seeds/#permission_seeding)  
    Execute permission seeding.

<!-- end list -->

  - `  management.seeds.  ` `  role_seeding  ` <span class="sig-paren">
    ( </span> <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/seeds/#role_seeding)  
    Execute role seeding.

<!-- end list -->

  - `  management.seeds.  ` `  run_seeds  ` <span class="sig-paren"> (
    </span> *<span class="n"> seed\_type </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\] </span>](../../_modules/management/seeds/#run_seeds)  
    Update platform objects at startup.

</div>

<div id="module-management.serializers" class="section">

<span id="management-serializers-module"> </span>

## management.serializers module

API models for import organization.

</div>

<div id="module-management.tasks" class="section">

<span id="management-tasks-module"> </span>

## management.tasks module

Celery tasks.

</div>

<div id="module-management.urls" class="section">

<span id="management-urls-module"> </span>

## management.urls module

Describes the urls and patterns for the management application.

</div>

<div id="module-management.utils" class="section">

<span id="management-utils-module"> </span>

## management.utils module

Helper utilities for management module.

  - `  management.utils.  ` `  access_for_principal  `
    <span class="sig-paren"> ( </span> *<span class="n"> principal
    </span>* , *<span class="o"> \*\* </span> <span class="n"> kwargs
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#access_for_principal)  
    Gathers all access for a principal for an application.

<!-- end list -->

  - `  management.utils.  ` `  access_for_roles  `
    <span class="sig-paren"> ( </span> *<span class="n"> roles </span>*
    , *<span class="n"> param\_applications </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/utils/#access_for_roles)  
    Gathers all access for the given roles and application(s).

<!-- end list -->

  - `  management.utils.  ` `  get_principal  ` <span class="sig-paren">
    ( </span> *<span class="n"> username </span>* , *<span class="n">
    account </span>* , *<span class="n"> verify\_principal </span>
    <span class="o"> = </span> <span class="default_value"> True
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#get_principal)  
    Get principals from username.

<!-- end list -->

  - `  management.utils.  ` `  get_principal_from_request  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#get_principal_from_request)  
    Obtain principal from the request object.

<!-- end list -->

  - `  management.utils.  ` `  groups_for_principal  `
    <span class="sig-paren"> ( </span> *<span class="n"> principal
    </span>* , *<span class="o"> \*\* </span> <span class="n"> kwargs
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#groups_for_principal)  
    Gathers all groups for a principal, including the default.

<!-- end list -->

  - `  management.utils.  ` `  policies_for_groups  `
    <span class="sig-paren"> ( </span> *<span class="n"> groups </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/utils/#policies_for_groups)  
    Gathers all policies for the given groups.

<!-- end list -->

  - `  management.utils.  ` `  policies_for_principal  `
    <span class="sig-paren"> ( </span> *<span class="n"> principal
    </span>* , *<span class="o"> \*\* </span> <span class="n"> kwargs
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#policies_for_principal)  
    Gathers all policies for a principal.

<!-- end list -->

  - `  management.utils.  ` `  queryset_by_id  `
    <span class="sig-paren"> ( </span> *<span class="n"> objects
    </span>* , *<span class="n"> clazz </span>* , *<span class="o"> \*\*
    </span> <span class="n"> kwargs </span>* <span class="sig-paren"> )
    </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#queryset_by_id)  
    Return a queryset of from the class ordered by id.

<!-- end list -->

  - `  management.utils.  ` `  roles_for_policies  `
    <span class="sig-paren"> ( </span> *<span class="n"> policies
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#roles_for_policies)  
    Gathers all roles for the given policies.

<!-- end list -->

  - `  management.utils.  ` `  roles_for_principal  `
    <span class="sig-paren"> ( </span> *<span class="n"> principal
    </span>* , *<span class="o"> \*\* </span> <span class="n"> kwargs
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#roles_for_principal)  
    Gathers all roles for a principal.

<!-- end list -->

  - `  management.utils.  ` `  validate_and_get_key  `
    <span class="sig-paren"> ( </span> *<span class="n"> params </span>*
    , *<span class="n"> query\_key </span>* , *<span class="n">
    valid\_values </span>* , *<span class="n"> default\_value </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/management/utils/#validate_and_get_key)  
    Validate the key.

<!-- end list -->

  - `  management.utils.  ` `  validate_psk  ` <span class="sig-paren">
    ( </span> *<span class="n"> psk </span>* , *<span class="n">
    client\_id </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/utils/#validate_psk)  
    Validate the PSK for the client.

</div>

<div id="module-management.views" class="section">

<span id="management-views-module"> </span>

## management.views module

API views for import organization

</div>

<div id="module-management" class="section">

<span id="module-contents"> </span>

## Module contents

</div>

</div>