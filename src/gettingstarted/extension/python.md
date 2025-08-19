---
title: Python
parent: Extension
grand_parent: Getting started
nav_order: 2
---

# Extending Albert using Python
{: .no_toc }

{: .note }
This page focuses on the practical aspects of extending Albert using Python and its peculiarities.
To get a high level overview of common concepts of the API refer to the [general](/gettingstarted/extension/general) section.

- TOC
{:toc}

## The Albert stub file

The Albert Python interface is defined in the [**Albert Python stub file**](https://github.com/albertlauncher/plugins/blob/main/python/albert.pyi).
This file serves as documentation for the embedded `albert` module, and its module docstring describes the interface that makes a Python module an Albert Python plugin.

The stub file is written to your *user Python plugin directory*.
This is also where you are supposed to put your personal plugins.
There the stub file serves as inline documention and coding assistance in your IDE while developing plugins. 

## Python plugin directories

Python plugin directories are the subdirectories `python/plugins` in the *app data directories*.
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

From here on it depends on the interface you want to implement.
Read the [Python stub file](https://github.com/albertlauncher/plugins/blob/main/python/albert.pyi).
In case of questions see the [C++ API](/reference/namespacealbert.html).
See the [official Python plugins](https://github.com/albertlauncher/python) for reference.
The `color` plugin is a concise example to start with.

## Technical notes and limitations

- Due to the different type systems, **multiple virtual inheritance of extension interfaces is not supported**. 
  However, multiple extensions can be added by reimplementing `albert.PluginInstance.extensions()`.
- Python plugin execution is subject to the [Python Global Interpreter Lock (GIL)](https://en.wikipedia.org/wiki/Global_interpreter_lock).
  This means that only one thread can execute Python code at a time.
  This can become a problem for parallelization of queries or multithreaded global queries.
  Long running handlers will introduce noticeable lags. 
  **Do not block** execution in your query handlers, especially not in `handleGlobalQuery`.
  If you can, use `IndexQueryHandler` instead, which performs the handling in C++ space.
- PyBind11 **method resolution does not support mixin behavior**.
  Usually this should not be much of a problem, but there is one prevalent use case:
  Reusing `id`, `name` and `description` of the `PluginInstance` class for your `Extension`. 
  For the sake of minimal boilerplate the mixin behavior is emulated for these methods.
  I.e. if you inherit `PluginInstance` and any `Extension`, you do not have to reimplement these methods.


<!--
## Contributing Python plugins

* [Fork the Python plugins repository](https://github.com/albertlauncher/python/fork).
* Clone your fork into your Python user plugin location.
  ```shell
  git clone https://github.com/<your_username>/python.git "${USER_DATA_DIR}/python/plugins"
  ```
  You can find the `${USER_DATA_DIR}` for your platform in [this table](https://albertlauncher.github.io/gettingstarted/faq/#where-are-cache-config-and-data-files-stored).
* Open the directory in your favorite IDE (PyCharmCE is a good choice).
* Write your plugin.
* Make sure it is polished (No bugs, few to no warnings, efficient, readable, maintainable, …).
* Commit, push, send a PR.
-->