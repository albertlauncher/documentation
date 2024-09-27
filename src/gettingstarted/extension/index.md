---
title: Extension
parent: Getting started
nav_order: 2
has_children: true
has_toc: false
---

# Writing extensions

Albert can be extended by writing native C++/Qt plugins or Python plugins.
A quick comparison:

- [Native plugins](/gettingstarted/extension/cplusplus):
  - Performance and power of C++.
  - Access to Qt and its eventloop.
  - Dynamic config widgets.
- [Python plugins](/gettingstarted/extension/python):
  - Simplicity of Python.
  - Rapid prototyping.
  - Easy to distribute/share.
  - Only a subset of the internal API.


## General considerations and best practices

### How to version plugins

If it has a public API `major.minor.patch` else `minor.patch`.
Increase major if the API breaks.
Increase minor if the API got some backward compatible additions or the user experiences noticable changes.
In all other cases increase patch.

### Avoiding name conflicts of extension identifiers

If your plugin provides multiple extensions it's a good idea to prepend the plugin id to the extension id to avoid name conflicts of extensions, e.g. `files.root_browser`.
The root extension is fine to match the plugin id.

