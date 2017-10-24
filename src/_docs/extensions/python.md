---
layout: docs
title: Python extension
permalink: /docs/extensions/python/
---

The Python extension makes the application extendable by embedding Python modules. Since the name of the native extension providing this functionality is "Python extension" and a Python modules in this context is called "Python extension" too, this article refers to the Python extensions by using the term *Python modules*. A Python module must have a specific interface to be applicable as extension. The interface uses classes which are defined in the builtin `albertv0` module. Check the relevant sections below.

The extension interface and the built-in albert module are _not_ final. They are prototypes and intended to be improved on user feedback.


## Extension interface (0.1)

The extension interface is a versioned protocol that describes how the Python extension interacts with the Python modules. The current interface identifier is "PythonInterface/v0.1". The interface currently comprises the following:

##### `handleQuery(Query)`
Mandatory function. This is the crucial part of a Python module. When the user types a query, this function is called with a query object representing the current query execution.

##### `initialize()`
Optional function. This function is called when the extension is loaded.

##### `finalize()`
Optional function. This function is called when the extension is unloaded.

##### `__iid__`
Mandatory variable (string). This variable has to hold the interface version the extension implements.

##### `__prettyname__`
Optional variable (string). This variable should hold the pretty name of the extension. This string will be displayed to the user.

##### `__version__`
Optional variable (string). This variable should hold the version of the extension. This string will be displayed to the user. The versioning scheme should follow the [semantic versioning](http://semver.org).

##### `__trigger__`
Optional variable (string). If this extension should be run exclusively, this variable has to hold the trigger that causes the extension to be executed.

##### `__author__`
Optional variable (string). This variable should hold the name of the author of the extension.

##### `__dependencies__`
Optional variable (list of strings). This string should contain any dependencies the extension need to be used.


## Api reference - The `albertv0` module

The Python API exposes several functions and classes for use with Albert.

### The `Query` class

The query class represents a query execution. It holds the necessary information to handle a Query. It is passed to the handleQuery function. It holds the following read-only properties.

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
