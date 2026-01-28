---
title: Python
parent: Extension
nav_order: 1
---

# Extending Albert using Python
{: .no_toc }

{: .note }
This page focuses on the practical aspects of extending Albert using Python and its peculiarities.
To get an overview of the API refer to the general [extension](/gettingstarted/extension/) section.


## Writing Python plugins

An Albert Python plugin is a Python module having an interface defined in the
[**Albert stub file**](https://github.com/albertlauncher/albert-plugin-python/blob/main/albert.pyi).
At runtime the stub file is written to your *user Python plugin directory*, 
where it serves as inline documentation and coding assistance in your IDE while development.
For reference see the [official Python plugins](https://github.com/albertlauncher/albert-plugin-python/tree/main/plugins).
Also see the [C++ API reference](/reference/topics.html) for details.


<!--## Tutorial-->

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


## Plugin directories

Python plugin directories are the directories at `python/plugins` relative to the
[app data directories](https://albertlauncher.github.io/gettingstarted/faq/#where-are-cache-config-and-data-files-stored).

- **xdg**:
  - `~/.local/share/albert/python/plugins`
  - `/usr/local/share/albert/python/plugins`
  - `/usr/share/albert/python/plugins`
- **macOS**:
  - `~/Library/Application Support/Albert/python/plugins`
  - `/Library/Application Support/Albert/python/plugins`
  - `$BUNDLE_PATH/Contents/PlugIns/python/plugins`


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

