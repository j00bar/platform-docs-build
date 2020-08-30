---
date: 2020-08-30 16:01:49.412984
title: Managing Resources with Role Based Access Control
weight: 0
---
### Navigation

  - [index](genindex/ "General Index")
  - [modules](py-modindex/ "Python Module Index") |
  - [next](development/ "Development Information")
    |
  - [previous](index/ "Welcome to Insights RBAC service’s documentation!")
    |
  - [Insights-rbac 0.0.1 documentation](index/) »


Users can control access to resources utilizing the Role Based Access
Control (RBAC) service. Only Account administrators can manage RBAC
resources. In order to give users (including administrators) access of
application resource, they must be added to a group. The associated
group must then be granted access by being bound to a role or set of
roles. A role defines access to specific application resources with
defined permissions.

## Managing Principals

A principal is an authenticated user that is a member of the Account.
Principals can be searched and added to groups in order to grant access
to resources as defined by application logic. Only Account
Administrators are allowed to use the principals API.

## Managing Groups

A group is a collection of principals used to grant access to a
resource. A principal can be a member of many groups. A group can be
associated with multiple roles.

### Permissions for Group API access

A user can to view (read) groups. Only administrator can view (read)
groups or create/update (write) groups.

## Managing Roles

A role defines a set of access control lists (ACLs). These ACLs define
permissions and resource definitions.

### Permissions

A permission is a three part object: application, resource type,
operation

Application specifies the specific domain for the resource control, for
example:

    - catalog
    - approval
    - cost-management

Resource type defines the resource to be controlled, for example:

    - aws.account
    - openshift.cluster

Operation defines the application logic action, for example:

    - read
    - write
    - order

### Resource Definitions

If an empty array is supplied for resource definitions then this is
implied to mean all access. However, resource access can be limited by
specifing an attribute filter.

To specify a single resource with an attribute filter you would supply
the following:

    "resourceDefinitions": [
        {
            "attributeFilter": {
                "key": "uuid",
                "operation": "equal",
                "value": "39c8cecd-e595-46fb-8908-13365d59d5e8"
            }
        }
    ]

While you can specify resources individually you can also specify a
multiple resource with an attribute filter as follows:

    "resourceDefinitions": [
        {
            "attributeFilter": {
                "key": "uuid",
                "operation": "in",
                "value": "39c8cecd-e595-46fb-8908-13365d59d5e8,9928e33b-e28f-4e82-b996-12e222f08098"
            }
        }
    ]

### Permissions for Role API access

Only administrator can view (read) roles or create/update (write) roles.
Non-administrator can view (read) roles within their scope with scope
specified in the API call - ` ?scope=principal ` .

### [Table of Contents](index/)

  - [Managing Resources with Role Based Access Control](#)
      - [Managing Principals](#managing-principals)
      - [Managing Groups](#managing-groups)
          - [Permissions for Group API
            access](#permissions-for-group-api-access)
      - [Managing Roles](#managing-roles)
          - [Permissions](#permissions)
          - [Resource Definitions](#resource-definitions)
          - [Permissions for Role API
            access](#permissions-for-role-api-access)

#### Previous topic

[Welcome to Insights RBAC service’s
documentation\!](index/ "previous chapter")

#### Next topic

[Development Information](development/ "next chapter")

### This Page

  - [Show Source](_sources/management.rst.txt)

### Quick search

### Navigation

  - [index](genindex/ "General Index")
  - [modules](py-modindex/ "Python Module Index") |
  - [next](development/ "Development Information")
    |
  - [previous](index/ "Welcome to Insights RBAC service’s documentation!")
    |
  - [Insights-rbac 0.0.1 documentation](index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.