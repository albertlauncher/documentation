---
title: General
parent: Extension
grand_parent: Getting started
nav_order: 0
---

# Extending Albert
{: .no_toc }

{: .note }
This page provides an overview of general concepts. For details of any particular interface refer to the respective page.
    
- TOC
{:toc}


### Plugins and extensions

The core of a plugin is the [`PluginInstance`](/reference/classalbert_1_1PluginInstance.html) class.
It is the interface that every Albert plugin must implement.
The loader of a plugin resolves and instantiates the concrete implementation of this class.
It serves as settings widget and extension factory and provides utility functions for plugins.

[`Extension`](/reference/classalbert_1_1Extension.html) is the polymorphic base class of any kind of extension.
Built on this type the extension system provides an [`ExtensionRegistry`](/reference/classalbert_1_1ExtensionRegistry.html). 
Plugins can implement existing extension interfaces to provide additional functionality,
but also define their own types of extensions and listen for registrations of instances thereof.

Related classes:

- [`ExtensionPlugin`](/reference/classalbert_1_1ExtensionPlugin.html):
  Implements the `Extension` interface using the metadata of the plugin instance.
- [`StrongDependency`](/reference/classalbert_1_1StrongDependency.html)
  Fetches and holds a reference to a mandatory dependency.
- [`WeakDependency`](/reference/classalbert_1_1WeakDependency.html)
  Fetches and holds a reference to an optional dependency.

The core application offers a set of built-in interfaces that plugins can implement.
The current core app extension interfaces are: 

![img](/reference/classalbert_1_1Extension__inherit__graph.svg)


### Query handlers

The basic query handling extension are:

- [`TriggerQueryHandler`](/reference/classalbert_1_1TriggerQueryHandler.html)
- [`GlobalQueryHandler`](/reference/classalbert_1_1GlobalQueryHandler.html)
- [`FallbackHandler`](/reference/classalbert_1_1FallbackHandler.html)

If you've read the [basics](http://0.0.0.0:4000/gettingstarted/basics/#queries), their purpose should be clear.
All of them provide instances of the [`Item`](/reference/classalbert_1_1Item.html) interface. 
The `Item` interface provides several methods related to  the features of the user interface, 
most notably the [`Action`](/reference/classalbert_1_1Action.html) factory.

The `GlobalQueryHandler` implements the `TriggerQueryHandler` interface.
This is a design decision to simplify the plugin development.

The [`IndexQueryHandler`](/reference/classalbert_1_1IndexQueryHandler.html) implements the `GlobalQueryHandler` interface.
It serves as a convenience class that performs (fuzzy) matching using a 2-gram index.

Related classes:

- [`Query`](/reference/classalbert_1_1Query.html)
  Represents a query execution.
- [`StandardItem`](/reference/classalbert_1_1StandardItem.html)
  Value-based implementation of the `Item` interface.
- [`RankItem`](/reference/classalbert_1_1RankItem.html)
  Used by `GlobalQueryHandler` to return scored matches.
- [`IndexItem`](/reference/classalbert_1_1IndexItem.html)
  Used by `IndexQueryHandler` to associate an item with a lookup string.
- [`Matcher`](/reference/classalbert_1_1Matcher.html)
  Utility for configurable string matching.

### Others interfaces

#### Frontend plugins

- [`Frontend`](/reference/classalbert_1_1Frontend.html)

#### Plugin providers

- [`PluginLoader`](/reference/classalbert_1_1PluginLoader.html)
- [`PluginProvider`](/reference/classalbert_1_1PluginProvider.html)

