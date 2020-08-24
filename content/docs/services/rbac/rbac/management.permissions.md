---
date: 2020-08-24 20:47:50.866547
title: management.permissions package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Submodules

## management.permissions.admin\_access module

Defines the Admin Access Permissions class.

  -  *class* ` management.permissions.admin_access. ` `
    AdminAccessPermission ` [ \[source\]
    ](../../_modules/management/permissions/admin_access/#AdminAccessPermission)
      
    Bases: ` rest_framework.permissions.BasePermission `
    
    Determines if a user is an Account Admin.
    
      -  ` has_permission `  (  * request * , * view *  )  [ \[source\]
        ](../../_modules/management/permissions/admin_access/#AdminAccessPermission.has_permission)
          
        Check permission based on Account Admin property.

## management.permissions.group\_access module

Defines the Group Access Permissions class.

  -  *class* ` management.permissions.group_access. ` `
    GroupAccessPermission ` [ \[source\]
    ](../../_modules/management/permissions/group_access/#GroupAccessPermission)
      
    Bases: ` rest_framework.permissions.BasePermission `
    
    Determines if a user has access to Group APIs.
    
      -  ` has_permission `  (  * request * , * view *  )  [ \[source\]
        ](../../_modules/management/permissions/group_access/#GroupAccessPermission.has_permission)
          
        Check permission based on the defined access.

## management.permissions.policy\_access module

Defines the Policy Access Permissions class.

  -  *class* ` management.permissions.policy_access. ` `
    PolicyAccessPermission ` [ \[source\]
    ](../../_modules/management/permissions/policy_access/#PolicyAccessPermission)
      
    Bases: ` rest_framework.permissions.BasePermission `
    
    Determines if a user has access to Policy APIs.
    
      -  ` has_permission `  (  * request * , * view *  )  [ \[source\]
        ](../../_modules/management/permissions/policy_access/#PolicyAccessPermission.has_permission)
          
        Check permission based on the defined access.

## management.permissions.role\_access module

Defines the Role Access Permissions class.

  -  *class* ` management.permissions.role_access. ` `
    RoleAccessPermission ` [ \[source\]
    ](../../_modules/management/permissions/role_access/#RoleAccessPermission)
      
    Bases: ` rest_framework.permissions.BasePermission `
    
    Determines if a user has access to Role APIs.
    
      -  ` has_permission `  (  * request * , * view *  )  [ \[source\]
        ](../../_modules/management/permissions/role_access/#RoleAccessPermission.has_permission)
          
        Check permission based on the defined access.

## management.permissions.utils module

Defines the Access Permissions Utility Class.

  -  ` management.permissions.utils. ` ` is_scope_principal `  (  *
    request *  )  [ \[source\]
    ](../../_modules/management/permissions/utils/#is_scope_principal)
      
    Check permission based on the defined scope principal query param.

## Module contents

Permissions for import organization.

### [Table of Contents](../../index/)

  - [management.permissions package](#)
      - [Submodules](#submodules)
      - [management.permissions.admin\_access
        module](#module-management.permissions.admin_access)
      - [management.permissions.group\_access
        module](#module-management.permissions.group_access)
      - [management.permissions.policy\_access
        module](#module-management.permissions.policy_access)
      - [management.permissions.role\_access
        module](#module-management.permissions.role_access)
      - [management.permissions.utils
        module](#module-management.permissions.utils)
      - [Module contents](#module-management.permissions)

### This Page

  - [Show Source](../../_sources/rbac/management.permissions.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.