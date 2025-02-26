---
title: Python
parent: Extension
grand_parent: Getting started
nav_order: 1
---

# Extending Albert using Python plugins
{: .no_toc }

- TOC
{:toc}

## The Python interface

The **Python interface** is defined in the [Albert Python stub file](https://github.com/albertlauncher/plugins/blob/main/python/albert.pyi).
This file serves as documentation for the embedded `albert` module, and its module docstring describes the interface that makes a Python module an Albert Python plugin.

The stub file is written to your *user Python plugin directory* (more on that below).
This is also where you are supposed to put your personal plugins.
There the stub file serves as inline documention and coding assistance in your IDE while developing plugins. 

**Python plugin directories** are the subdirectories `python/plugins` in the *app data directories*.
For more information on app data directories, especially their precedence order, see [this table](https://albertlauncher.github.io/gettingstarted/faq/#where-are-cache-config-and-data-files-stored).

When loaded, the *Python plugins plugin* (the native plugin that provides the Python interface) scans the *Python plugin directories* for available *Python plugins*. 
Since identifiers have to be unique, duplicate plugins with the same identifier (module name) are skipped.

## Writing Python plugins

A minimal working example of a Python plugin according to the interface specification looks like this:

```python
import albert

md_iid = '3.0'
md_version = '1.0'
md_name = 'Fancy Plugin'
md_description = 'Do fancy things'

class Plugin(albert.PluginInstance):
    pass
```

{: .note}
Due to the different type systems, multiple inheritance of extension interfaces is not supported.
However, multiple extensions can be added using `albert.PluginInstance.(de)registerExtension`.

## What's next?

From here on it depends on the interface you want to implement.
- Read the [Python stub file]. 
- See the [official Python plugins][1] for reference.
- In case of questions see the [C++ API](/reference/namespacealbert.html). 
- Join the [community chats](/help#community-chat).
- Build something cool and share it.

[Python stub file]: https://github.com/albertlauncher/plugins/blob/main/python/albert.pyi
[1]: https://github.com/albertlauncher/python
