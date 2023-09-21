---
layout: docs
title: Extending
permalink: /extending/
---

Albert has a flexible, nested plugin system, which gives users and developers the ability to extend its functionality.

## Native plugins

The native way is to use C++/Qt to write a QPlugin. This gives you the performance of C++ and a host of other advantages. See the docs on [native plugins]({{ site.baseurl }}/reference/) especially the [albert namespace]({{ site.baseurl }}/reference/namespacealbert.html). Also check the [`plugins`](https://github.com/albertlauncher/plugins) repo for an up to date list of plugins.

## Python plugins

The Python plugin adds plugins via Python modules. Check the docs of the [Python plugin](https://github.com/albertlauncher/plugins/blob/master/python/README.md) and the [`python`](https://github.com/albertlauncher/python) repo for an up to date list of plugins.
