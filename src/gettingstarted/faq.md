---
title: FAQ
parent: Getting started
nav_order: 5
---

# Frequently asked questions
{: .no_toc }

- TOC
{:toc}


## Wayland

### XWayland

Wayland comes with a _lot_ of [limitations](https://gist.github.com/probonopd/9feb7c20257af5dd915e3a9f2d1f2277).
Some can be mitigated by using XWayland.

```bash
# Do not set QT_QPA_PLATFORM as it will propagate to launched apps
albert --platform xcb
```

{: .note }
Currently the shipped desktop entry does this for you.


### Hotkeys

Wayland hotkey adoption is still in its [infancy](https://dec05eba.com/2024/03/29/wayland-global-hotkeys-shortcut-is-mostly-useless/).
A general solution is to let your desktop environment handle the hotkey registration.
Bind the hotkey to the command you want it to run, e.g. 

```bash 
albert toggle
```

- [Gnome help](https://help.gnome.org/users/gnome-help/stable/keyboard-shortcuts-set.html.en)
- [KDE documentation](https://docs.kde.org/stable5/en/khelpcenter/fundamentals/shortcuts.html)
- You are welcome to improve this list. 

The above runs a new app instance, which is relatively heavy.
Another approach is to pipe the command you want to send directly into the albert IPC socket.

```bash
# Before 0.28.0 the string to send was "toggle".

# Using socat
echo -n '["toggle"]' | socat - ~/.cache/albert/ipc_socket

# Using netcat-openbsd
echo -n '["toggle"]' | nc -U ~/.cache/albert/ipc_socket
```

{: .note }
Gnome does not invoke a shell for bindings. Use ```sh -c "<command line>"```.


### Window rules

Wayland does not allow to set window properties like on any other platforms.
There some of the window settings have no effect.
Some compositors allow configuring the window properties in their settings.

- [KDE](https://docs.kde.org/stable5/en/kwin/kcontrol/windowspecific/index.html)
- On Gnome your best bet is probably [GNOME Window Rules extension](https://help.gnome.org/users/gnome-help/stable/windows-properties.html.en).


## How to open with a particular text?

```bash
albert show "trigger "
```

## Where are cache, config and data files stored?

According to [QStandardPaths](https://doc.qt.io/qt-6/qstandardpaths.html#StandardLocation-enum) base directories are:

|           | Linux/BSD                                                                                | MacOS                                                                                                                    |
|-----------|------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Cache | 👨🏼‍💻 `~/.cache/albert`                                                                | 👨🏼‍💻 `~/Library/Caches/albert`<br>💻 `/Library/Caches/albert`                                                         |
| Config | 👨🏼‍💻 `~/.config/albert`<br>💻 `/etc/xdg/albert`                                       | 👨🏼‍💻 `~/Library/Preferences/albert`                                                                                   |
| Data      | 👨🏼‍💻 `~/.local/share/albert`<br>💻 `/usr/local/share/albert`<br>💻 `/usr/share/albert` | 👨🏼‍💻 `~/Library/Application Support/albert`<br>💻 `/Library/Application Support/albert`<br>💻 `<APPDIR>/../Resources` |

Albert places its data in the base directories root.
Plugins use subdirectories named by their identifier.
In case of multiple directories the directories are considered in the given order. 
Users may change the contents of the user 👨🏼‍💻 directories (manually or by using the app).
Do not touch app/vendor 💻 directories!

{: .note}
Note that environment variables may change these base directories on XDG platforms.
See [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/index.html) for more information.
  

## How to get GNOME platform integration (auto dark mode)?

{: .note }
Since Qt6.4 automatic dark mode should at least work as expected for the main window.

Install [QGnomePlatform](https://github.com/FedoraQt/QGnomePlatform).
QGnomePlatform project is unmaintained and no longer actively developed, however there is nothing else providing that good integration (afaik).
Note that QGnomePlatform sets styles and such (read [more](https://jgrulich.cz/2023/03/08/explained-qgnomeplatform-and-adwaita-qt/#QGnomePlatform)).
So using `QT_STYLE_OVERRIDE`/`--style` may not work as expected. Run Albert using:

```bash
# Do not set QT_QPA_PLATFORMTHEME as it will propagate to launched apps
albert --platformtheme gnome
```


## How to use a custom app/tray icon?

```bash
mkdir -p "~/.local/share/icons/hicolor/scalable/apps/"

# Overwrite the default app icon
cp <your-icon>.svg "~/.local/share/icons/hicolor/scalable/apps/albert.svg"

# Overwrite the default tray icon
cp <your-icon>.svg "~/.local/share/icons/hicolor/scalable/apps/albert-tray.svg"
```


## How to get debug logs?

```bash
# Enable _all_ albert logs
QT_LOGGING_RULES='albert*=true' albert

# Enable all albert logs of a particular plugin
QT_LOGGING_RULES='albert.python*=true' albert

# Enable _all_ logs (albert + qt)
QT_LOGGING_RULES='*=true' albert

# Enable _all_ logs (albert + qt) with additional plugin debug info
QT_LOGGING_RULES='*=true' QT_DEBUG_PLUGINS=1 albert

# Debug DBus
QT_LOGGING_RULES='default*=true' QDBUS_DEBUG=1 
```


## How's it going?

- [Star history compared](https://star-history.com/#albertlauncher/albert&cerebroapp/cerebro&Ulauncher/Ulauncher&davatorium/rofi&Date)
- [GitHub Release Stats](https://tooomm.github.io/github-release-stats/?username=albertlauncher&repository=albert)
