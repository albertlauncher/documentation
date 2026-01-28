---
title: From source
parent: Installation
nav_order: 2
---

# From source

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
