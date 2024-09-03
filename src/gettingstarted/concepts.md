---
title: Concepts
parent: Getting started
nav_order: 0
---

# {{ page.title }}
{: .no_toc }

- TOC
{:toc}

A list of core concepts that help you to grasp things faster.  

## Plugins

A plugin is a module that can be loaded/unloaded while the launcher is running.
They could be native plugins (shared libraries) or provided by plugin providers, such as Python modules from the Python plugin provider.
Nested plugins are only accessible if their provider is loaded.

Users can enable/disable or load/unload plugins via the Plugins tab in settings or using the built-in plugin query handler.
Enabled plugins load automatically at launch.
Plugins with graphical interfaces for configuration can be accessed via the Plugins tab.
Some plugins offer more detailed usage information there.

## Extensions

Each plugin can provide various extensions, like frontends, plugin providers, fallback providers or query handlers. 
While frontends and plugin providers are advanced topics, fallback providers, global- and triggered query handlers are central to the app's functionality.

## Queries

The core of the app is the query engine which parses user input and decides the mode of a query.
If the query is prefixed by a trigger defined by any of the trigger query handlers the coresponding handler will handle the query exclusively.
This allows the handler to display matches as soon as they are available. 
Queries without triggers are delegated to all global query handlers (multithreaded).
As soon as the handlers finished the matches are sorted by match score and usage history and displayed.
Additionally, fallback handlers offer a separate set of results: the fallback items.

## TODO
{: .no_toc }


- Results
  - Matches
  - Fallbacks
- Items
- Actions
- Extension interfaces (Concept and builtins)

If you are missing something here post an issue.