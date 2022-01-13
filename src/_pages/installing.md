---
layout: docs
title: Installing
permalink: /installing/
---
**A word of warning**: There are a lot of unofficial packages and repository sources around. These are build by third parties and may contain malicious code! Please make sure to use only the sources mentioned here to install albert.

<!--1. [Using your package manager and the official repositories of your distribution](#using-distribution-repositories)-->
1. [Using your package manager and the official albert repositories ](#using-official-albert-repositories)
1. [Using your package manager to install a package manually](#using-official-albert-packages)
1. [Building and installing Albert from sources](#from-source)

Using a package manager is highly recommended, since it is less error prone and the necessary dependencies are pulled automatically.

<!--## Using distribution repositories
* [Arch Linux](https://www.archlinux.org/packages/community/x86_64/albert/) `pacman -S albert`
* [Void Linux](https://github.com/void-linux/void-packages/tree/master/srcpkgs/albert) `xbps-install albert`
* [FreeBSD](https://svnweb.freebsd.org/ports/head/x11/albert/) `# TODO`
* [openSUSE](https://software.opensuse.org/package/albert) `zypper install albert`
* [Gentoo](https://packages.gentoo.org/packages/x11-misc/albert) `emerge --ask x11-misc/albert`
-->

## Using official albert repositories

For all other distros or simply if you want to receive updates as soon as they are pushed on github, you can use the prebuilt binaries hosted at [Open Build Service](https://de.wikipedia.org/wiki/Open_Build_Service). OBS is a platform designed to compile packages for multiple Linux distributions and simplifies the packaging process, so developers can more easily package a single program for many distributions. Whenever GitHub receives a tag, a webhook starts the compilation, packaging and publishing for several distributions on OBS. Finally the Albert package is public in the repos of OBS, and can be pulled by package managers.

Before you can use this repo you have to add a keyfile to your package manager, which is used to verify the integrity of the packages it later receives. For details see [debian.org](https://wiki.debian.org/SecureApt#How_to_tell_apt_what_to_trust) and [redhat.com](https://access.redhat.com/documentation/en-us/red_hat_network/5.0.0/html/client_configuration_guide/ch-gpg-keys). Keep in mind that the key has an expiration date and you have to repeat this process every few years. Depending on your package manager this step varies.

For RPM based package managers:
```bash
sudo rpm --import "https://build.opensuse.org/projects/home:manuelschneid3r/public_key"
```

For DEB based package managers:
```bash
curl "https://build.opensuse.org/projects/home:manuelschneid3r/public_key" | sudo apt-key add -
```

To tell your package manager to use the OBS repo, you have to give it a link to the correct repo matching your distribution. Note that, if you are using derived distributions, you have to use the distribution, which your OS is based on. I.e., using Linux Mint 20, you have to use the xUbuntu_20.04 repository, since [Linux Mint 20 is based on Ubuntu 20.04](https://en.wikipedia.org/wiki/Linux_Mint_version_history#Release_history).

To find the link of the distribution you need visit [the OBS software repo](https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert) and follow the instructions there. There you will find the remaining steps you have to run in your terminal to add the repo and install albert. If there are some popular distributions or recent versions of them missing, leave a note in the community chat.

These steps have to be done only once. From now on Albert will be updated like any other package on your system.

Example for Ubuntu 21.10:
```bash
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_21.10/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_21.10/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert
```

Example for Fedora 34
```bash
sudo rpm --import https://build.opensuse.org/projects/home:manuelschneid3r/public_key
dnf config-manager --add-repo https://download.opensuse.org/repositories/home:manuelschneid3r/Fedora_34/home:manuelschneid3r.repo
dnf install albert
```
## From source

Building from sources is the least convenient, but most flexible way. This way is usually for developers only. If you are able you probably know what you have to do. The build process is trivial, but you have to manage the dependencies on your own. See the [docker images](https://github.com/albertlauncher/albert/tree/master/.docker) for reference.

### Compilation

To configure, build and install run the following commands:

```bash
git clone --recursive https://github.com/albertlauncher/albert.git
mkdir albert-build
cd albert-build
cmake ../albert -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
make
sudo make install
```
