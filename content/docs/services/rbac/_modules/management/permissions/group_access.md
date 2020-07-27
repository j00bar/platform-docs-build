---
date: 2020-07-27 13:43:44.448567
title: Source code for management.permissions.group\_access
---

<div class="highlight">

    #
    # Copyright 2019 Red Hat, Inc.
    #
    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU Affero General Public License as
    # published by the Free Software Foundation, either version 3 of the
    # License, or (at your option) any later version.
    #
    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU Affero General Public License for more details.
    #
    # You should have received a copy of the GNU Affero General Public License
    # along with this program.  If not, see <https://www.gnu.org/licenses/>.
    #
    """Defines the Group Access Permissions class."""
    from django.urls import reverse
    from management.permissions.utils import is_scope_principal
    from rest_framework import permissions
    
    from rbac.env import ENVIRONMENT
    
    
    [docs]class GroupAccessPermission(permissions.BasePermission):
        """Determines if a user has access to Group APIs."""
    
    [docs]    def has_permission(self, request, view):
            """Check permission based on the defined access."""
            if ENVIRONMENT.get_value("ALLOW_ANY", default=False, cast=bool):
                return True
            if request.user.admin:
                return True
            if request.method in permissions.SAFE_METHODS:
                if is_scope_principal(request) or request._request.path == reverse("group-list"):
                    return True
                username = request.query_params.get("username")
                if username:
                    return username == request.user.username
                else:
                    group_read = request.user.access.get("group", {}).get("read", [])
                    if group_read:
                        return True
            else:
                group_write = request.user.access.get("group", {}).get("write", [])
                if group_write:
                    return True
    
            return False

</div>