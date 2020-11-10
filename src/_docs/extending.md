---
layout: docs
title: Extending Albert
permalink: //extending/
---

Albert has a flexible nested extension system, which gives users and developers the ability to extend its functionality.

The native and primary way is to use C++/Qt to write a QPlugin. This gives you the performance of C++, the full set of interfaces to implement, access to several utility classes and direct access to the application and Qt framework including the event loop, which allows asynchronous operations.

C++ knowledge is not that widespread therefore there are (native) extensions that make albert scriptable.

The primary way to script albert is the Python extension. The Python extension adds functionality via python modules. Most of the community effort goes into this part of the project. It supports a good fraction of the internal API, is in memory and pretty fast.

A more flexible but less performant and convenient way to extend Albert are external extensions. Since they are basically CGI executables you can use *any* language that can be used to build executable files. This way to extend albert is officially deprecated but stays for backward compatibility. If you plan to write an extension now it is recommended to use the native or Python approach.

## Native extensions

If you want to write a native extension, check the docs on [native extension](//extending/native/).

Check [the plugins repo](https://github.com/albertlauncher/plugins) for an up to date list of extensions.

## Python extensions

If you want to write a Python extension, check the docs of the [Python plugin](//extending/python/).

Check [the python repo](https://github.com/albertlauncher/python) for an up to date list of extensions.

## External extensions

If you want to write an external extension though, check the docs of the [external extension plugin](//extending/external/).

Check [the external repo](https://github.com/albertlauncher/external) for a template extension.
