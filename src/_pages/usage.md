---
layout: docs
title: Usage
permalink: /usage/
---


## Core concepts

As you would expect from a launcher, the main use case is to type a query into an input box and finally to interact with some sort of results. But to use the launcher to the full extent it is good to know some details.

### Plugins

A plugin is a module that can be loaded/unloaded while the launcher is running.
They could be native plugins (shared libraries) or provided by plugin providers, such as Python modules from the Python plugin provider.
Nested plugins are only accessible if their provider is loaded.

Users can enable/disable or load/unload plugins via the Plugins tab in settings or using the built-in plugin query handler.
Enabled plugins load automatically at launch.
Plugins with graphical interfaces for configuration can be accessed via the Plugins tab.
Some plugins offer more detailed usage information there.

### Extensions

Each plugin can provide various [extensions](https://albertlauncher.github.io/reference/classalbert_1_1Extension.html), like frontends, plugin providers, fallback providers or query handlers. 
While frontends and plugin providers are advanced topics, fallback providers, global- and triggered query handlers are central to the app's functionality.

There are two built-in handlers: The app and plugin query handler. They provide items for app control (quit, restart, settings, config, data, cache), plugins (config, load, enable) and boolean properties of any plugins.

### Queries

The core of the app is the query engine which parses user input and decides the mode of a query.
If the query is prefixed by a trigger defined by any of the trigger query handlers the coresponding handler will handle the query exclusively.
This allows the handler to display matches as soon as they are available. 
Queries without triggers are delegated to all global query handlers (multithreaded).
As soon as the handlers finished the matches are sorted by match score and usage history and displayed.
Additionally, fallback handlers offer a separate set of results: the fallback items.

## The user interface

There are currently two official interfaces: 
The 'Widgets Box Modeland the 'QML Box Model'.
The former uses the Qt Widgets Toolkit, prioritizing resource efficiency and low-latency UIs but has limitations considering customization.
The latter, built on QML, provides rich customization features, but suffers glitches on some systems.
Since both interfaces have the same design concept this guide applies to both of them (Please report a bug if not).

### The input line 

Besides its primary function, the input line provides an input hint and contains the settings button.
The input hint, displayed after the entered text, varies based on the context.
For empty triggered queries, it shows the query handler's synopsis, if available, otherwhise it shows the input action text of the selected item, if available, or is empty.
The settings button, located in the top right corner, appears on hover or when the current query is processing.

### The results list

The results list displays results of a query. 
Each item has an icon, a title and a description. 
Almost all items have at least one action associated, which can be activated.
Most items provide several actions that can be activated using the action list.
Items may also provide an input action text that can be used to replace the input text. 
Its semantic is loosely defined. 
It may be a completion but also an evaluation or something else.

The results list has three states: Hidden, show matches and show fallbacks.
If a query yields matches it shows the matches.
If a global query yields no matches it shows the fallbacks.
If a triggered query yields no matches it stays hidden.
The fallbacks state can also be activated explicitly.

### Navigation

Any horizontal navigation is handled by the input line.
Any vertical navigation is handled by the results list or the actions list if activated (unless the input history browse mode is active).

### Input history

The content entered into the input line is stored in the input history when the window is hidden. 
This input history can be used to search former queries.
When the input has been manually altered, it functions as a pattern for substring matching within the history entries.
Note that the empty pattern matches any entry (browsing instead of search).
When the results list is hidden or the first item is selected <kbd>⬆</kbd> searches the input history.
When holding <kbd>Shift</kbd> this condition is not required and <kbd>⬇</kbd> can be used too for bidirectional iteration. 

### Key map

As a reference the following table lists the keys you can use to control Albert:

Key  | Action
------------- | -------------
<kbd>Esc</kbd> | Hide Albert.
Hold <kbd>Alt/⌥</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>⏎</kbd> | Activate action mode.
Hold <kbd>Meta/⌃</kbd> | Activate Fallback mode.
Hold <kbd>Shift</kbd> | Activate history search mode.
<kbd>Tab</kbd> | Activate input action of the selected item (evaluation, completion, etc).
<kbd>⏎</kbd><br><kbd>Enter</kbd><br><kbd>⌘</kbd>+<kbd>O</kbd> | Activate item.
<kbd>Ctrl/⌘</kbd>+<kbd>,</kbd> | Open settings window.
<kbd>⬆</kbd>,<kbd>⬇</kbd>,<br><kbd>PgUp</kbd>,<kbd>PgDn</kbd> | Navigation in item lists.
<kbd>⌘</kbd>+<kbd>Q</kbd><br><kbd>Alt</kbd>+<kbd>F4</kbd> | Quit Albert (Depends on settings).
<kbd>Ctrl/⌘</kbd>+<kbd>H</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>J</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>K</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>L</kbd> | Vim bindings. Synthesize to arrows.
<kbd>Ctrl/⌘</kbd>+<kbd>N</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>P</kbd> | Emacs bindings. Synthesize to arrows.
