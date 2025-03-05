---
title: General
parent: Extension
grand_parent: Getting started
nav_order: 0
---

# Extending Albert
{: .no_toc }

{: .note }
This page provides an overview of general concepts. For details of any particular extension interface refer to the respective page.
    
- TOC
{:toc}


### Plugins and extensions

The core of a plugin is the [`PluginInstance`](/reference/classalbert_1_1_plugin_instance.html) class.
It is the interface that every Albert plugin must implement.
The loader of a plugin resolves and instantiates the concrete implementation of this class.
It serves as settings widget and extension factory and provides utility functions for plugins.

[`Extension`](/reference/classalbert_1_1_extension.html) is the polymorphic base class of any kind of extension.
Built on this type the extension system provides a polymorphic extension registry. 
Plugins can implement existing extension interfaces to provide additional functionality,
but also define their own types of extensions and listen for registrations of instances thereof.

The core application offers a set of built-in interfaces that plugins can implement to extend functionality.
The current core app extension interfaces are: 

![img](/reference/classalbert_1_1_Extension__inherit__graph.svg)


Related:
- [`ExtensionPlugin`](/reference/classalbert_1_1_extension_plugin.html):
  Implements the `Extension` interface using the metadata of the plugin instance.
- [`StrongDependency`](/reference/classalbert_1_1_strong_dependency.html)
  Fetches and holds a reference to a mandatory dependency.
- [`WeakDependency`](/reference/classalbert_1_1_weak_dependency.html)
  Fetches and holds a reference to an optional dependency.


### Query handlers

The basic query handling extension are:

- [`TriggerQueryHandler`](/reference/classalbert_1_1_trigger_query_handler.html)
- [`GlobalQueryHandler`](/reference/classalbert_1_1_global_query_handler.html)
- [`FallbackHandler`](/reference/classalbert_1_1_fallback_handler.html)

If you've read the [basics](http://0.0.0.0:4000/gettingstarted/basics/#queries) their purpose should be clear.
All of them provide instances of the [`Item`](/reference/classalbert_1_1_item.html) interface. 
It provides several methods associated with the features of the user interface, 
most notably the item [`Action`](/reference/classalbert_1_1_action.html) factory.


Related:
- [`StandardItem`](/reference/classalbert_1_1_standard_item.html)
  Value-based implementation of the `Item` interface.
- [`RankItem`](/reference/classalbert_1_1_rank_item.html)
  Used by `GlobalQueryHandler` to score matches.
- [`IndexQueryHandler`](/reference/classalbert_1_1_index_query_handler.html)
  Convenience class performing implicit (fuzzy) matching.
- [`IndexItem`](/reference/classalbert_1_1_index_item.html)
  Used by `IndexQueryHandler` to associate an item with a lookup string.
- [`Matcher`](/reference/classalbert_1_1_matcher.html)
  Utility for string matching

### Others interfaces

#### Frontend plugins

- [`Frontend`](/reference/classalbert_1_1_frontend.html)

#### Plugin providers

- [`PluginLoader`](/reference/classalbert_1_1_plugin_loader.html)
- [`PluginProvider`](/reference/classalbert_1_1_plugin_provider.html)

