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
- [Star your favorite plugins](https://github.com/orgs/albertlauncher/repositories).
- Spread the word on social media.
- Vote on rankings like [alternative.to](https://alternativeto.net/software/albert/about/), [slant](https://www.slant.co/topics/3945/~app-launchers-for-unix-like-systems) and such.

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

1. Request the creation of a repository (in the [community chat](/gettingstarted/help/))
2. Fork the repository to your account
3. Work on on the fork
4. Send a pull request to the upstream repository
5. Go through the review process until approved

To **work on existing plugins** start at step 2.
Discuss your planned changes with the maintainer of the plugin before.

For a plugin repository to be accepted it has to
be licensed under a permissive open source license (e.g. MIT, Apache, BSD), 
have an active maintainer and 
contain only content essential to the functionality of the plugin.
Having a _concise_ `README.md` summarizing features, requirements, limitations, supported platforms and implementation details is recommended.
If you have questions join the [community chats](/gettingstarted/help/) and ask for help.

## Reviews

Your efforts helps plugins being shipped _faster_. 
You can review [current pull requests](https://github.com/issues/assigned?q=is%3Apr%20state%3Aopen%20org%3Aalbertlauncher) directly any time.
You can also join the [reviewer teams](https://github.com/orgs/albertlauncher/teams).
These teams will be assigned on new pull requests and as such you will get a notification.
Leave a message with your GitHub username to get an invite.

## Maintenance

Lots of plugins do not have a maintainer.
If you are using a plugin a lot and have C++ or Python skills you are probably a good plugin maintainer. 
Just send a PR adding your GitHub username to the maintainers array of the plugin metadata and you're in.
Revert it to step back. 
If you are a maintainer you will be assigned on new issues and pull requests.

<!--
## Changes to the core application

Currently the core app is source available and proprietary.
Changes have to be well thought out, since they often have unwanted side effects.
Lots of additions had to be reverted in the past. 
I learned my lessons and will not merge contributions carelessly.
Probably you will not have fun matching my standards of defensive code.
If you still want to work on the core, be sure to get in touch with me _before_ starting.
-->

## Translations

Albert and the native plugins are fully internationalized.
Unfortunately there is no streamlined localization flow yet. 
Currently the translations go directly into the (sub)projects.
So you have to commit to each plugin separately.
Future plan is to have a separate repository for the translations.

## Documentation

As a non native speaker I am sure there are lots of mistakes on the website and the API reference. 
Each page on the website contains an 'Edit this page on GitHub' link in the footer that you can use to send improvements.
The API reference is generated from source code, in particular the header files of the public API.

## Appreciation

Support me as a creator by [becoming a sponsor or donating](/donation/) some bucks.
