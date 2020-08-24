---
date: 2020-08-24 20:47:50.866547
title: Source code for management.rbac\_fields
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
    
    """Module for specialized fields used by RBAC."""
    from django.db import models
    from django.utils import timezone
    
    
    [docs]class AutoDateTimeField(models.DateTimeField):
        """Class that defines is pre_save value."""
    
    [docs]    def pre_save(self, model_instance, add):
            """Save its time as now."""
            return timezone.now()

### Quick search

### Navigation

  - [index](../../../genindex/ "General Index")
  - [modules](../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../index/) »
  - [Module code](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.