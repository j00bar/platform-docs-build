---
date: 2020-07-27 10:49:00.081213
title: management.permissions package
---
<div id="management-permissions-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-management.permissions.admin_access" class="section">

<span id="management-permissions-admin-access-module"> </span>

## management.permissions.admin\_access module

Defines the Admin Access Permissions class.

  - *class* `  management.permissions.admin_access.  ` ` 
    AdminAccessPermission  ` [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/permissions/admin_access/#AdminAccessPermission)  
    Bases: `  rest_framework.permissions.BasePermission  `
    
    Determines if a user is an Account Admin.
    
      - `  has_permission  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> view
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/permissions/admin_access/#AdminAccessPermission.has_permission)  
        Check permission based on Account Admin property.

</div>

<div id="module-management.permissions.group_access" class="section">

<span id="management-permissions-group-access-module"> </span>

## management.permissions.group\_access module

Defines the Group Access Permissions class.

  - *class* `  management.permissions.group_access.  ` ` 
    GroupAccessPermission  ` [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/permissions/group_access/#GroupAccessPermission)  
    Bases: `  rest_framework.permissions.BasePermission  `
    
    Determines if a user has access to Group APIs.
    
      - `  has_permission  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> view
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/permissions/group_access/#GroupAccessPermission.has_permission)  
        Check permission based on the defined access.

</div>

<div id="module-management.permissions.policy_access" class="section">

<span id="management-permissions-policy-access-module"> </span>

## management.permissions.policy\_access module

Defines the Policy Access Permissions class.

  - *class* `  management.permissions.policy_access.  ` ` 
    PolicyAccessPermission  ` [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/permissions/policy_access/#PolicyAccessPermission)  
    Bases: `  rest_framework.permissions.BasePermission  `
    
    Determines if a user has access to Policy APIs.
    
      - `  has_permission  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> view
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/permissions/policy_access/#PolicyAccessPermission.has_permission)  
        Check permission based on the defined access.

</div>

<div id="module-management.permissions.role_access" class="section">

<span id="management-permissions-role-access-module"> </span>

## management.permissions.role\_access module

Defines the Role Access Permissions class.

  - *class* `  management.permissions.role_access.  ` ` 
    RoleAccessPermission  ` [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/permissions/role_access/#RoleAccessPermission)  
    Bases: `  rest_framework.permissions.BasePermission  `
    
    Determines if a user has access to Role APIs.
    
      - `  has_permission  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> view
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/management/permissions/role_access/#RoleAccessPermission.has_permission)  
        Check permission based on the defined access.

</div>

<div id="module-management.permissions.utils" class="section">

<span id="management-permissions-utils-module"> </span>

## management.permissions.utils module

Defines the Access Permissions Utility Class.

  - `  management.permissions.utils.  ` `  is_scope_principal  `
    <span class="sig-paren"> ( </span> *<span class="n"> request
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/management/permissions/utils/#is_scope_principal)  
    Check permission based on the defined scope principal query param.

</div>

<div id="module-management.permissions" class="section">

<span id="module-contents"> </span>

## Module contents

Permissions for import organization.

</div>

</div>