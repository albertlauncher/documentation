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

## Plugins

The place for official plugin repositories is the [Albert launcher organization](https://github.com/orgs/albertlauncher/repositories). 
Distributed native plugins are submodules in the [Albert repository plugins directory](https://github.com/albertlauncher/albert/tree/main/plugins).
Python plugins in the [Python repository plugins directory](https://github.com/albertlauncher/albert-plugin-python/tree/main/plugins) respectively.
The main branch of each plugin repository represents the latest version of a plugin that is or will be distributed with the application.
Contributions to the main branch _have to pass peer reviewing_.
As such contributors have to work on a branch or their own fork and send a PR.
The rationale for this flow:

- Safety. For users and developers. 
- Simplicity. Upstream main branch is reviewed and distributable.
- Tidiness. No dirty source trees.
- Code quality. Code is compliant to our standards.

Given the above the ownership of the upstream repository has to be transferred to the Albert launcher organization account.
Note that this does not imply that you transfer the ownership of your code. 
According to copyright laws, you wrote the code and hold copyright. 
The code transferred has to be permissive open source licensed (GPL is not permissive).
Once transferred the initial repo has to pass peer reviewing before becoming a submodule.

## Code reviews

Lots of PRs have been stuck in the reviewing pipeline for years because nobody reviewed them.
Your efforts helps plugins being shipped faster. 
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
