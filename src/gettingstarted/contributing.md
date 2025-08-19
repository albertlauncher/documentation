---
title: Contributing
parent: Getting started
nav_order: 3
---

# {{ page.title }}
{: .no_toc }

- TOC
{:toc}


## Promotion

- [Star Albert on GitHub](https://github.com/albertlauncher/albert).
- [Star your favorite plugins](https://github.com/orgs/albertlauncher/repositories). Also helps triaging issues. 
- Spread the word on social media.
- Vote on rankings like [alternative.to](https://alternativeto.net/software/albert/about/) and such.


## Code

The **place for official plugin repositories** is the [Albert launcher organization](https://github.com/orgs/albertlauncher/repositories). 
Distributed native plugins are submodules in the [Albert repository plugins directory](https://github.com/albertlauncher/albert/tree/main/plugins).
Python plugins in the [Python repository plugins directory](https://github.com/albertlauncher/albert-plugin-python/tree/main/plugins) respectively.

The **main branch** of a plugin repository represents the latest version 
that is or will be distributed with the application and therefore has to be protected.
Contributions _have to pass peer reviewing_ via pull request.
As such contributors have to work on their own fork and send a PR.
The rationale is to ensure 

- Safety. For users and developers.
- Simplicity. Upstream main branch is reviewed and distributable.
- Tidiness. `git status` is clean or contains approved plugin changes.

To **add new plugins** from scratch 

1. Request the creation of a repository (in the [community chat](/gettingstarted/help/)). 
2. Fork the repository to your account. 
3. Work on on the fork. 
4. Send a pull request to the upstream repository. 
5. Go through the review process until approved. 

To **work on existing plugins** start at step 2.
Discuss your planned changes with the maintainer of the plugin before.

For a plugin repository to be accepted it has to satisfy the following **requirements**:
- The project is **licensed under a permissive open source license** (e.g. MIT, Apache, BSD). 
- The project has an **active maintainer**. 
- The repository **content is essential** to the functionality of the plugin. Keep in mind that in future somebody else may want to maintain the plugin and for distribution the size of the repository should be minimal. 
- Icons are **vector graphics** or **128x128 raster images**.

Having a _concise_ `README.md` summarizing features, requirements, limitations, supported platforms and implementation details is recommended.

If you have questions join the [community chats](/gettingstarted help/) and ask for help.


## Reviews

Reviews are extremely important to ensure the quality of the code and the safety of users and developers.
Reviews have always been a bottleneck in the past, so **we are looking for more reviewers**.

You could review [open pull requests](https://github.com/issues/assigned?q=is%3Apr%20state%3Aopen%20org%3Aalbertlauncher) any time or
join the [reviewer teams](https://github.com/orgs/albertlauncher/teams).
Three random members of the reviewer team teams will be assigned on new pull requests of _any_ (new) plugin.
Leave a message with your GitHub username to get an invite.

If you want to help with just some particular plugins, consider becoming a maintainer instead (see below).


## Maintenance

If you are using a plugin a lot and have basic programming skills you are probably a good plugin maintainer.
As passive maintainer you can help by using the plugin, reporting issues and sending pull requests containing fixes and features.
As an active/official maintainer you will be assigned on new issues and pull requests.
A maintainer is implicitly a reviewer of its plugin.
To opt-in as active maintainer send a pull request adding your GitHub username to the maintainers array of the plugin metadata.
Revert to opt-out.



<!--## Changes to the core application

Currently the core app is source available and proprietary.
Changes have to be well thought out, since they often have unwanted side effects.
Lots of additions had to be reverted in the past. 
I learned my lessons and will not merge contributions carelessly.
Probably you will not have fun matching my standards of defensive code.
If you still want to work on the core, be sure to get in touch with me _before_ starting.


## Translations

Albert and the native plugins are fully internationalized.
Unfortunately there is no streamlined localization flow yet. 
Currently the translations go directly into the (sub)projects.
So you have to commit to each plugin separately.
Future plan is to have a separate repository for the translations.-->


## Documentation

Each page on the website contains an _'Edit this page on GitHub'_ link in the footer that you can use to send improvements.
The API reference is generated from source code, in particular the header files of the public API.
To improve the API reference, send a pull request with the changes to the header files in the `include` directory in the [Albert repository](https://github.com/albertlauncher/albert/tree/main/include/albert).


## Appreciation

Support me ([@manuelschneider](https://github.com/ManuelSchneid3r)) as a creator by [becoming a sponsor or donating](/donation/).
Do not forget the authors and maintainers of your most beloved plugins. 
Check their GitHub profiles for donation links.
