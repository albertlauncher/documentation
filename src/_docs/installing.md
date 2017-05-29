---
layout: docs
title: Installing Albert
permalink: /docs/installing/
---

There are two ways to get Albert: Using a package manager or building Albert from the sources. Using a package manager is highly recommended, since it is less error prone and the necessary dependencies are pulled automatically.

## Using package managers

<p><font size="3rem" color="red"><i>We are looking for volunteering packagers for the missing distributions!</i></font></p>

Currently Albert is not in any of the major official repositories. At least some user repositories contain it. Hopefully there will be more in future:

###### Archlinux - [AUR](https://aur.archlinux.org/packages/albert/) (Official)
```bash
yaourt albert
```

###### Fedora - COPR ([rabin-io](https://github.com/rabin-io))
```bash
sudo dnf copr enable rabiny/albert
sudo dnf install albert
```

###### Ubuntu - PPA ([hotice](https://github.com/hotice)/[webupd8](http://www.webupd8.org/))
```bash
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install albert
```

###### Debian 8 Jessie ([idkcpp](https://github.com/idkcpp)/[AdminLounge](https://software.adminlounge.org/))
```bash
wget -qO - https://repo.adminlounge.org/archive.key \
    | sudo apt-key add -
sudo echo "deb http://repo.adminlounge.org/ jessie main" \
    > /etc/apt/sources.list.d/adminlounge.list
sudo apt-get update
sudo apt-get install albert
```

## Building from sources

Building from sources is the least convenient, but most flexible way. The build process is trivial, but you have to manage the dependencies on your own. Before you can start building Albert you need some libraries.

### Prerequisites

To build Albert from sources you will need CMake (≥2.8.12) and a C++ compiler supporting at least the C++11 standard. Albert uses the following modules of the Qt toolkit (≥5.5):

- QtCore, QtGui, QtWidgets, QtSQL, QtNetwork from the [Qt Essentials](http://doc.qt.io/qt-5/qtmodules.html#qt-essentials)
- [Qt Concurrent](http://doc.qt.io/qt-5/qtconcurrent-index.html) for threading support
- [Qt X11 Extras](doc.qt.io/qt-5/qtx11extras-index.html) for hotkeys on Linux
- [Qt Svg](http://doc.qt.io/qt-5/qtsvg-index.html) for SVG rendering

Further the plugins may introduce optional dependencies, e.g the calculator plugin needs the [muparser](http://muparser.beltoforion.de/) library. If the optional dependency is not installed the plugin may refuse to load, the core application will run fine though.

Problems may arise with distributions that split submodules into optional dependencies. E.g. Ubuntu is known to split the SQL driver submodules into separate packages. Elementary OS which builds on Ubuntu does not install optional dependencies, users may therefor encounter linkage errors a have to explicitly install the missing dependencies.

Another concern is the difference between compile time and runtime dependencies. Some distributions ship libraries as single packages while others ship a normal package and a *\*-dev* package. Dev packages usually contain the header files and static libraries additionally to the shared libraries. Normal packages are stripped down to the shared libraries. On distributions that do not differ between this kind of packages basically every package is a dev package. For the compilation on e.g. Ubuntu dev packages are needed at compile time but at runtime normal packages are sufficient.

Here are some hints for the package names on some operating systems:

###### Arch Linux
```bash
sudo pacman -S gcc cmake qt5-base qt5-x11extras qt5-svg muparser
```

###### Ubuntu 14.04 and newer
```bash
sudo apt-get install g++ cmake qtbase5-dev libmuparser-dev \
  libqt5x11extras5-dev libqt5svg5-dev libqt5sql5-sqlite
```

### Compilation

To configure, build and install run the following commands:
```bash
git clone https://github.com/albertlauncher/albert.git
mkdir albert-build
cd albert-build
cmake ../albert -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug
make
sudo make install
```

Lets go through them and clarify what they do. The first command clones the Albert git repository to the local file system. Since no destination directory is specified a directory with the name of the repository is created. The next step is to create the out-of-source-build directory. A self-explanatory name is always a good one.

After changing the working directory to the just created build directory the `cmake` command configures the build environment and creates the makefiles. The first positional parameter is the path to the source directory which contains a file called `CMakeLists.txt`. The `-D` parameter sets CMake variables.

The CMake variable `CMAKE_BUILD_TYPE` specifies the build type to use. If you want to report bugs it makes sense to build a `Debug` build, since the build then produces debugging information with which GDB can work. Core dumps of this build can be used to track down issues. Futher the make output is more verbose. If you dont want any of those that use the build type `Release`.

`CMAKE_INSTALL_PREFIX` defines the prefix for the installation directory. This value usually defaults to `/usr/local`. Since albert looks up libraries, plugins and stylefiles etc only `/usr`, `/usr/local` are supported. If you still want to make it work somewhere else, you have to use environment variables to manipulate XDG base dir specs and the lookup paths of the dynamic linker. Do absolutely not do this unless you exactly know what you are doing.

Finally `make` builds the application and `sudo make install` installs the application on your system. Albert is not a portable application so the install step is mandatory.
