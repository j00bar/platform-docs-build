---
date: 2020-08-24 20:29:21.726797
title: api.status package
---
### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »


## Submodules

## api.status.model module

Models to capture server status.

  -  *class* ` api.status.model. ` ` Status ` [ \[source\]
    ](../../_modules/api/status/model/#Status)   
    Bases: ` object `
    
    A server’s status.
    
      -  *property* ` api_version `   
        Return the API version.
    
    <!-- end list -->
    
      -  *property* ` commit `   
        Collect the build number for the server.
        
          -  Returns   
            A build number
    
    <!-- end list -->
    
      -  *property* ` modules `   
        Collect the installed modules.
        
          -  Returns   
            A dictonary of module names and versions.
    
    <!-- end list -->
    
      -  *property* ` platform_info `   
        Collect the platform information.
        
          -  Returns   
            A dictionary of platform data
    
    <!-- end list -->
    
      -  *property* ` python_version `   
        Collect the python version information.
        
          -  Returns   
            The python version string.
    
    <!-- end list -->
    
      -  ` startup `  (   )  [ \[source\]
        ](../../_modules/api/status/model/#Status.startup)   
        Log startup information.

## api.status.serializer module

Serializer to capture server status.

  -  *class* ` api.status.serializer. ` ` StatusSerializer `  ( 
    *instance=None* , *data=\<class 'rest\_framework.fields.empty'\>* ,
    *\*\*kwargs*  )  [ \[source\]
    ](../../_modules/api/status/serializer/#StatusSerializer)   
    Bases: ` rest_framework.serializers.Serializer `
    
    Serializer for the Status model.
    
      -  *class* ` Meta ` [ \[source\]
        ](../../_modules/api/status/serializer/#StatusSerializer.Meta)
          
        Bases: ` object `
        
        Metadata for the serializer.
        
          -  ` fields ` *= '\_\_all\_\_'* 
        
        <!-- end list -->
        
          -  ` model `   
            alias of [` api.status.model.Status
            `](#api.status.model.Status "api.status.model.Status")

## api.status.view module

View for server status.

  -  ` api.status.view. ` ` status `  (  * self * , * request * , * \*  
    args * , * \*\*   kwargs *  )  [ \[source\]
    ](../../_modules/api/status/view/#status)   
    Provide the server status information.
    
    @api {get} /api/v1/status/ Request server status @apiName GetStatus
    @apiGroup Status @apiVersion 1.0.0 @apiDescription Request server
    status.
    
    @apiSuccess {Number} api\_version The version of the API.
    @apiSuccess {String} commit The commit hash of the code base.
    @apiSuccess {Object} modules The code modules found on the server.
    @apiSuccess {Object} platform\_info The server platform information.
    @apiSuccess {String} python\_version The version of python on the
    server. @apiSuccess {String} server\_address The address of the
    server. @apiSuccessExample {json} Success-Response:
    
    > HTTP/1.1 200 OK {
    > 
    > > “api\_version”: 1, “commit”: “178d2ea”, “server\_address”:
    > > “127.0.0.1:8000”, “platform\_info”: {
    > > 
    > > > “system”: “Darwin”, “node”: “node-1.example.com”, “release”:
    > > > “17.5.0”, “version”: “Darwin Kernel Version 17.5.0”,
    > > > “machine”: “x86\_64”, “processor”: “i386” },
    > > 
    > > “python\_version”: “3.6.1”, “modules”: {
    > > 
    > > > “coverage”: “4.5.1”, “coverage.version”: “4.5.1”,
    > > > “coverage.xmlreport”: “4.5.1”, “cryptography”: “2.0.3”,
    > > > “ctypes”: “1.1.0”, “ctypes.macholib”: “1.0”, “decimal”:
    > > > “1.70”, “django”: “1.11.5”, “django.utils.six”: “1.10.0”,
    > > > “django\_filters”: “1.0.4”, “http.server”: “0.6” }
    > 
    > }

## Module contents

### [Table of Contents](../../index/)

  - [api.status package](#)
      - [Submodules](#submodules)
      - [api.status.model module](#module-api.status.model)
      - [api.status.serializer module](#module-api.status.serializer)
      - [api.status.view module](#module-api.status.view)
      - [Module contents](#module-api.status)

### This Page

  - [Show Source](../../_sources/rbac/api.status.rst.txt)

### Quick search

### Navigation

  - [index](../../genindex/ "General Index")
  - [modules](../../py-modindex/ "Python Module Index") |
  - [Insights-rbac 0.0.1 documentation](../../index/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.