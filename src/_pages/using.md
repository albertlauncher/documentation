---
layout: docs
title: Using
permalink: /using/
---


## Core concepts

As you would expect from a launcher, the main use case is to type a query into an input box and finally to interact with some sort of results. But to use the launcher to the full extent it is good to know some details.

### Plugins

Albert is an plugin based keyboard launcher. 
A plugin is a physical module that can be loaded/unloaded at runtime.
This may be a native plugin (which is a shared library) or a plugin provided by a plugin provider.
E.g. a Python plugin (which is a Python module) provided by the Python plugin provider.
Due to this recursive nature nested plugins are available only if their provider is loaded.

Users can enable/disable or load/unload plugins in the `Plugins` tab in the settings or using the plugin items provided by the builtin plugin query handler.
Enabled plugins will be loaded automatically on start.
If a plugin provides a graphical interface for configuration you will find it in the `Plugins` tab.
Use the plugin items to get there quickly.
Some plugins also provide more elaborate usage information there.

### Extensions

Each plugin can provide multiple [extensions](https://albertlauncher.github.io/reference/classalbert_1_1Extension.html).
An extension may be a frontend, a plugin provider, a fallback provider or any of the query handling extensions. 
While frontends and plugin providers are advanced topics, fallback providers, global- and triggered query handlers are central to the purpose of the app.
The next section sheds some light on them.

### Queries

The core of the app is the query engine which parses user input and decides the mode of a query.
If the query is prefixed by a trigger defined by any of the trigger query handlers the coresponding handler will handle the query exclusively.
This allows the handler to display matches as soon as they are available. 
This is a remarkable technical advantage of triggered queries, but there are other reasons why plugins may provide only triggered handlers as well, such as:
Ecology, economy, runtime, amount of output, order more important than content, etc.
If there is no such trigger the query will be delegated to all global query handlers (multithreaded).
As soon as the handlers finished the matches are sorted by match score and usage history and displayed .
In any case a separate set of results, the fallbacks, is provided by fallback handlers.

### Items and actions

TODO…

## The user interface

Note that the frontend is modular and there are currently two official frontends.
The 'Widgets Box Model' is implemented using Qt Widgets Toolkit which allows resource saving, low latency user interfaces, but has limitations considering customization.
The 'QML Box Model' is build using QML (Qt Modeling Language, OpenGL rendering) which provides rich customization features, but suffers glitches on some systems.
Both of them have its strengths and weaknesses so there has not been a clear favorite yet.
Since both frontends have the same design concept this guide should be suitalble for both of them (Please report a bug if not).

### The input line 

Besides the obvious purpose the input line provides the input hint and contains the settings button.

The input hint is displayed after the text you entered.
On empty triggered queries the input hint displays the synopsis of the query handler if it provides any.
Else it displays the text of the input action of the selected item if it provides any.
In all other cases the input hint remains empty.

The settings button is hidden in the top right corner of the input line. 
It shows up if it is hovered by the mouse cursor or the current query is busy processing.

### The results list

The results list displays results of a query. 
Each item has an icon, a title and a description. 
Almost all items have at least one action associated, which can be activated.
Most items provide several actions that can be activated using the action list.

The results list has three states: Hidden, show matches and show fallbacks.
If a query yields matches it shows the matches.
If a global query yields no matches it shows the fallbacks.
If a triggered query yields no matches it stays hidden.
The fallbacks state can also be activated explicitly.

### Navigation

Any horizontal navigation is handled by the input line.
Any vertical navigation is handled by the results list or the actions list if activated (unless the input history browse mode is active).

### Input history

The content of the input line is stored in the input history when the window hides.
This input history can be used to quickly search former queries.
If the input has been changed manually the content serves as pattern for substring matching of the history entries.
Note that the empty pattern matches any former query (browsing instead of search).
When the results list is hidden or the first item is selected <kbd>⬆</kbd> searches the input history.
When holding <kbd>Shift</kbd> this condition is not required and <kbd>⬇</kbd> can be used too for bidirectional browsing 

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
<kbd>Ctrl/⌘</kbd>+<kbd>,</kbd><br><kbd>Alt/⌥</kbd>+<kbd>,</kbd>| Open settings window.
<kbd>⬆</kbd>,<kbd>⬇</kbd>,<br><kbd>PgUp</kbd>,<kbd>PgDn</kbd> | Navigation in item lists.
<kbd>⌘</kbd>+<kbd>Q</kbd><br><kbd>Alt</kbd>+<kbd>F4</kbd> | Quit Albert (Depends on settings).
<kbd>Ctrl/⌘</kbd>+<kbd>H</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>J</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>K</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>L</kbd> | Vim bindings. Synthesize to arrows.
<kbd>Ctrl/⌘</kbd>+<kbd>N</kbd><br><kbd>Ctrl/⌘</kbd>+<kbd>P</kbd> | Emacs bindings. Synthesize to arrows.
