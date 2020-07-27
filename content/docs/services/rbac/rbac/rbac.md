---
date: 2020-07-27 10:48:59.467212
title: rbac package
---
<div id="rbac-package" class="section">


<div id="submodules" class="section">

## Submodules

</div>

<div id="module-rbac.celery" class="section">

<span id="rbac-celery-module"> </span>

## rbac.celery module

Celery setup.

</div>

<div id="module-rbac.database" class="section">

<span id="rbac-database-module"> </span>

## rbac.database module

Django database settings.

  - `  rbac.database.  ` `  config  ` <span class="sig-paren"> ( </span>
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\] </span>](../../_modules/rbac/database/#config)  
    Database config.

</div>

<div id="module-rbac.dev_middleware" class="section">

<span id="rbac-dev-middleware-module"> </span>

## rbac.dev\_middleware module

Custom RBAC Dev Middleware.

  - *class* `  rbac.dev_middleware.  ` ` 
    DevelopmentIdentityHeaderMiddleware  ` <span class="sig-paren"> (
    </span> *<span class="n"> get\_response </span> <span class="o"> =
    </span> <span class="default_value"> None </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/rbac/dev_middleware/#DevelopmentIdentityHeaderMiddleware)  
    Bases: `  django.utils.deprecation.MiddlewareMixin  `
    
    Middleware to add 3scale header for development.
    
      - `  header  ` *= 'HTTP\_X\_RH\_IDENTITY'*
    
    <!-- end list -->
    
      - `  process_request  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/rbac/dev_middleware/#DevelopmentIdentityHeaderMiddleware.process_request)  
        Process request for to add header.
        
          - Args:  
            request (object): The request object

</div>

<div id="module-rbac.env" class="section">

<span id="rbac-env-module"> </span>

## rbac.env module

Obtain project environment.

</div>

<div id="module-rbac.middleware" class="section">

<span id="rbac-middleware-module"> </span>

## rbac.middleware module

Custom RBAC Middleware.

  - *class* `  rbac.middleware.  ` `  DisableCSRF  `
    <span class="sig-paren"> ( </span> *<span class="n"> get\_response
    </span> <span class="o"> = </span> <span class="default_value"> None
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/rbac/middleware/#DisableCSRF)  
    Bases: `  django.utils.deprecation.MiddlewareMixin  `
    
    Middleware to disable CSRF for 3scale usecase.
    
      - `  process_request  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/rbac/middleware/#DisableCSRF.process_request)  
        Process request for csrf checks.
        
          - Args:  
            request (object): The request object

<!-- end list -->

  - *class* `  rbac.middleware.  ` `  HttpResponseUnauthorizedRequest  `
    <span class="sig-paren"> ( </span> *<span class="n"> content </span>
    <span class="o"> = </span> <span class="default_value"> b'' </span>*
    , *<span class="o"> \* </span> <span class="n"> args </span>* ,
    *<span class="o"> \*\* </span> <span class="n"> kwargs </span>*
    <span class="sig-paren"> ) </span> [<span class="viewcode-link">
    \[source\]
    </span>](../../_modules/rbac/middleware/#HttpResponseUnauthorizedRequest)  
    Bases: `  django.http.response.HttpResponse  `
    
    A subclass of HttpResponse to return a 401.
    
    Used if identity header is not sent.
    
      - `  status_code  ` *= 401*

<!-- end list -->

  - *class* `  rbac.middleware.  ` `  IdentityHeaderMiddleware  `
    <span class="sig-paren"> ( </span> *<span class="n"> get\_response
    </span> <span class="o"> = </span> <span class="default_value"> None
    </span>* <span class="sig-paren"> ) </span>
    [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/rbac/middleware/#IdentityHeaderMiddleware)  
    Bases: `  tenant_schemas.middleware.BaseTenantMiddleware  `
    
    A subclass of RemoteUserMiddleware.
    
    Processes the provided identity found on the request.
    
      - `  get_tenant  ` <span class="sig-paren"> ( </span>
        *<span class="n"> model </span>* , *<span class="n"> hostname
        </span>* , *<span class="n"> request </span>*
        <span class="sig-paren"> ) </span> [<span class="viewcode-link">
        \[source\]
        </span>](../../_modules/rbac/middleware/#IdentityHeaderMiddleware.get_tenant)  
        Override the tenant selection logic.
    
    <!-- end list -->
    
      - `  header  ` *= 'HTTP\_X\_RH\_IDENTITY'*
    
    <!-- end list -->
    
      - `  hostname_from_request  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/rbac/middleware/#IdentityHeaderMiddleware.hostname_from_request)  
        Behold. The tenant\_schemas expects to pivot schemas based on
        hostname. We’re not.
    
    <!-- end list -->
    
      - `  process_request  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* <span class="sig-paren"> )
        </span> [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/rbac/middleware/#IdentityHeaderMiddleware.process_request)  
        Process request for identity middleware.
        
          - Args:  
            request (object): The request object
    
    <!-- end list -->
    
      - `  process_response  ` <span class="sig-paren"> ( </span>
        *<span class="n"> request </span>* , *<span class="n"> response
        </span>* <span class="sig-paren"> ) </span>
        [<span class="viewcode-link"> \[source\]
        </span>](../../_modules/rbac/middleware/#IdentityHeaderMiddleware.process_response)  
        Process response for identity middleware.
        
          - Args:  
            request (object): The request object response (object): The
            response object

<!-- end list -->

  - `  rbac.middleware.  ` `  is_no_auth  ` <span class="sig-paren"> (
    </span> *<span class="n"> request </span>* <span class="sig-paren">
    ) </span> [<span class="viewcode-link"> \[source\]
    </span>](../../_modules/rbac/middleware/#is_no_auth)  
    Check condition for needing to authenticate the user.

</div>

<div id="module-rbac.settings" class="section">

<span id="rbac-settings-module"> </span>

## rbac.settings module

Django settings for rbac project.

Generated by ‘django-admin startproject’ using Django 2.0.4.

For more information on this file, see
<https://docs.djangoproject.com/en/2.0/topics/settings/>

For the full list of settings and their values, see
<https://docs.djangoproject.com/en/2.0/ref/settings/>

</div>

<div id="module-rbac.urls" class="section">

<span id="rbac-urls-module"> </span>

## rbac.urls module

rbac URL Configuration.

  - The urlpatterns list routes URLs to views. For more information
    please see:  
    <https://docs.djangoproject.com/en/2.0/topics/http/urls/>

</div>

<div id="module-rbac.wsgi" class="section">

<span id="rbac-wsgi-module"> </span>

## rbac.wsgi module

WSGI config for rbac project.

It exposes the WSGI callable as a module-level variable named ` 
application  ` .

For more information on this file, see
<https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/>

</div>

<div id="module-rbac" class="section">

<span id="module-contents"> </span>

## Module contents

RBAC project module.

</div>

</div>