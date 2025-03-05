---
title: C++
parent: Extension
grand_parent: Getting started
nav_order: 1
---

# Extending Albert using C++
{: .no_toc }

{: .note }
This page focuses on the practical aspects of extending Albert using C++ and its peculiarities.
To get a high level overview of common concepts of the API refer to the [general](/gettingstarted/extension/general) section.

- TOC
{:toc}
 
A native plugin is a [Qt Plugin](https://doc.qt.io/qt-6/plugins-howto.html#the-low-level-api-extending-qt-applications), i.e. a shared library providing an instance of the class `PluginInstance`.

Albert provides `C` and `CMake` macros that implement conventions to streamline the plugin development 
process and to reduce the considerable amount of boilerplate code required to a few lines of code.

## CMake

Having a standardized plugin project structure the `albert_plugin` macro takes care of most of the CMake boilerplate code.
It is part of the `albert` CMake module and can be included using `find_package(Albert REQUIRED)`.
Read its documentation in the header of the [CMake module](https://raw.githubusercontent.com/albertlauncher/albert/main/cmake/albert-macros.cmake) before you proceed.

A minimal working CMakeLists.txt (See also the [CMakeLists.txt files of the official plugins](https://github.com/search?q=repo%3Aalbertlauncher%2Fplugins+path%3A**%2FCMakeLists.txt&type=code)):

```cmake
project(my_plugin VERSION 1.0)
find_package(Albert REQUIRED)
albert_plugin()
```

This is the standard plugin directory structure of a plugin:

```
─┬─  my_plugin      
 ├──  CMakeLists.txt      
 ├──  metadata.json
 ├─┬─  src    
 │ └──  …
 └─┬─  i18n        
   └──  …       
```

A basic metadata file looks like this (See also the [metadata.json files of the official plugins](https://github.com/search?q=repo%3Aalbertlauncher%2Fplugins+path%3A**%2Fmetadata.json&type=code)):

```json
{
    "name": "My Plugin",
    "description": "Do useful stuff",
    "authors": ["@myname"],
    "license": "MIT",
    "url": "https://github.com/myusername/my-albert-plugin",
}
```

## C++

Albert plugins ultimately have to inherit the `QObject` and [`PluginInstance`](https://albertlauncher.github.io/reference/classalbert_1_1PluginInstance.html) class and 
contain the `ALBERT_PLUGIN` macro in the declaration body.

A basic plugin looks like this (See also the [plugin header files of the official plugins](https://github.com/search?q=repo%3Aalbertlauncher%2Fplugins+path%3A**%2FPlugin.h&type=code)):

```cpp
#pragma once
#include <albert/extensionplugin.h>
#include <albert/triggerqueryhandler.h>

class Plugin : public QObject, public albert::PluginInstance
{
    ALBERT_PLUGIN
};
```

Usually you dont want to subclass `PluginInstance` directly but rather [`ExtensionPlugin`](https://albertlauncher.github.io/reference/classalbert_1_1ExtensionPlugin.html)
which implements the [`Extension`](https://albertlauncher.github.io/reference/classalbert_1_1Extension.html) interface using the metadata of the plugin instance.

```cpp
#pragma once
#include <albert/extensionplugin.h>
#include <albert/triggerqueryhandler.h>

class Plugin : public albert::ExtensionPlugin,
               public albert::TriggerQueryHandler
{
    ALBERT_PLUGIN
    void handleTriggerQuery(albert::Query &) override {}
};
```

From here on it depends on the interface you want to implement.
Read through the [albert namespace reference](https://albertlauncher.github.io/reference/namespacealbert.html).
See the [official native plugins](https://github.com/albertlauncher/plugins/tree/main/) as a reference.
Concise examples to start with are: `debug`, `timezones`, `hash` or `urlhandler`.

## Plugin directories

The plugin directories depends on the platform and the build type.

- **Linux**:
  - `~/.local/{lib,lib64}/albert`
  - `/usr/local/{lib,lib64}/albert`
  - `/usr/lib/${MULTIARCH_TUPLE}/albert`
  - `/usr/{lib,lib64}/albert`
- **macOS**:
  - `$BUNDLE_PATH/Contents/PlugIns`
  - `~/Library/Application Support/Albert/plugins`

The plugin directories are scanned in the order of the above list.
On start Albert scans the plugin directories for available plugins.
Since identifiers have to be unique, duplicate plugins with the same identifier (project name) are skipped.



