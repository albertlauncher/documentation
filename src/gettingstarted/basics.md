---
title: Basics
parent: Getting started
nav_order: 1
---

# {{ page.title }}
{: .no_toc }

- TOC
{:toc}


## Plugins

A **plugin** is a physical module that can be loaded/unloaded at runtime.
It could be native or provided by plugin provider plugins.
Nested plugins are accessible when their provider is loaded.

Users can **enable**/**disable** and **load**/**unload** plugins via the plugins tab in the settings 
or using the built-in plugin query handler. 
Enabled plugins load automatically at launch.
Plugins with graphical interfaces for configuration can be accessed via the plugins tab in the settings.

Each plugin has an identifier.
Plugin providers search multiple implementation- and platform-specific plugin paths.
The search order proceeds from user-specific to system-wide locations.
The **first plugin found for an identifier is used**.


## Extensions 

An **extension** is a logical unit extending the app with a particular functionality.
Each plugin can provide multiple *extension implementations* and expose its own *extension interfaces*.
More on this topic can be found in the [Extension](/gettingstarted/extension/) section


## Queries

There are three built-in extension interfaces that handle user input:

If the query starts with a trigger of a **trigger query handler extension**,
the query is handled _exclusively_ by the corresponding handler.
This allows the handler to _set an inline input hint_, _asynchronously add match items_ and as such _define their order_.

If the query does _not_ start with a trigger,
the query is handled by all enabled **global query handler extensions** in _parallel_
and eventually the match items are _merged_ and _sorted by match and usage score_.

In any case the enabled **fallback handler extensions** provide a separate set of _fallbacks items_, 
which are displayed when the matches are empty or when the user explicitly requests them.


## Result items

Besides the obvious **icon**, **title** and **description**,
each item provides a **list of actions** the user can execute.
Items may also define an **input action text**,
which is used to replace the current input on input action activation.
Its semantics are loosely defined; it may be a completion, an evaluation, or something else.


## User interface

<picture>
  <source srcset="/img/ui_dark.png" media="(prefers-color-scheme: dark)">
  <img src="/img/ui_light.png" alt="Logo">
</picture>

Besides its primary function, the input line displays the *input action text* and *input hint* and contains the *settings button*.
If the input starts with a **trigger** of a trigger query handler, it is highlighted.
If available the **input action text** of the currently selected item will be displayed right beside your input.
Hit <kbd>Tab</kbd> to replace the current input with it.
If space permits, the **input hint** of the query handler will be displayed right-aligned in the input box.
The **settings button** is appears on the right side of the input line if you hover over it 
or if a query a query is being processed.
Left-clicking opens the **settings window**, while right-clicking shows a context menu.

The manually entered text of the input line is stored in the **input history** when the window is hidden. 
This input history can be used to search and browse your past input.
Holding <kbd>Shift</kbd> enables **input history navigation** for <kbd>⬆</kbd> and <kbd>⬇</kbd> no matter which item is selected.
When the results list is hidden or the first item is selected <kbd>⬆</kbd> works without holding <kbd>Shift</kbd>.

If enabled, the (manually set) input text is used for **input history search**.
Input history navigation then only shows input history entries matching the input text.

The results list displays **result items** of a query.
Hold and release <kbd>Super⌃</kbd> to switch between **match items** and **fallback items**.

Result items can have multiple associated *actions*.
The **default action**   of an item is activated by pressing <kbd>Return</kbd> or <kbd>Enter</kbd>.
To display the list of **alternative actions** of an item <kbd>Ctrl⌘</kbd>+<kbd>Return</kbd> or hold <kbd>Alt⌥</kbd> .

As a reference the following table lists the keys you can use to control Albert:

| Key                                                                                                 | Action                                                                    |
|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| <kbd>Esc</kbd>                                                                                      | Hide the window.                                                          |
| <kbd>Alt⌥ (Hold)</kbd><br><kbd>Ctrl⌘</kbd>+<kbd>Return</kbd>                                          | Show actions.                                                             |
| <kbd>Super⌃ (Hold)</kbd>                                                                              | Show fallbacks.                                                           |
| <kbd>Shift</kbd>+<kbd>⬆</kbd>                                                                       | Next entry in input history.                                              |
| <kbd>Shift</kbd>+<kbd>⬇</kbd>                                                                       | Previous entry in input history.                                          |
| <kbd>Tab</kbd>                                                                                      | Activate input action of the selected item (evaluation, completion, etc). |
| <kbd>Return</kbd>,<kbd>Ctrl⌘</kbd>+<kbd>O</kbd>                                                      | Activate item.                                                            |
| <kbd>Shift</kbd>+<kbd>Return</kbd>                                                                  | Insert new line.                                                          |
| <kbd>Ctrl⌘</kbd>+<kbd>Shift</kbd>+<kbd>Return</kbd><br><kbd>Ctrl⌘</kbd>+<kbd>Shift</kbd>+<kbd>O</kbd> | Activate item but do not hide.                                            |
| <kbd>Ctrl⌘</kbd>+<kbd>,</kbd>                                                                        | Open settings window.                                                     |
| <kbd>⬆</kbd>,<kbd>⬇</kbd>,<br><kbd>PgUp</kbd>,<kbd>PgDn</kbd>                                       | Navigation in item lists.                                                 |
| <kbd>Alt⌥</kbd>+<kbd>F4</kbd>,<kbd>⌘</kbd>+<kbd>Q</kbd>                                              | Quit Albert (Depends on settings).                                        |
| <kbd>Ctrl⌘</kbd>+<kbd>H</kbd>/<kbd>J</kbd>/<kbd>K</kbd>/<kbd>L</kbd>                                 | Vim bindings. Synthesize to arrows.                                       |
| <kbd>Ctrl⌘</kbd>+<kbd>N</kbd>/<kbd>P</kbd>                                                           | Emacs bindings. Synthesize to arrows.                                     |



 
