---
layout: docs
title: Installing
permalink: /installing/
---
**A word of warning**:
<br>
Unofficial packages and repository sources may contain malicious code!
<br>
Please make sure to use the sources mentioned here to install albert.

## Using official albert repositories

Prebuilt binaries are [hosted at Open Build Service](https://build.opensuse.org/package/show/home:manuelschneid3r/albert). Visit the [OBS software repo](https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert), choose your distribution and follow the instructions to add the official repository.

Keep in mind that the keys for Debian based repositories have an expiration date and have to be reimported to extend it. 

## Building from source

Building from sources is the least convenient, but most flexible way. This way is usually for developers only. If you are able you probably know what you have to do. The build process is trivial, but you have to manage the dependencies on your own. See the [docker images](https://github.com/albertlauncher/albert/tree/master/.docker) for reference.

```bash
git clone --recursive https://github.com/albertlauncher/albert.git
mkdir albert-build
cd albert-build
cmake ../albert -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
make
sudo make install
```
