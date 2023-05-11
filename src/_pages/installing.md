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

## Using official Albert repositories

Prebuilt binaries are hosted at Open Build Service. Visit the [OBS software repo](https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert), choose your distribution and follow the instructions to add the official repository. If the list is lacking one of the latest distributions join the chats and let us know. 

## Building from source

Building from sources is the least convenient, but most flexible way. This way is usually for developers only. If you are able you probably know what you have to do. The build process is trivial, but you have to manage the dependencies on your own. See the [OBS package specs](https://build.opensuse.org/package/show/home:manuelschneid3r/albert) for up to date build and runtime dependencies.

```bash
git clone --recursive https://github.com/albertlauncher/albert.git
cd albert
cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
cmake --build build
cmake --install build
```
