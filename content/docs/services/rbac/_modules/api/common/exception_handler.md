---
date: 2020-08-24 20:47:50.866547
title: Source code for api.common.exception\_handler
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
    
    """Common exception handler class."""
    import copy
    
    from rest_framework.views import exception_handler
    
    
    def _generate_errors_from_list(data, **kwargs):
        """Create error objects based on the exception."""
        errors = []
        status_code = kwargs.get("status_code", 0)
        source = kwargs.get("source")
        for value in data:
            if isinstance(value, str):
                new_error = {"detail": value, "source": source, "status": status_code}
                errors.append(new_error)
            elif isinstance(value, list):
                errors += _generate_errors_from_list(value, **kwargs)
            elif isinstance(value, dict):
                errors += _generate_errors_from_dict(value, **kwargs)
        return errors
    
    
    def _generate_errors_from_dict(data, **kwargs):
        """Create error objects based on the exception."""
        errors = []
        status_code = kwargs.get("status_code", 0)
        source = kwargs.get("source")
        for key, value in data.items():
            source_val = "{}.{}".format(source, key) if source else key
            if isinstance(value, str):
                new_error = {"detail": value, "source": source_val, "status": status_code}
                errors.append(new_error)
            elif isinstance(value, list):
                kwargs["source"] = source_val
                errors += _generate_errors_from_list(value, **kwargs)
            elif isinstance(value, dict):
                kwargs["source"] = source_val
                errors += _generate_errors_from_dict(value, **kwargs)
        return errors
    
    
    [docs]def custom_exception_handler(exc, context):
        """Create custom response for exceptions."""
        response = exception_handler(exc, context)
    
        # Now add the HTTP status code to the response.
        if response is not None:
            errors = []
            data = copy.deepcopy(response.data)
            if isinstance(data, dict):
                errors += _generate_errors_from_dict(data, **{"status_code": str(response.status_code)})
            elif isinstance(data, list):
                errors += _generate_errors_from_list(data, **{"status_code": str(response.status_code)})
            error_response = {"errors": errors}
            response.data = error_response
    
        return response

### Quick search

### Navigation

  - [index](../../../../genindex/ "General Index")
  - [modules](../../../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../../../index/) »
  - [Module code](../../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.