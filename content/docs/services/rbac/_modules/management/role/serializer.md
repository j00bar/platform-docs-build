---
date: 2020-08-30 16:01:49.412984
title: Source code for management.role.serializer
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
    
    """Serializer for role management."""
    from django.utils.translation import gettext as _
    from management.group.model import Group
    from management.utils import get_principal_from_request
    from rest_framework import serializers
    from rest_framework.validators import UniqueValidator
    
    from .model import Access, ResourceDefinition, Role
    
    
    [docs]class ResourceDefinitionSerializer(serializers.ModelSerializer):
        """Serializer for the ResourceDefinition model."""
    
        attributeFilter = serializers.JSONField()
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = ResourceDefinition
            fields = ("attributeFilter",)
    
    
    [docs]class AccessSerializer(serializers.ModelSerializer):
        """Serializer for the Access model."""
    
        resourceDefinitions = ResourceDefinitionSerializer(many=True)
    
    [docs]    def validate_permission(self, value):
            """Validate the permissions input."""
            split_value = value.split(":")
            split_value_len = len(split_value)
            if split_value_len != 3:
                key = "format"
                message = 'Permission must be of the format "application:resource_type:operation".'
                error = {key: [_(message)]}
                raise serializers.ValidationError(error)
            return value
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Access
            fields = ("resourceDefinitions", "permission")
    
    
    [docs]class RoleSerializer(serializers.ModelSerializer):
        """Serializer for the Role model."""
    
        uuid = serializers.UUIDField(read_only=True)
        name = serializers.CharField(
            required=True, max_length=150, validators=[UniqueValidator(queryset=Role.objects.all())]
        )
        display_name = serializers.CharField(required=False, max_length=150, allow_blank=True)
        description = serializers.CharField(allow_null=True, required=False)
        access = AccessSerializer(many=True)
        policyCount = serializers.IntegerField(read_only=True)
        accessCount = serializers.IntegerField(read_only=True)
        applications = serializers.SerializerMethodField()
        system = serializers.BooleanField(read_only=True)
        platform_default = serializers.BooleanField(read_only=True)
        created = serializers.DateTimeField(read_only=True)
        modified = serializers.DateTimeField(read_only=True)
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Role
            fields = (
                "uuid",
                "name",
                "display_name",
                "description",
                "access",
                "policyCount",
                "accessCount",
                "applications",
                "system",
                "platform_default",
                "created",
                "modified",
            )
    
    [docs]    def get_applications(self, obj):
            """Get the list of applications in the role."""
            return obtain_applications(obj)
    
    [docs]    def create(self, validated_data):
            """Create the role object in the database."""
            name = validated_data.pop("name")
            display_name = validated_data.pop("display_name", name)
            description = validated_data.pop("description", None)
            access_list = validated_data.pop("access")
            role = Role.objects.create(name=name, description=description, display_name=display_name)
            role.save()
            for access_item in access_list:
                resource_def_list = access_item.pop("resourceDefinitions")
                access_obj = Access.objects.create(**access_item, role=role)
                access_obj.save()
                for resource_def_item in resource_def_list:
                    res_def = ResourceDefinition.objects.create(**resource_def_item, access=access_obj)
                    res_def.save()
            return role
    
    [docs]    def update(self, instance, validated_data):
            """Update the role object in the database."""
            if instance.system:
                key = "role.update"
                message = "System roles may not be updated."
                error = {key: [_(message)]}
                raise serializers.ValidationError(error)
            access_list = validated_data.pop("access")
            instance.name = validated_data.get("name", instance.name)
            instance.display_name = validated_data.get("display_name", instance.display_name)
            instance.description = validated_data.get("description", instance.description)
            instance.save()
            instance.access.all().delete()
    
            for access_item in access_list:
                resource_def_list = access_item.pop("resourceDefinitions")
                access_obj = Access.objects.create(**access_item, role=instance)
                access_obj.save()
                for resource_def_item in resource_def_list:
                    res_def = ResourceDefinition.objects.create(**resource_def_item, access=access_obj)
                    res_def.save()
    
            instance.save()
            return instance
    
    
    [docs]class RoleMinimumSerializer(serializers.ModelSerializer):
        """Serializer for the Role model that doesn't return access info."""
    
        uuid = serializers.UUIDField(read_only=True)
        name = serializers.CharField(required=True, max_length=150)
        display_name = serializers.CharField(required=False, max_length=150, allow_blank=True)
        description = serializers.CharField(allow_null=True, required=False)
        created = serializers.DateTimeField(read_only=True)
        modified = serializers.DateTimeField(read_only=True)
        policyCount = serializers.IntegerField(read_only=True)
        accessCount = serializers.IntegerField(read_only=True)
        applications = serializers.SerializerMethodField()
        system = serializers.BooleanField(read_only=True)
        platform_default = serializers.BooleanField(read_only=True)
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Role
            fields = (
                "uuid",
                "name",
                "display_name",
                "description",
                "created",
                "modified",
                "policyCount",
                "accessCount",
                "applications",
                "system",
                "platform_default",
            )
    
    [docs]    def get_applications(self, obj):
            """Get the list of applications in the role."""
            return obtain_applications(obj)
    
    
    [docs]class DynamicFieldsModelSerializer(serializers.ModelSerializer):
        """A ModelSerializer that controls which fields should be displayed."""
    
        def __init__(self, *args, **kwargs):
            """Instantiate the serializer."""
            fields = kwargs.pop("fields", None)
    
            # Instantiate the superclass normally
            super(DynamicFieldsModelSerializer, self).__init__(*args, **kwargs)
    
            if fields is not None:
                # Drop any fields that are not specified in the `fields` argument.
                allowed = set(fields)
                existing = set(self.fields)
                for field_name in existing - allowed:
                    self.fields.pop(field_name)
    
    
    [docs]class RoleDynamicSerializer(DynamicFieldsModelSerializer):
        """Serializer for the Role model that could dynamically return required field."""
    
        uuid = serializers.UUIDField(read_only=True)
        name = serializers.CharField(required=True, max_length=150)
        display_name = serializers.CharField(required=False, max_length=150, allow_blank=True)
        description = serializers.CharField(allow_null=True, required=False)
        created = serializers.DateTimeField(read_only=True)
        modified = serializers.DateTimeField(read_only=True)
        policyCount = serializers.IntegerField(read_only=True)
        groups_in = serializers.SerializerMethodField()
        groups_in_count = serializers.SerializerMethodField()
        accessCount = serializers.IntegerField(read_only=True)
        applications = serializers.SerializerMethodField()
        system = serializers.BooleanField(read_only=True)
        platform_default = serializers.BooleanField(read_only=True)
    
    [docs]    class Meta:
            """Metadata for the serializer."""
    
            model = Role
            fields = (
                "uuid",
                "name",
                "display_name",
                "description",
                "created",
                "modified",
                "policyCount",
                "groups_in",
                "groups_in_count",
                "accessCount",
                "applications",
                "system",
                "platform_default",
            )
    
    [docs]    def get_applications(self, obj):
            """Get the list of applications in the role."""
            return obtain_applications(obj)
    
    [docs]    def get_groups_in_count(self, obj):
            """Get the totoal count of groups where the role is in."""
            request = self.context.get("request")
            return obtain_groups_in(obj, request).count()
    
    [docs]    def get_groups_in(self, obj):
            """Get the groups where the role is in."""
            request = self.context.get("request")
            return obtain_groups_in(obj, request).values("name", "uuid", "description")
    
    
    [docs]def obtain_applications(obj):
        """Shared function to get the list of applications in the role."""
        apps = []
        for access_item in obj.access.all():
            perm_list = access_item.permission.split(":")
            perm_len = len(perm_list)
            if perm_len == 3:
                apps.append(perm_list[0])
        return list(set(apps))
    
    
    [docs]def obtain_groups_in(obj, request):
        """Shared function to get the groups the roles is in."""
        scope_param = request.query_params.get("scope")
        username_param = request.query_params.get("username")
        policy_ids = list(obj.policies.values_list("id", flat=True))
    
        if scope_param == "principal" or username_param:
            principal = get_principal_from_request(request)
            assigned_groups = Group.objects.filter(policies__in=policy_ids, principals__in=[principal])
            return (assigned_groups | Group.platform_default_set()).distinct()
    
        return Group.objects.filter(policies__in=policy_ids).distinct()

### Quick search

### Navigation

  - [index](../../../../genindex/ "General Index")
  - [modules](../../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../../index/) »
  - [Module code](../../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.