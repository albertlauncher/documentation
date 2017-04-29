---
layout: docs
title: Files extension
permalink: /docs/extensions/files/
---

The files extension  offers several ways to access files through Albert.

This indexes the files in the given directory by their name.

> TODO be more specific

Further the files extension provides a way to browse through paths that are _not_ indexed. Queries that begin with either `/` or `~/` are interpreted as a beginning of a path and the extension lists the files in this directory. In combination with the tab completions this is a nice way to browse the file system.


Albert v0.11.0 is all about the files extension. The new release finally allows a fine-grained control of the MIME types to be indexed by the files extension. In the settings of the files extension the _Advanced_ button in the _Indexed MIME types_ group box opens a dialog which allows the user to set wildcard patterns that are used to match against the MIME types of the indexed files. Hopefully this is a partial solution for [#1](https://github.com/albertlauncher/albert/issues/1) for some of you too.

Extensions can now have multiple triggers. An example of multiple triggers is the files extension: A prefix of `/` or `~` triggers the files extension in browse mode.

The sorting algorithm is now stable. This means that items that are equal regarding their sorting order are now displayed in the order they were added to the results.

Based on this the browse mode now lists the results in lexicographical order with directories before the files.

Additionally the use of fallbacks have been disabled for triggered queries. The rationale behind this decision is that the user implicitly tells that he want something special, not a general fallback.

All of the changes above make the files browse mode extremely convenient and clutter free.

Further the files extension provides now a way to browse through paths that are _not_ indexed. Queries that begin with either `/` or `~/` are interpreted as a beginning of a path and the extension lists the files in this directory. In combination with the tab completions this is a nice way to browse the file system.
