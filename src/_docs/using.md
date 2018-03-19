---
layout: docs
title: Using Albert
permalink: /docs/using/
---

To get up and running just run `albert` in terminal and press the hotkey (which is configured upon install) to start using it. When albert is running you can configure or quit the application via the tray icon. To make albert autostart checkout [Troubleshooting](/docs/faq).

As you would expect from a launcher, the main use case is to type a query into an input box and finally to interact with some sort of results. Actually there is not much more Albert allows you to do - triggering things. No more, no less.

By pressing the hotkey the launcher is shown and the focused input line awaits a query. If you press <kbd>Esc</kbd> or the hotkey again or if the window looses focus, the window hides. The query entered in the input box is delegated to a set of plugins, which in turn return items that are somehow related to the query.

While typing a query Albert instantly shows the results in a vertical list below the input box. These results can be browsed like a regular list view. With the keys <kbd>⬆</kbd> and <kbd>⬇</kbd> the selection can be moved a single item, <kbd>PgUp</kbd> and <kbd>PgDn</kbd> moves the selection by the amount of visible items, <kbd>Ctrl</kbd> + <kbd>Home</kbd> and <kbd>Ctrl</kbd> + <kbd>End</kbd> moves the selection to the first and last item respectively. You have to hold <kbd>Ctrl</kbd> since the input line has precedence. If you found the item you are looking for, you can run its associated action by activating the item with <kbd>⏎</kbd>, <kbd>Enter</kbd> or a mouse click.

If a query yielded no results, several fallback items are provided. Fallback items are items that can handle every query, e.g. an item that opens an external search engine like google in your browser or your local dictionary application.

Items can have multiple alternative actions. By holding <kbd>Alt</kbd> a list containing the alternative actions shows up. As long as this list is visible the arrow up and down keys move the cursor in this list. Release <kbd>Alt</kbd> to return to the result items - the action list disappears.

Holding <kbd>Meta</kbd> can be used as a shortcut for the default fallback action. Holding <kbd>Meta</kbd> while activating an item runs the 1<sup>st</sup> fallback item with the entered query.

Albert stores the input query when you activate an item. If the item selection is on the first item, the <kbd>⬆</kbd> is overloaded to iterate over this history. The arrow down key is reserved for moving the selection, however in combination with the <kbd>Ctrl</kbd> key the arrow keys can be used to navigate the history back and forth. The history is sorted chronologically and duplicates are removed.

In the input box a little gear is spinning. If you left click on this gear, the settings dialog will appear. Alternatively you can simply hit <kbd>Ctrl</kbd> + <kbd>,</kbd> or <kbd>Alt</kbd> + <kbd>,</kbd> to open the settings dialog. A right click opens a context menu offering some actions including the
"Quit" action. Clicking this item will quit the application. Alternatively you
can quit the application by hitting <kbd>Alt</kbd> + <kbd>F4</kbd>.

For reference the following table lists all keys you can use to control Albert:

Key  | Action
------------- | -------------
<kbd>Esc</kbd> | Hide Albert
<kbd>Alt</kbd>  | Hold to show alternative actions for the item
<kbd>Enter</kbd> | Activate the primary action of selected item
<kbd>Meta/Win</kbd> + <kbd>⏎</kbd><br><kbd>Meta/Win</kbd> + <kbd>Enter</kbd> | Activate the 1<sup>st</sup> fallback item with the query
<kbd>Ctrl</kbd> + <kbd>,</kbd><br><kbd>Alt</kbd> + <kbd>,</kbd> | Show the settings dialog
<kbd>⬆</kbd>,<kbd>⬇</kbd>,<br><kbd>PgUp</kbd>,<kbd>PgDn</kbd>,<br><kbd>Ctrl</kbd> + <kbd>Home</kbd>,<br><kbd>Ctrl</kbd> + <kbd>End</kbd> | Navigation in the results list. If the first item is selected, <kbd>⬆</kbd> iterates though the query history.
<kbd>Ctrl</kbd> + <kbd>⬆</kbd><br><kbd>Ctrl</kbd> + <kbd>⬇</kbd> | Navigate in query history
<kbd>Alt</kbd> + <kbd>F4</kbd> | Quit Albert

## The extensions

From the user perspective the application consists of the launcher, which is the main window, the settings window and the tray icon if you enabled it. However under the hood Albert has a plugin based architecture, which allows the user to modify or extend the functionality of the application.
There are several extensions that get shipped together with the main albert core.

- [Applications](/docs/extensions/applications/)
- [Calculator](/docs/extensions/calculator/)
- [Chromium](/docs/extensions/chromium/)
- [External extensions](/docs/extensions/external/)
- [Files](/docs/extensions/files/)
- Firefox
- Hash generator
- Key value store
- [MPRIS](/docs/extensions/mpris/)
- [Python](/docs/extensions/python/)
- [Secure Shell](/docs/extensions/ssh/)
- System
- Terminal
- [VirtualBox](/docs/extensions/virtualbox/)
- [Websearch](/docs/extensions/websearch/)

## The frontends

- QML BoxModel
- Widgets BoxModel
