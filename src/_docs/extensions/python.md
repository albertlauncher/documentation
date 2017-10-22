---
layout: docs
title: Python extension
permalink: /docs/extensions/python/
---

> TODO: Finish

The Python extension makes the application extendable by embedding Python modules. Since the name of the native extension providing this functionality is "Python extension" and a Python modules in this context is called "Python extension" too, this article refers to the Python extensions by using the term *Python modules*. A Python module must have a specific interface to be applicable as extension. The interface uses classes which are defined in the builtin `albertv0` module. Check the relevant sections below.

## Extension interface 

The extension interface is a versioned protocol that describes how the Python extension interacts with the Python modules. The current interface identifier is "PythonInterface/v0.1". The interface currently comprises the following:

##### `handleQuery(Query)`
Mandatory function

##### `initialize()`
Optional function

##### `finalize()`
Optional function

##### `__iid__`
Mandatory variable (string)

##### `__prettyname__`
Optional variable (string)

##### `__version__`
Optional variable (string)

##### `__trigger__`
Optional variable (string)

##### `__author__`
Optional variable (string)

##### `__dependencies__`
Optional variable (list of strings)

## Api reference - The `albertv0` module

The Python API exposes several fuctions and classes for use with Albert. 

### The `Query` class

The query class is passed to the function handle query. It holds the following read-only properties.

##### `string`

##### `rawString`

##### `trigger`

##### `isTriggered`

##### `isValid`

### Abstract classes

##### `ActionBase`

##### `ItemBase`

##### `Urgency`

### Standard actions

##### `FuncAction`

##### `ClipAction`

##### `UrlAction`

##### `ProcAction`

##### `TermAction`

### The `Item` class

##### `Item(id="", icon=":python_module", text="", subtext="", completion="", urgency=Urgency::Normal, actions=[])`
ctor

##### `id`
variable : string

##### `icon`
variable : string

##### `text`
variable : string

##### `subtext`
variable : string

##### `completion`
variable : string

##### `urgency`
variable : string

##### `addAction(Action)`
Function taking actions

### Free functions

##### `debug(text)`
Logging function

##### `info(text)`
Logging function

##### `warning(text)`
Logging function

##### `critical(text)`
Logging function

##### `iconLookup(iconName)`
Performs xdg icon lookup and returns a path. Empty if nothing found.

## Deployment

The extension checks its data directories for a directory called `modules`. The name of a data directory is the id of the extension. I the case of the Python extension this is `org.albert.extension.python`. The data directories reside in the data directories of the application defined by [Qt](http://doc.qt.io/qt-5/qstandardpaths.html#StandardLocation-enum). Hence the external extensions would be looked up in the following directories (in this order):

* ~/.local/share/albert/org.albert.extension.python/modules
* /usr/local/share/albert/org.albert.extension.python/modules
* /usr/share/albert/org.albert.extension.python/modules

Ids are guaranteed to be unique. This means that if several of those paths contain a plugins with identical ids, the first plugin found will be used.

# Known issues

The Python interpreter shuts down when the Python extension is unloaded. After this, enabling the extension will restart the interpreter. Some modules can not be re-initialized safely and may cause segfaults after the interpreter has been restarted (numpy!). The issue is that Python itself cannot completely unload extension modules and there are several caveats with regard to interpreter restarting. In short, not all memory may be freed, either due to Python reference cycles or user-created global data. All the details can be found in the CPython documentation.
