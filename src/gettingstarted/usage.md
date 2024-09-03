---
title: Usage
parent: Getting started
nav_order: 1
---

# {{ page.title }}
{: .no_toc }

- TOC
{:toc}

There are currently two official interfaces: 
The 'Widgets Box Modeland the 'QML Box Model'.
The former uses the Qt Widgets Toolkit, prioritizing resource efficiency and low-latency UIs but has limitations considering customization.
The latter, built on QML, provides rich customization features, but suffers glitches on some systems.
Since both interfaces have the same design concept this guide applies to both of them (Please report a bug if not).

## Input line 

Besides its primary function, the input line provides an input hint and contains the settings button.
The input hint, displayed after the entered text, varies based on the context.
For empty triggered queries, it shows the query handler's synopsis, if available, otherwhise it shows the input action text of the selected item, if available, or is empty.
The settings button, located in the top right corner, appears on hover or when the current query is processing.

## Input history search

The content entered into the input line is stored in the input history when the window is hidden. 
This input history can be used to search former queries.
When the input has been manually altered, it functions as a pattern for substring matching within the history entries.
The empty pattern matches any entry (browsing instead of search).
When the results list is hidden or the first item is selected <kbd>⬆</kbd> searches the input history.
When holding <kbd>Shift</kbd> this condition is not required and <kbd>⬇</kbd> can be used too for bidirectional iteration. 

## Results list

The results list displays results of a query. 
Each item has an icon, a title and a description. 
Almost all items have at least one action associated, which can be directly activated.
Most items provide several actions that can be activated using the action list.
Items may also provide an input action text that can be used to replace the input text. 
Its semantic is loosely defined. 
It may be a completion but also an evaluation or something else.

The results list has three states: Hidden, show matches and show fallbacks.
If a query yields matches it shows the matches.
If a global query yields no matches it shows the fallbacks.
If a triggered query yields no matches it stays hidden.
The fallbacks state can also be activated explicitly.

## Key map

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

## TODO
{: .no_toc }

- Input action (completion, evaluation, …)
- Items and actions
- Fallbacks
