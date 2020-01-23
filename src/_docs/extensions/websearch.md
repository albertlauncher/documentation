---
layout: docs
title: Websearch extension
permalink: /docs/extensions/websearch/
---

This extension lets you define web search engines that you can fire up in your browser with a query string. The web search item shows up when prefixing the query with the trigger string of the search engine, e.g. `gg foobar` shows an item that launches a google search for foobar in your browser. Special about the web search entries is that they can serve as fallback items when the current query did not yield any results too.

The settings widget allows you to add, edit and remove search engines, change the order and restore the default search engines. The order of the engines in this list defines the order of the fallback items. The check mark indicates that the item will show up in the fallback items.

When adding a new search you have to set a name, a trigger and the URL to the search engine containing the string `%s`. The `%s` will be replaced by the query string you entered. Optionally you can set an icon for the search engine.
**When choosing a trigger** keep in mind that it will be handled as a strict prefix, meaning that if your trigger is `trg` (3 chars) and you input is `trg me` (5 chars + space) then the first `trg` is being taken as trigger and the ` me` (2 chars + space) is taken as argument. You probably always want to specify a trigger with trailing space character.
