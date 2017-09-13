---
layout: docs
title: External plugins
permalink: /docs/extending/external/
---
> Note: Currently the term _extension_ and _plugin_ is used interchangeably

Albert can be extended using regular executables. They are used like plugins, however the executables are separate processes which have separate address spaces. Therefore these executables are called _external plugins_.

An external plugin (hereafter plugin) is basically an executable which has a particular interface. Imagine the plugin as a set of functions that can be dynamically invoked. Which function is invoked, is defined by the environment variable `$ALBERT_OP`. The plugin should read this environment variable and react accordingly. Additionally to the mandatory environment variable `$ALBERT_OP` there may be some other variables defined. Imagine those as the parameters to the dynamic function. The return value of this function is returned to the application through the standard output stream (stdout). Depending on `$ALBERT_OP` the expected data may differ, but all responses have to be a JSON object containing properties. The set of possible `$ALBERT_OP`s and the expected properties and their structures are defined by the [*Communication protocol v3*](/docs/extending/external/v3/) (Since v0.14, [*v2*](/docs/extending/external/v2/) until 0.14).

To save state between the executions the plugin can return a JSON object called "variables". The properties of the object "variables" will be set as environment variables in the next execution. Note that this properties have to be strings otherwise they will not be set in the environment.

## Deployment

Albert looks in the [DataLocation](http://doc.qt.io/qt-5/qstandardpaths.html#StandardLocation-enum) directories of the application for the directory `external`. For the details check the Qt link. As an example on Linux Albert would search the following paths in this order:

* ~/.local/share/albert/external
* /usr/local/share/albert/external
* /usr/share/albert/external

Ids are guaranteed to be unique. This means that if several of those path contain a plugins with identical ids, only the first found plugin will be used.

## Sharing extensions

There is a [community repository]( https://github.com/albertlauncher/external/) for external extension. Currently this repository is not distributed with the app. However you can clone it to your disk to use the extensions. To share your extensions you have to fork it. Read the [README](https://github.com/albertlauncher/external/blob/master/README.md) in the repository for more information.
