---
title: Extension
parent: Getting started
nav_order: 2
has_children: true
has_toc: false
---

# Writing extensions

Albert can be extended using C++ or Python.

The sections on the C++ and Python interfaces do not serve as general guides, but 
rather focus on their particular interface and its peculiarities. 
Thus, before you start reading the details,
you should understand the [basics](/gettingstarted/basics) and
have read the [general](/gettingstarted/extension/general) concepts of Albert extension.

- [Native plugins](/gettingstarted/extension/cplusplus):
  - Performance and power of C/C++/ObjC(++).
  - Benefits of the native access to Qt:
    - Asynchronous operation.
    - Built-in internationalization.
    - Qt is a mature and well-documented framework.
  - Hardly any limitations.
- [Python plugins](/gettingstarted/extension/python):
  - Python is easy, allows rapid prototyping and is easy to distribute.
  - Theres a library for almost everything you'd want to achieve on PyPI.
  - Limited subset of the internal API.
  - No asynchronous operation.
  - No streamlined translations.
  - Does not allow effective parallelized multi-threading due to the [GIL](https://wiki.python.org/moin/GlobalInterpreterLock).

If you are interested in getting your plugin distributed with the application,
please read the [contributing](/gettingstarted/contributing#code) page.