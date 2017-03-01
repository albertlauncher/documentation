---
layout: docs
title: External plugins
permalink: /docs/extending/external/
---
> Note: Currently the term _extension_ and _plugin_ is used interchangeably

Albert can be extended using regular executables. They are used like plugins, however the executables are separate processes which have separate address spaces. Therefore these executables are called _external plugins_.

An external plugin (hereafter plugin) is basically an executable which has a particular interface. Imagine the plugin as a set of functions that can be dynamically invoked. Which function is invoked, is defined by the environment variable `$ALBERT_OP`. The plugin should read this environment variable and react accordingly. Additionally to the mandatory environment variable `$ALBERT_OP` there may be some other variables defined. Imagine those as the parameters to the dynamic function. The return value of this function is returned to the application through the standard output stream (stdout). Depending on the ALBERT_OP the expected data may differ, but all responses have to be a JSON object containing properties. The set of possible `$ALBERT_OP`s and the expected properties and their structures are defined in the section *Communication protocol*.

To save state between the executions the plugin can return a JSON object called "variables". The properties of the object "variables" will be set as environment variables in the next execution. Note that this properties have to be strings otherwise they will not be set in the environment.

## Communication protocol (v2)

`METADATA`
The application wants to get the metadata of the extension. It should have the
following keys:

* `iid` (string, mandatory)
* `version` (string, defaults to 'N/A')
* `name` (string, defaults to $id)
* `trigger` (string, defaults to 'empty')
* `author` (string, defaults to 'N/A')
* `dependencies` (array of strings, defaults to 'empty')

The interface id `iid` (currently `org.albert.extension.external/v2.0`) tells the application the type and version of the communication protocol . If the `iid` is incompatible this plugin will not show up in the plugins list. The remaining keys should be self-explanatory. Errors in this step are fatal: loading will not be continued.

`INITIALIZE`
The request to initialize the plugin. The plugin should check if all
requirements are met and set the exit code accordingly. (Everything but zero
is an error).
Errors in this step are fatal: loading will not be continued.

`FINALIZE`
The request to finalize the plugin.

`SETUPSESSION`
The request to setup for a session, meaning prepare for user queries.

`TEARDOWNSESSION`
The request to teardown a session.

`QUERY`
The request to handle a query. The environment variable `ALBERT_QUERY` contains
the _complete_ query as the user entered it into the input box, i.e. including
potential triggers.

Return the results by an array "items" containing JSON objects representing the results. A result object has to contain the following entries: `id`, `name`, `description`, `icon` and `actions`.

  - `id` is the plugin wide unique id of the result
  - `name` is the name of the result
  - `description` is the description of the result
  - `icon` is the icon of the result (name or path)
  - `actions` is a array of objects representing the actions for the item.

An object representing an action has to contain the following values: `name`, `command` and `arguments`.

- `name` is the actions name
- `command` is the program to be execute
- `arguments` is an array of parameters for `command`

An example:
```json
{
 "items": [{
   "id":"extension.wide.unique.id",
   "name":"An Item",
   "description":"Nice description.",
   "icon":"/path/to/icon",
   "actions":[{
     "name":"Action name 1",
     "command":"program",
     "arguments":["-a", "-b"]
   },{
     "name":"Action name 2",
     "command":"program2",
     "arguments":["-C", "-D"]
   }]
 }],
 "variables": {
   "some_var":"variable",
   "some_other_var":"cool state"
 }
}
```

## Deployment

Albert looks in the [DataLocation](http://doc.qt.io/qt-5/qstandardpaths.html#StandardLocation-enum) directories of the application for the directory `external`. For the details check the Qt link. As an example on Linux Albert would search the following paths in this order:

* ~/.local/share/albert/external
* /usr/local/share/albert/external
* /usr/share/albert/external

Ids are guaranteed to be unique. This means that if several of those path contain a plugins with identical ids, only the first found plugin will be used.

## Sharing extensions

There is a [community repository]( https://github.com/albertlauncher/external/) for external extension. Currently this repository is not distributed with the app. However you can clone it to your disk to use the extensions. To share your extensions you have to fork it. Read the [README](https://github.com/albertlauncher/external/blob/master/README.md) in the repository for more information.
