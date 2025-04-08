---
title: Basics
parent: Getting started
nav_order: 1
---

# {{ page.title }}
{: .no_toc }

- TOC
{:toc}

## User interface

The following uses [Qt terminology](https://doc.qt.io/qt-6/qt.html#KeyboardModifier-enum) for modifier key names.
The following table shows the mapping of modifier keys on different keyboards:

| Qt              | Linux/Win       | MacOS                              |
|-----------------|-----------------|------------------------------------|
| <kbd>Ctrl</kbd> | <kbd>Ctrl</kbd> | <kbd>command</kbd> /<kbd>⌘</kbd>   |
| <kbd>Meta</kbd> | <kbd>Win</kbd>  | <kbd>control</kbd> /<kbd>⌃</kbd>   |
| <kbd>Alt</kbd>  | <kbd>Alt</kbd>  | <kbd>option</kbd>  /<kbd>⌥</kbd> |


Besides its primary function, the input line displays the *input action text* and *input hint* and contains the *settings button*.

If available the **input action text** will be displayed right beside your input.
It is provided by the currently selected item in the *results list*.
Its semantics are loosely defined; it may be a completion, an evaluation, or something else.
Hit <kbd>Tab</kbd> to replace the current input with this text.

If space permits, the **input hint** will be displayed right-aligned in the input box.
It serves as a reminder for hard-to-remember synopses.

The **settings button** is located in the top-right corner of the input line.  
It appears on mouse hover and also serves as a **busy indicator**, e.g., when a query is being processed.  
Left-clicking opens the **settings window**, while right-clicking shows a context menu.

The manually entered text of the input line is stored in the **input history** when the window is hidden. 
This input history can be used to search and browse your past input.
When the results list is hidden or the first item is selected <kbd>⬆</kbd> iterates the input history in reverse order.
Holding <kbd>Shift</kbd> enables **input history navigation** for <kbd>⬆</kbd> and <kbd>⬇</kbd> no matter which item is selected. 

If enabled, the (manually set) input text is used for **input history search**.
Input history navigation then only shows input history entries matching the input text.

The results list displays **result items** of a query.
Hold and release <kbd>Meta</kbd> to switch between **match items** and **fallback items**.

Result items can have multiple associated *actions*.
The **default action**   of an item is activated by pressing <kbd>Return</kbd> or <kbd>Enter</kbd>.
To display and navigate the list of **alternative actions** of an item hold <kbd>Alt</kbd> .


### Key map

As a reference the following table lists the keys you can use to control Albert:

| Key                                                                                                 | Action                                                                    |
|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| <kbd>Esc</kbd>                                                                                      | Hide the window.                                                          |
| <kbd>Alt (Hold)</kbd><br><kbd>Ctrl</kbd>+<kbd>Return</kbd>                                          | Show actions.                                                             |
| <kbd>Meta (Hold)</kbd>                                                                              | Show fallbacks.                                                           |
| <kbd>Shift</kbd>+<kbd>⬆</kbd>                                                                       | Next entry in input history.                                              |
| <kbd>Shift</kbd>+<kbd>⬇</kbd>                                                                       | Previous entry in input history.                                          |
| <kbd>Tab</kbd>                                                                                      | Activate input action of the selected item (evaluation, completion, etc). |
| <kbd>Return</kbd>,<kbd>Ctrl</kbd>+<kbd>O</kbd>                                                      | Activate item.                                                            |
| <kbd>Shift</kbd>+<kbd>Return</kbd>                                                                  | Insert new line.                                                          |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Return</kbd><br><kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>O</kbd> | Activate item but do not hide.                                            |
| <kbd>Ctrl</kbd>+<kbd>,</kbd>                                                                        | Open settings window.                                                     |
| <kbd>⬆</kbd>,<kbd>⬇</kbd>,<br><kbd>PgUp</kbd>,<kbd>PgDn</kbd>                                       | Navigation in item lists.                                                 |
| <kbd>Alt</kbd>+<kbd>F4</kbd>,<kbd>⌘</kbd>+<kbd>Q</kbd>                                              | Quit Albert (Depends on settings).                                        |
| <kbd>Ctrl</kbd>+<kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd>                                 | Vim bindings. Synthesize to arrows.                                       |
| <kbd>Ctrl</kbd>+<kbd>N</kbd>/<kbd>P</kbd>                                                           | Emacs bindings. Synthesize to arrows.                                     |


## Plugins and extensions

A **plugin** is a physical module that can be loaded/unloaded at runtime.
It could be native or provided by plugin provider plugins.
Nested plugins are accessible when their provider is loaded.

Users can **enable**/**disable** or **load**/**unload** plugins via the plugins tab in the settings 
or using the built-in plugin query handler. 
Enabled plugins load automatically at launch.
Plugins with graphical interfaces for configuration can be accessed via the plugins tab in the settings.

An **extension** is a logical module that can be used to add functionality to the app.
Each plugin can provide multiple *extension implementations* or even expose its own *extension interfaces*.
More on this topic can be found in the [Extension](/gettingstarted/extension/) section


## Queries

The core of the app is the query engine which parses user input and determines the **mode of a query**.

If the input starts with a trigger of a **trigger query handler**, the query engine instantiates a
**trigger query** execution that is exclusively handled by the corresponding handler.
This allows the handler to *asynchronously* add matches and as such define their *order*.

If the user input does *not* start with a trigger of a trigger query handler, the query engine
instantiates a **global query** execution that executes the enabled **global query handlers** *in parallel* 
and eventually gathers and *sorts* their matches.

Both query executions eventually yield a set of **query matches** which may be empty.

The **fallback handlers** of a query provide a separate set of result items, the **query fallbacks**,
which can handle any string.
They are displayed when no matches were found or when the user explicitly requests them.

