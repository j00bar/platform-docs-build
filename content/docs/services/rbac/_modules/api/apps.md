---
date: 2020-07-27 10:12:27.228111
title: Source code for api.apps
---

<div class="highlight">

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
    """API application configuration module."""
    
    import logging
    
    from django.apps import AppConfig
    
    
    logger = logging.getLogger(__name__)  # pylint: disable=invalid-name
    
    
    [docs]class ApiConfig(AppConfig):
        """API application configuration."""
    
        name = "api"

</div>