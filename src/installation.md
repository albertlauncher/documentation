---
title: Installation
nav_order: 1
---

# {{ page.title }}
{: .no_toc }

- TOC
{:toc}

{: .warning }
Unofficial packages may contain malicious code!
Please make sure to use trusted or official repositories.

## Official packages

Official packages are built and hosted at [Open Build Service](https://build.opensuse.org/package/show/home:manuelschneid3r/albert).
Downloads and installation instructions for the base distributions can be found in the OBS software center.

[Visit OBS software center](https://software.opensuse.org/download/package.iframe?project=home:manuelschneid3r&package=albert&acolor=00cccc&hcolor=00aaaa){: .btn .fs-5}

The Several other distribution can be used with the correct package base:

| Distribution    | Package base                                                                 |
|-----------------|------------------------------------------------------------------------------|
| Elementary OS 7 | Ubuntu 22.04 [ℹ️](https://en.wikipedia.org/wiki/Elementary_OS#Summary_table) |
| Elementary OS 6 | Ubuntu 20.04 [ℹ️](https://en.wikipedia.org/wiki/Elementary_OS#Summary_table) |
| Linux Mint 22   | Ubuntu 24.04 [ℹ️](https://en.wikipedia.org/wiki/Linux_Mint#Releases)         |
| Linux Mint 21   | Ubuntu 22.04 [ℹ️](https://en.wikipedia.org/wiki/Linux_Mint#Releases)         |
| Linux Mint 20   | Ubuntu 20.04 [ℹ️](https://en.wikipedia.org/wiki/Linux_Mint#Releases)         |
| Linux Mint DE 6 | Debian 12.0 [ℹ️](https://en.wikipedia.org/wiki/Linux_Mint#Releases)          |
| Manjaro         | Arch Linux                                                                   |
| PopOS! 22.04    | Ubuntu 22.04 [ℹ️](https://en.wikipedia.org/wiki/Pop!_OS#Release_table)         |
| PopOS! 20.04    | Ubuntu 20.04 [ℹ️](https://en.wikipedia.org/wiki/Pop!_OS#Release_table)         |

{: .note }
Feel free to add missing mappings to this table.


## Unofficial packages

- [ArchLinux AUR](https://aur.archlinux.org/packages/albert)
- [nixOS](https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=albert)

{: .note }
Feel free to add trusted repositories to this list.

## From source

Building and installing from sources is the least convenient, but most flexible way.
This way is usually for developers only.
The build process is trivial, but you have to manage the dependencies on your own.
See the [OBS package specs](https://build.opensuse.org/package/show/home:manuelschneid3r/albert) for up to date build and runtime dependencies.

```bash
git clone --recursive https://github.com/albertlauncher/albert.git
cmake -B build -S albert -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
cmake --build build
cmake --install build
```
