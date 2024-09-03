---
title: Python
parent: Extension
grand_parent: Getting started
nav_order: 1
---

# Writing Python plugins

A Python plugin is a Python module with an interface specified in the [Python stub file] of the embedded `albert` module.
A minimal working example of a Python plugin:

```python
import albert

md_iid = '2.4'
md_version = '1.0'
md_name = 'My Plugin'
md_description = 'Does fancy things'

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