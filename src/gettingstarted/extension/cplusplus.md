---
title: C++
parent: Extension
grand_parent: Getting started
nav_order: 0
---

# Writing native C++/Qt plugins
{: .no_toc }

- TOC
{:toc}

A native plugin is a [Qt Plugin](https://doc.qt.io/qt-6/plugins-howto.html#the-low-level-api-extending-qt-applications), i.e. a shared library providing a particular interface.


## CMake

Having a standardized plugin project structure the `albert_plugin` macro takes care of most of the CMake boilerplate code.
Read the documentation header of the [CMake module](https://raw.githubusercontent.com/albertlauncher/albert/main/cmake/albert-macros.cmake) before you proceed.
Its just a few lines. 
Do not skip this!
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

A basic metadata file looks like this (See also the [metadata.json files](https://github.com/search?q=repo%3Aalbertlauncher%2Fplugins+path%3A**%2Fmetadata.json&type=code) of the official plugins):

```json
{
    "name": "My Plugin",
    "description": "Do useful stuff",
    "authors": ["@myname"],
    "license": "MIT",
    "url": "https://github.com/myusername/my-albert-plugin",
}
```

A minimal working CMakeLists.txt (See also the [CMakeLists.txt files](https://github.com/search?q=repo%3Aalbertlauncher%2Fplugins+path%3A**%2FCMakeLists.txt&type=code) of the official plugins):

```cmake
cmake_minimum_required(VERSION 3.16)
project(my_plugin VERSION 1.0)
find_package(Albert REQUIRED)
albert_plugin()
```

## C++

A Qt plugin class has to inherit `QObject`, contain the `Q_OBJECT` macro, specify an interface identifier and the metadata file path.
The relevant base classes and the `ALBERT_PLUGIN` macro takes care of this.

Albert plugins have to inherit the [`PluginInstance`](https://albertlauncher.github.io/reference/classalbert_1_1PluginInstance.html) class.
Usually you dont want to subclass `PluginInstance` directly but rather [`ExtensionPlugin`](https://albertlauncher.github.io/reference/classalbert_1_1ExtensionPlugin.html) which implements the [`Extension`](https://albertlauncher.github.io/reference/classalbert_1_1Extension.html) interface using the metadata of the plugin instance.


A basic plugin looks like this (Check the [plugin header files](https://github.com/search?q=repo%3Aalbertlauncher%2Fplugins+path%3A**%2FPlugin.h&type=code) of the official plugins for reference):

```cpp
#pragma once
#include <albert/extensionplugin.h>

class Plugin : public albert::ExtensionPlugin
{
    ALBERT_PLUGIN
};
```

## What's next?

From here on it depends on the interface you want to implement.

- See the core interfaces in the [extension inheritance diagram](https://albertlauncher.github.io/reference/classalbert_1_1Extension.html).
- Read/Skim through the [albert namespace reference](https://albertlauncher.github.io/reference/namespacealbert.html).
- See the [official native plugins](https://github.com/albertlauncher/plugins/tree/main/) as a reference.
- Join the [community chats](https://albertlauncher.github.io/help/#chats).
- Build something cool and share it.

