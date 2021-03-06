---
date: 2020-08-30 16:01:49.412984
title: Contributing to insights-rbac
---
### Navigation

  - [index](../genindex/ "General Index")
  - [modules](../py-modindex/ "Python Module Index") |
  - [next](../openshift/ "Working with OpenShift") |
  - [previous](../README/ "Insights Role Based Access Control README") |
  - [Insights-rbac 0.0.1 documentation](../index/) »
  - [Development Information](../development/) »


Thank you for your interest in contributing to this project\!

The following are a set of guidelines for contributing to insights-rbac.
These are guidelines, not rules. Use your best judgement. Feel free to
suggest changes to this document in a pull-request.

This document uses [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt/)
keywords to indicate requirement levels.

## Reporting Bugs & Requesting Features

We use Github Issues to track bug reports and feature requests.

When submitting a bug report, please be as detailed as possible. Include
as much of these items as you have:

> 1.  steps to reproduce the bug
> 
> 2.  error messages with stacktraces
> 
> 3.  logs
> 
> 4.  any relevant configuration settings
> 
> 5.  environment details

When submitting a feature request, please submit them in the form of a
user story with acceptance criteria:

> As a \[user\], I want \[a thing\], So that \[some goal\].
> 
> When complete, I will be able to:
> 
> 1.  \[do this\]
> 
> 2.  \[do that\]
> 
> 3.  \[do another\]

## Contributing Code (Pull Requests)

All code contributions MUST come in the form of a pull-request.
Pull-requests will be reviewed for a variety of criteria. This section
attempts to capture as much of that criteria as possible.

## Readability and Style considerations

In general, we believe that code is read just as much as it is executed.
So, writing readable code is just as important as writing functional
code.

Pull-requests MUST follow Python style conventions (e.g. [PEP
8](https://www.python.org/dev/peps/pep-0008/) and [PEP
20](https://www.python.org/dev/peps/pep-0020/) and conform to generally
recognized best practices. Pull-requests MAY also choose to conform to
additional style guidelines, e.g. [Google’s Python Style
Guide](https://google.github.io/styleguide/pyguide.html/) .

We do use automation whenever possible to ensure a basic level of
acceptability. Pull-requests MUST pass a linter (pylint or flake8)
without errors.

We do recognize that sometimes linters can get things wrong. They are
useful tools, but they are not perfect tools. Pull-requests SHOULD pass
a linter without warnings.

Pull-requests MAY include disabling a specific linter check. If your
pull-request disables linting it MUST include a comment block detailing
why that particular check was disabled and it MUST be scoped as narrowly
as possible. i.e. Don’t disable linting on an entire class or method
when disabling the check for a single statement will do.

## Code testing considerations

We believe that well-tested code is a critical component to every
successful project. For this reason, all pull-requests MUST include unit
test cases and those unit tests MUST pass when run.

The unit tests SHOULD cover all of the code in the pull-request. Our
goal is to maintain at least 90% test coverage.

In general, the test cases SHOULD cover both success and failure
conditions.

An attempt SHOULD be made to cover all code branches. You SHOULD also
attempt to include tests for all class and method parameters. e.g. If a
method accepts a boolean, there should be tests for when that boolean is
True, False, and None.

### [Table of Contents](../index/)

  - [Contributing to insights-rbac](#)
      - [Reporting Bugs & Requesting
        Features](#reporting-bugs-requesting-features)
      - [Contributing Code (Pull
        Requests)](#contributing-code-pull-requests)
      - [Readability and Style
        considerations](#readability-and-style-considerations)
      - [Code testing considerations](#code-testing-considerations)

#### Previous topic

[Insights Role Based Access Control
README](../README/ "previous chapter")

#### Next topic

[Working with OpenShift](../openshift/ "next chapter")

### This Page

  - [Show Source](../_sources/CONTRIBUTING.rst.txt)

### Quick search

### Navigation

  - [index](../genindex/ "General Index")
  - [modules](../py-modindex/ "Python Module Index") |
  - [next](../openshift/ "Working with OpenShift") |
  - [previous](../README/ "Insights Role Based Access Control README") |
  - [Insights-rbac 0.0.1 documentation](../index/) »
  - [Development Information](../development/) »

© Copyright 2019, Red Hat, Inc.. Created using
[Sphinx](http://sphinx-doc.org/) 3.0.3.