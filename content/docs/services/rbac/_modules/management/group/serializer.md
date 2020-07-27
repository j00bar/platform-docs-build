---
date: 2020-07-27 10:48:57.890210
title: Source code for management.group.serializer
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
    
    """Serializer for group management."""
    from management.group.model import Group
    from management.principal.proxy import PrincipalProxy
    from management.principal.serializer import PrincipalInputSerializer, PrincipalSerializer
    from management.role.serializer import RoleMinimumSerializer
    from rest_framework import serializers, status
    from rest_framework.validators import UniqueValidator
    
    
    [docs]class GroupInputSerializer(serializers.ModelSerializer):
        """Serializer for Group input model."""
    
        uuid = serializers.UUIDField(read_only=True)
        name = serializers.CharField(
            required=True, max_length=150, validators=[UniqueValidator(queryset=Group.objects.all())]
        )
        description = serializers.CharField(allow_null=True, required=False)
        principalCount = serializers.IntegerField(read_only=True)
        platform_default = serializers.BooleanField(read_only=True)
        system = serializers.BooleanField(read_only=True)
        roleCount = serializers.SerializerMethodField()
        created = serializers.DateTimeField(read_only=True)
        modified = serializers.DateTimeField(read_only=True)
    
    [docs]    def get_roleCount(self, obj):
            """Role count for the serializer."""
            return obj.role_count()
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Group
            fields = (
                "uuid",
                "name",
                "description",
                "principalCount",
                "platform_default",
                "roleCount",
                "created",
                "modified",
                "system",
            )
    
    
    [docs]class GroupSerializer(serializers.ModelSerializer):
        """Serializer for the Group model."""
    
        uuid = serializers.UUIDField(read_only=True)
        name = serializers.CharField(required=True, max_length=150)
        description = serializers.CharField(allow_null=True, required=False)
        principals = PrincipalSerializer(read_only=True, many=True)
        platform_default = serializers.BooleanField(read_only=True)
        system = serializers.BooleanField(read_only=True)
        roles = serializers.SerializerMethodField()
        roleCount = serializers.SerializerMethodField()
        created = serializers.DateTimeField(read_only=True)
        modified = serializers.DateTimeField(read_only=True)
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Group
            fields = (
                "uuid",
                "name",
                "description",
                "principals",
                "platform_default",
                "created",
                "modified",
                "roles",
                "roleCount",
                "system",
            )
    
    [docs]    def to_representation(self, obj):
            """Convert representation to dictionary object."""
            proxy = PrincipalProxy()
            formatted = super().to_representation(obj)
            principals = formatted.pop("principals")
            users = [principal.get("username") for principal in principals]
            resp = proxy.request_filtered_principals(users, limit=len(users))
            if resp.get("status_code") == status.HTTP_200_OK:
                principals = resp.get("data")
            formatted["principals"] = principals
            return formatted
    
    [docs]    def get_roleCount(self, obj):
            """Role count for the serializer."""
            return obj.role_count()
    
    [docs]    def get_roles(self, obj):
            """Role constructor for the serializer."""
            serialized_roles = [RoleMinimumSerializer(role).data for role in obj.roles_with_access()]
            return serialized_roles
    
    
    [docs]class GroupPrincipalInputSerializer(serializers.Serializer):
        """Serializer for adding principals to a group."""
    
        principals = PrincipalInputSerializer(many=True)
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            fields = ("principals",)
    
    
    [docs]class GroupRoleSerializerOut(serializers.Serializer):
        """Serializer for getting roles for a group."""
    
    [docs]    def to_representation(self, obj):
            """Return the collection to be serialized."""
            return obj
    
    
    [docs]class GroupRoleSerializerIn(serializers.Serializer):
        """Serializer for managing roles for a group."""
    
        roles = serializers.ListField(child=serializers.UUIDField())
    
    [docs]    def to_representation(self, obj):
            """Convert representation to dictionary object."""
            serialized_roles = [RoleMinimumSerializer(role).data for role in obj.roles_with_access()]
            return {"data": serialized_roles}

</div>