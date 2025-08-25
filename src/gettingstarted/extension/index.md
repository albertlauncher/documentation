---
title: Extension
parent: Getting started
nav_order: 3
has_children: true
has_toc: false
---

# Writing extensions

{: .note }
Before you start reading the details of extending Albert, make sure you have read the [basics](/gettingstarted/basics).

Albert can be extended using C++ or Python. 
 
- Native [C++ plugins](/gettingstarted/extension/cplusplus) benefit the performance and power of (Obj)C(++)
  and the native access to Qt (Eventloop, translations, the framework itself …).
- [Python plugins](/gettingstarted/extension/python) on the other hand are easier to write and distribute and PyPi has a library for almost everything you can think of.
  However the Albert Python API is a limited subset of the native API and the [GIL](https://wiki.python.org/moin/GlobalInterpreterLock) prevents true parallelism.

## Brief core API overview

Every plugin has to implement the [`PluginInstance`](/reference/classalbert_1_1PluginInstance.html),
which provides a list of [`Extension`](/reference/classalbert_1_1Extension.html) instances.
The built-in extension interfaces related to query handling are:

- [`TriggerQueryHandler`](/reference/classalbert_1_1TriggerQueryHandler.html)
- [`GlobalQueryHandler`](/reference/classalbert_1_1GlobalQueryHandler.html)
- [`FallbackHandler`](/reference/classalbert_1_1FallbackHandler.html)

All query handlers provide instances of the [`Item`](/reference/classalbert_1_1Item.html) interface,
which contains several methods related to the user interface, 
most notably the [`Action`](/reference/classalbert_1_1Action.html) factory.

In addition to the core API, 
utilities facilitate plugin development and help developers to provide users with a streamlined search experience.

- [`util::StandardItem`](/reference/classalbert_1_1StandardItem.html) Value-based `Item` implementation.
- [`util::Matcher`](/reference/classalbert_1_1Matcher.html) Utility for configurable string matching.
- [`util::IndexQueryHandler`](/reference/classalbert_1_1IndexQueryHandler.html) Index-based `GlobalQueryHandler` implementation.

Next, read the section of your prefered API,
build something cool and [share it](/gettingstarted/contributing#code).

