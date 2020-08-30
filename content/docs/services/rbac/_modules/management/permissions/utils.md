---
date: 2020-08-30 15:57:27.713836
title: Source code for management.permissions.utils
---
### Navigation

  - [index](../../../../genindex/ "General Index")
  - [modules](../../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../../index/) »
  - [Module code](../../../index/) »


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
    """Defines the Access Permissions Utility Class."""
    
    from rest_framework import permissions
    
    SCOPE_KEY = "scope"
    ACCOUNT_SCOPE = "account"
    PRINCIPAL_SCOPE = "principal"
    VALID_SCOPES = [ACCOUNT_SCOPE, PRINCIPAL_SCOPE]
    
    
    [docs]def is_scope_principal(request):
        """Check permission based on the defined scope principal query param."""
        if request.method not in permissions.SAFE_METHODS:
            return False
    
        scope = request.query_params.get(SCOPE_KEY, ACCOUNT_SCOPE)
        if scope != PRINCIPAL_SCOPE:
            return False
        return True

### Quick search

### Navigation

  - [index](../../../../genindex/ "General Index")
  - [modules](../../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../../index/) »
  - [Module code](../../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.