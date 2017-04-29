---
layout: docs
title: Files extension
permalink: /docs/extensions/files/
---

The files extension offers ways to access files through Albert.

You can browse your file system by entering a path or use the offline index to lookup indexed files.

One way to access files is to use the offline index. The extension indexes files that can be accesses by their name. In the settings you can set paths that define where the extension should look for files. In this paths the extension recursively scans for files and indexes them.

You can also exclude directories in the tree of a path by using ignore files. Create a file called `.albertignore` in the folder that contains the files you want to ignore and fill it with their names, one filename per line. The ignores supports [wildcard matching](http://doc.qt.io/qt-5/qregexp.html#wildcard-matching).

You also have fine-grained control over the MIME types that should be indexed. The _Advanced_ button in the settings opens a dialog that lets you set a list of wildcard patterns that are used to match against the MIME types of the indexed files. The check boxes besides the button are shortcuts that let you add or remove the most popular patterns ("audio/\*, video/\*, etc.").

Further the files extension provides a way to browse through paths that are _not_ indexed. Queries that begin with either `/` or `~` are interpreted as a beginning of a path and the extension lists the files in this directory. In combination with the tab completions this is a nice way to browse the file system.
