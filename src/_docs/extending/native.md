---
layout: docs
title: Native plugins
permalink: /docs/extending/native/
---

>NOTE: Incomplete. Come back later.


1. Copy the template extension using the script in the plugins folder.
2. Adjust the values in `metadata.json` and `CmakeLists.txt`.
3. Adjust the extension to your liking. Check the extension interface for members that you may or must implement.

Pretty easy, however there are some caveats: Your extension must have a unique id; set it in `metadata.json`. To keep the code readable the main class of the extension is called `Extension` and if the extension returns a configuration widget it shall be called `ConfigWidget`. This is not strictly necessary, your code will run either way, but the intention is to unify the filenames of the plugins. This would implicitly lead to naming conflicts, therefor all classes of an extensions live in a dedicated namespace. Remember to define the namespace in the `*.ui` files, too. Thats it.


## Synchronous and asynchronous queries



All plugins have to provide a [plugin specification](#the-plugin-specification), which is defined in the next section, and have to reside in dedicated directories following a compulsory layout described in the section [plugin deployment](#plugin-deployment).

### The plugin specification

The plugin specification is a mandatory file that has to be shipped with a plugin. Its content is *JSON* formatted and its name has to be *metadata.json*. Its fields give the application information about the plugin without having to load the plugin.

Currently the plugin specification supports the following keys: `id`, `name`, `version`, `platforms`, `authors` and `dependencies`.
- `id` is the unique identifier of the app. A plugin will not be loaded if its id has been registered already by an other plugin.
- `name` is the pretty printed name of the plugin.
- `version` is, well, the version of the plugin.
- `platform` is an array that contains the platforms this plugin is written for.
- `authors` is an array of names of the developers of this plugin.
- `dependencies` is an array of dependencies of this plugin. These dependencies are mandatory for the plugin but optional for the application. The user is responsible to install them.

The different types of plugins may introduce additional keys. Check the related sections.
A plugin specification could look like the following:

```json
{
    "id" :              "org.albert.extension.bookmarks",
    "name" :            "Bookmarks",
    "version" :         "1.1",
    "platforms" :       ["Linux", "Mac", "Windows"],
    "authors" :         ["Manuel Schneider"],
    "dependencies" :    []
}
```
