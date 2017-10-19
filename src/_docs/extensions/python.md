---
layout: docs
title: Python extension
permalink: /docs/extensions/python/
---

The Python plugin makes the application extendable by embedding Python modules.

>Todo nice description

>Todo Api reference

## Deployment

The extension checks its data directories for a directory called `modules`. The name of a data directory is the id of the extension. I the case of the Python extension this is `org.albert.extension.python`. The data directories reside in the data directories of the application defined by [Qt](http://doc.qt.io/qt-5/qstandardpaths.html#StandardLocation-enum). Hence the external extensions would be looked up in the following directories (in this order):

* ~/.local/share/albert/org.albert.extension.python/modules
* /usr/local/share/albert/org.albert.extension.python/modules
* /usr/share/albert/org.albert.extension.python/modules

Ids are guaranteed to be unique. This means that if several of those paths contain a plugins with identical ids, the first plugin found will be used.

# Known issues

The Python interpreter shuts down when the Python extension is unloaded. After this, enabling the extension will restart the interpreter. Some modules can not be re-initialized safely and may cause segfaults after the interpreter has been restarted (numpy!). The issue is that Python itself cannot completely unload extension modules and there are several caveats with regard to interpreter restarting. In short, not all memory may be freed, either due to Python reference cycles or user-created global data. All the details can be found in the CPython documentation.
