---
date: 2020-08-03 13:09:33
title: Source code for management.principal.serializer
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
    
    """Serializer for principal management."""
    from rest_framework import serializers
    
    from .model import Principal
    
    
    [docs]class PrincipalSerializer(serializers.ModelSerializer):
        """Serializer for the Principal model."""
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Principal
            fields = ("username",)
    
    
    [docs]class PrincipalInputSerializer(serializers.Serializer):
        """Serializer for the Principal model."""
    
        username = serializers.CharField(required=True, max_length=150)
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            fields = ("username",)

</div>