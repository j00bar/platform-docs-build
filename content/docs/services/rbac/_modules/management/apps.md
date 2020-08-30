---
date: 2020-08-30 16:01:49.412984
title: Source code for management.apps
---
### Navigation

  - [index](../../../genindex/ "General Index")
  - [modules](../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../index/) »
  - [Module code](../../index/) »


    #
    # Copyright 2019 Red Hat, Inc.
    #
    #    This program is free software: you can redistribute it and/or modify
    #    it under the terms of the GNU Affero General Public License as
    #    published by the Free Software Foundation, either version 3 of the
    #    License, or (at your option) any later version.
    #
    #    This program is distributed in the hope that it will be useful,
    #    but WITHOUT ANY WARRANTY; without even the implied warranty of
    #    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    #    GNU Affero General Public License for more details.
    #
    #    You should have received a copy of the GNU Affero General Public License
    #    along with this program.  If not, see <https://www.gnu.org/licenses/>.
    #
    """Management application configuration module."""
    import logging
    import sys
    
    from django.apps import AppConfig
    from django.db.utils import OperationalError, ProgrammingError
    from management.seeds import group_seeding, permission_seeding, role_seeding
    
    from rbac.settings import GROUP_SEEDING_ENABLED, PERMISSION_SEEDING_ENABLED, ROLE_SEEDING_ENABLED
    
    logger = logging.getLogger(__name__)  # pylint: disable=invalid-name
    
    
    [docs]class ManagementConfig(AppConfig):
        """Management application configuration."""
    
        name = "management"
    
    [docs]    def ready(self):
            """Determine if app is ready on application startup."""
            # Don't run on Django tab completion commands
            if "manage.py" in sys.argv[0] and "runserver" not in sys.argv:
                return
            try:
                if PERMISSION_SEEDING_ENABLED:
                    permission_seeding()
                if ROLE_SEEDING_ENABLED:
                    role_seeding()
                if GROUP_SEEDING_ENABLED:
                    group_seeding()
            except (OperationalError, ProgrammingError) as op_error:
                if "no such table" in str(op_error) or "does not exist" in str(op_error):
                    # skip this if we haven't created tables yet.
                    return
                else:
                    logger.error("Error: %s.", op_error)

### Quick search

### Navigation

  - [index](../../../genindex/ "General Index")
  - [modules](../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../index/) »
  - [Module code](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.