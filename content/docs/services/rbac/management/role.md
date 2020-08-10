---
date: 2020-08-03 13:09:33
title: Managing Roles
---
<div id="managing-roles" class="section">


A role defines a set of access control lists (ACLs). These ACLs define
permissions and resource definitions.

<div id="permissions" class="section">

## Permissions

A permission is a three part object: application, resource type,
operation

Application specifies the specific domain for the resource control, for
example:

<div class="highlight-default notranslate">

<div class="highlight">

    - catalog
    - approval
    - cost-management

</div>

</div>

Resource type defines the resource to be controlled, for example:

<div class="highlight-default notranslate">

<div class="highlight">

    - aws.account
    - openshift.cluster

</div>

</div>

Operation defines the application logic action, for example:

<div class="highlight-default notranslate">

<div class="highlight">

    - read
    - write
    - order

</div>

</div>

</div>

<div id="resource-definitions" class="section">

## Resource Definitions

If an empty array is supplied for resource definitions then this is
implied to mean all access. However, resource access can be limited by
specifing an attribute filter.

To specify a single resource with an attribute filter you would supply
the following:

<div class="highlight-default notranslate">

<div class="highlight">

    "resourceDefinitions": [
        {
            "attributeFilter": {
                "key": "uuid",
                "operation": "equal",
                "value": "39c8cecd-e595-46fb-8908-13365d59d5e8"
            }
        }
    ]

</div>

</div>

While you can specify resources individually you can also specify a
multiple resource with an attribute filter as follows:

<div class="highlight-default notranslate">

<div class="highlight">

    "resourceDefinitions": [
        {
            "attributeFilter": {
                "key": "uuid",
                "operation": "in",
                "value": "39c8cecd-e595-46fb-8908-13365d59d5e8,9928e33b-e28f-4e82-b996-12e222f08098"
            }
        }
    ]

</div>

</div>

</div>

<div id="permissions-for-role-api-access" class="section">

## Permissions for Role API access

Only administrator can view (read) roles or create/update (write) roles.
Non-administrator can view (read) roles within their scope with scope
specified in the API call - `  ?scope=principal  ` .

</div>

</div>