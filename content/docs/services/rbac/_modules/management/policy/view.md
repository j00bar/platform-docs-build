---
date: 2020-08-30 16:01:49.412984
title: Source code for management.policy.view
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
    
    """View for policy management."""
    from django_filters import rest_framework as filters
    from management.permissions import PolicyAccessPermission
    from management.querysets import get_policy_queryset
    from rest_framework import mixins, viewsets
    from rest_framework.filters import OrderingFilter
    
    from .model import Policy
    from .serializer import PolicyInputSerializer, PolicySerializer
    
    
    [docs]class PolicyFilter(filters.FilterSet):
        """Filter for policy."""
    
        name = filters.CharFilter(field_name="name", lookup_expr="icontains")
        group_name = filters.CharFilter(field_name="group", lookup_expr="name__icontains")
        group_uuid = filters.UUIDFilter(field_name="group", lookup_expr="uuid__exact")
    
    [docs]    class Meta:
            model = Policy
            fields = ["name", "group_name", "group_uuid"]
    
    
    [docs]class PolicyViewSet(
        mixins.CreateModelMixin,
        mixins.DestroyModelMixin,
        mixins.ListModelMixin,
        mixins.RetrieveModelMixin,
        mixins.UpdateModelMixin,
        viewsets.GenericViewSet,
    ):
        """Policy View.
    
        A viewset that provides default `create()`, `destroy`, `retrieve()`,
        and `list()` actions.
    
        """
    
        queryset = Policy.objects.all()
        permission_classes = (PolicyAccessPermission,)
        lookup_field = "uuid"
        filter_backends = (filters.DjangoFilterBackend, OrderingFilter)
        filterset_class = PolicyFilter
        ordering_fields = ("name", "modified")
        ordering = ("name",)
    
    [docs]    def get_queryset(self):
            """Obtain queryset for requesting user based on access."""
            return get_policy_queryset(self.request)
    
    [docs]    def get_serializer_class(self):
            """Get serializer based on route."""
            if self.request.method in ("POST", "PUT"):
                return PolicyInputSerializer
            return PolicySerializer
    
    [docs]    def create(self, request, *args, **kwargs):
            """Create a policy.
    
            @api {post} /api/v1/policies/   Create a policy
            @apiName createPolicy
            @apiGroup Policy
            @apiVersion 1.0.0
            @apiDescription Create a policy
    
            @apiHeader {String} token User authorization token
    
            @apiParam (Request Body) {String} name Policy name
            @apiParam (Request Body) {String} group UUID of group
            @apiParam (Request Body) {Array} roles Array of role UUIDs
            @apiParamExample {json} Request Body:
                {
                    "name": "PolicyA"
                    "group": "57e60f90-8c0c-4bd1-87a0-2143759aae1c",
                    "roles": [
                        "4df211e0-2d88-49a4-8802-728630224d15"
                    ]
                }
    
            @apiSuccess {String} uuid Policy unique identifier
            @apiSuccess {String} name Policy name
            @apiSuccessExample {json} Success-Response:
                HTTP/1.1 201 CREATED
                {
                    "uuid": "16fd2706-8baf-433b-82eb-8c7fada847da",
                    "name": "PolicyA",
                    "group": {
                        "name": "GroupA",
                        "uuid": "57e60f90-8c0c-4bd1-87a0-2143759aae1c"
                    },
                    "roles": [
                        {
                            "name": "RoleA",
                            "uuid": "4df211e0-2d88-49a4-8802-728630224d15"
                        }
                    ]
                }
            """
            return super().create(request=request, args=args, kwargs=kwargs)
    
    [docs]    def list(self, request, *args, **kwargs):
            """Obtain the list of policies for the tenant.
    
            @api {get} /api/v1/policies/   Obtain a list of policies
            @apiName getPolicies
            @apiGroup Policy
            @apiVersion 1.0.0
            @apiDescription Obtain a list of policies
    
            @apiHeader {String} token User authorization token
    
            @apiParam (Query) {String} name Filter by policy name.
            @apiParam (Query) {Number} offset Parameter for selecting the start of data (default is 0).
            @apiParam (Query) {Number} limit Parameter for selecting the amount of data (default is 10).
    
            @apiSuccess {Object} meta The metadata for pagination.
            @apiSuccess {Object} links  The object containing links of results.
            @apiSuccess {Object[]} data  The array of results.
    
            @apiSuccessExample {json} Success-Response:
                HTTP/1.1 200 OK
                {
                    'meta': {
                        'count': 2
                    }
                    'links': {
                        'first': /api/v1/policies/?offset=0&limit=10,
                        'next': None,
                        'previous': None,
                        'last': /api/v1/policies/?offset=0&limit=10
                    },
                    'data': [
                                    {
                                        "uuid": "16fd2706-8baf-433b-82eb-8c7fada847da",
                                        "name": "PolicyA"
                                    },
                                    {
                                        "uuid": "20ecdcd0-397c-4ede-8940-f3439bf40212",
                                        "name": "PolicyB"
                                    }
                                ]
                }
    
            """
            return super().list(request=request, args=args, kwargs=kwargs)
    
    [docs]    def retrieve(self, request, *args, **kwargs):
            """Get a policy.
    
            @api {get} /api/v1/policies/:uuid   Get a policy
            @apiName getPolicy
            @apiGroup Policy
            @apiVersion 1.0.0
            @apiDescription Get a policy
    
            @apiHeader {String} token User authorization token
    
            @apiParam (Path) {String} id Policy unique identifier.
    
            @apiSuccess {String} uuid Policy unique identifier
            @apiSuccess {String} name Policy name
            @apiSuccessExample {json} Success-Response:
                HTTP/1.1 200 OK
                {
                    "uuid": "16fd2706-8baf-433b-82eb-8c7fada847da",
                    "name": "PolicyA",
                    "group": {
                        "name": "GroupA",
                        "uuid": "57e60f90-8c0c-4bd1-87a0-2143759aae1c"
                    },
                    "roles": [
                        {
                            "name": "RoleA",
                            "uuid": "4df211e0-2d88-49a4-8802-728630224d15"
                        }
                    ]
                }
            """
            return super().retrieve(request=request, args=args, kwargs=kwargs)
    
    [docs]    def destroy(self, request, *args, **kwargs):
            """Delete a policy.
    
            @api {delete} /api/v1/policies/:uuid   Delete a policy
            @apiName deletePolicy
            @apiGroup Policy
            @apiVersion 1.0.0
            @apiDescription Delete a policy
    
            @apiHeader {String} token User authorization token
    
            @apiParam (Path) {String} uuid Policy unique identifier
    
            @apiSuccessExample {json} Success-Response:
                HTTP/1.1 204 NO CONTENT
            """
            return super().destroy(request=request, args=args, kwargs=kwargs)
    
    [docs]    def update(self, request, *args, **kwargs):
            """Update a policy.
    
            @api {post} /api/v1/policies/:uuid   Update a policy
            @apiName updatePolicy
            @apiGroup Policy
            @apiVersion 1.0.0
            @apiDescription Update a policy
    
            @apiHeader {String} token User authorization token
    
            @apiParam (Path) {String} id Policy unique identifier
    
            @apiParam (Request Body) {String} name Policy name
            @apiParam (Request Body) {String} group UUID of group
            @apiParam (Request Body) {Array} roles Array of role UUIDs
            @apiParamExample {json} Request Body:
                {
                    "name": "PolicyA"
                    "group": "59e60f90-8c0c-4bd1-87a0-2143759aae1c",
                    "roles": [
                        "4df211e0-2d88-49a4-8802-728630224d15"
                    ]
                }
    
            @apiSuccess {String} uuid Policy unique identifier
            @apiSuccess {String} name Policy name
            @apiSuccessExample {json} Success-Response:
                HTTP/1.1 200 OK
                {
                    "uuid": "16fd2706-8baf-433b-82eb-8c7fada847da",
                    "name": "PolicyA",
                    "group": {
                        "name": "GroupC",
                        "uuid": "59e60f90-8c0c-4bd1-87a0-2143759aae1c"
                    },
                    "roles": [
                        {
                            "name": "RoleA",
                            "uuid": "4df211e0-2d88-49a4-8802-728630224d15"
                        }
                    ]
                }
            """
            return super().update(request=request, args=args, kwargs=kwargs)

### Quick search

### Navigation

  - [index](../../../../genindex/ "General Index")
  - [modules](../../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../../index/) »
  - [Module code](../../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.