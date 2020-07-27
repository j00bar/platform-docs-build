---
date: 2020-07-27 10:12:25.639112
title: Source code for management.permissions.admin\_access
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
    """Defines the Admin Access Permissions class."""
    from rest_framework import permissions
    
    from rbac.env import ENVIRONMENT
    
    
    [docs]class AdminAccessPermission(permissions.BasePermission):
        """Determines if a user is an Account Admin."""
    
    [docs]    def has_permission(self, request, view):
            """Check permission based on Account Admin property."""
            if ENVIRONMENT.get_value("ALLOW_ANY", default=False, cast=bool):
                return True
            return request.user.admin

</div>