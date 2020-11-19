---
layout: docs
title: Python
permalink: /python/
---

The Python extension makes the application extendable by embedding Python modules. Since the name of the native extension providing this functionality is *Python extension* and a Python module in this context is called *Python extension* too, this article refers to the Python extensions by using the term *Python modules*.

In the settings of the Python extension you can find a list of installed Python extensions. This list with checkboxes works similar to the list of native extensions. Check the box of a Python module to automatically load it when the Python extension gets initialized. The icon represents the loading status. Dash means unloaded, the green checkmark stands for a successfully loaded module and a red cross indicates an error while loading the extension. In this case you can hover over the item to check its tooltip. There you find any error messages. You can also run Albert from terminal to check for error output.

## Known issues

The Python interpreter shuts down when the Python extension is unloaded. After this, enabling the extension will restart the interpreter. Some modules cannot be re-initialized safely and may cause segfaults after the interpreter has been restarted (numpy!). The issue is that Python itself cannot completely unload extension modules and there are several caveats with regard to interpreter restarting. In short, not all memory may be freed, either due to Python reference cycles or user-created global data. All the details can be found in the CPython documentation.

## Development

How the Python extension interacts with Python modules is defined in the versioned interface specifications. Devs interested in writing extensions should check the ([current interface specification (v0)](/python/v0/)).

## Deployment

The extension checks its data directories for a directory called `modules`. The name of a data directory is the id of the extension. In the case of the Python extension this is `org.albert.extension.python`. The data directories reside in the data directories of the application defined by [Qt](http://doc.qt.io/qt-5/qstandardpaths.html#StandardLocation-enum). Hence on linux the modules would be looked up in the following directories (in this order):

```
~/.local/share/albert/org.albert.extension.python/modules
/usr/local/share/albert/org.albert.extension.python/modules
/usr/share/albert/org.albert.extension.python/modules
```

Ids are guaranteed to be unique. This means that if several of those paths contain a plugins with identical ids, the first plugin found will be used.

## Getting started (on Linux)

This example should get you started developing a Python module to extend the functionality of Albert. For more extension examples, see the [albert Python extensions repository](https://github.com/albertlauncher/python).

1. Duplicate the folder `~/.local/share/albert/org.albert.extension.python/modules/api-test`
1. Rename the module but stay consistent with the conventions.
1. Open Albert settings and navigate to Extensions > Python
1. If your module is not listed, reload the Python extension or restart Albert
1. Enable your module (Check the checkbox) next to your extension
1. Create your extension. The Python extension reloads modules on file changes.

Before you code check the Pull Requests. Maybe somebody had your idea already. Finally dont hesitate to share your extension!
