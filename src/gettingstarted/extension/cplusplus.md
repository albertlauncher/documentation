---
title: C++
parent: Extension
grand_parent: Getting started
nav_order: 0
---

# Extending Albert using C++
{: .no_toc }

{: .note }
This page focuses on the practical aspects of extending Albert using C++ and its peculiarities.
To get an overview of the API refer to the general [extension](/gettingstarted/extension/) section.

- TOC
{:toc}
 
A native plugin is a [Qt Plugin](https://doc.qt.io/qt-6/plugins-howto.html#the-low-level-api-extending-qt-applications),
i.e. a shared library providing an instance of the class `PluginInstance`.


## Writing native C++ plugins

Albert provides `CMake` macros that implement conventions to streamline the plugin development 
process and reduce the boilerplate code required to a few lines of code.
Read the documentation in the header of the [`Albert`](https://raw.githubusercontent.com/albertlauncher/albert/main/cmake/albert-macros.cmake) CMake module before you proceed.

A minimal `CMakeLists.txt`:

```cmake
project(my_plugin VERSION 1.0)
find_package(Albert REQUIRED)
albert_plugin()
```

A minimal `metadata.json`:

```json
{
    "name": "My Plugin",
    "description": "Do useful stuff",
    "authors": ["@myname"],
    "license": "MIT"
}
```

A plugin class has to be default-constructible,
inherit [`PluginInstance`](https://albertlauncher.github.io/reference/classalbert_1_1PluginInstance.html) 
and contain the [`ALBERT_PLUGIN`](/reference/plugininstance_8h.html#a8787b7c8c0b456d908480300c22d3f5f) macro in its body.

Almost always you want to provide exactly one extension.
The [`ExtensionPlugin`](https://albertlauncher.github.io/reference/classalbert_1_1ExtensionPlugin.html) class 
implements the virtual methods in 
[`Extension`](https://albertlauncher.github.io/reference/classalbert_1_1Extension.html)
and [`PluginInstance`](https://albertlauncher.github.io/reference/classalbert_1_1PluginInstance.html)
for this case. A minimal plugin providing an extension looks like this:
  
```cpp
#pragma once
#include <albert/extensionplugin.h>

class Plugin : public albert::ExtensionPlugin
{
    ALBERT_PLUGIN
};
```

For real use cases you want to derive actually useful extension interfaces. 

Next, skim through the [API reference](https://albertlauncher.github.io/reference/namespacealbert.html).
For reference see the [official plugins](https://github.com/albertlauncher/albert/tree/main/plugins).


## Plugin directories

- **Linux**:
  - `~/.local/{lib,lib64}/albert`
  - `/usr/local/{lib,lib64}/albert`
  - `/usr/lib/${MULTIARCH_TUPLE}/albert`
  - `/usr/{lib,lib64}/albert`
- **macOS**:
  - `~/Library/Application Support/Albert/plugins`
  - `$BUNDLE_PATH/Contents/PlugIns`

