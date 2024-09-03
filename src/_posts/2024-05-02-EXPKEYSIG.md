---
title:  "GPG error: Signatures invalid: EXPKEYSIG"
date: 2024-05-02 18:00
---

# {{ page.title }}

*tl;dr* (But keep in mind that that the key will expire again in future)

```sh
curl -fsSL "https://build.opensuse.org/projects/home:manuelschneid3r/signing_keys/download?kind=gpg" | gpg --dearmor > /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg
```

If you have Albert installed and recently tried to update your system you probably ran into this error:

```
# apt update
Hit:1 http://ports.ubuntu.com/ubuntu-ports jammy InRelease
Get:2 http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.10  InRelease [1557 B]
Hit:3 http://ports.ubuntu.com/ubuntu-ports jammy-updates InRelease
Hit:4 http://ports.ubuntu.com/ubuntu-ports jammy-backports InRelease
Hit:5 http://ports.ubuntu.com/ubuntu-ports jammy-security InRelease
Err:2 http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.10  InRelease
  The following signatures were invalid: EXPKEYSIG 1488EB46E192A257 home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
Reading package lists... Done
W: GPG error: http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.10  InRelease: The following signatures were invalid: EXPKEYSIG 1488EB46E192A257 home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
E: The repository 'http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.10  InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

The per repository key of most repos expired recently:

```
# curl -fsSL "https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key" | gpg --dearmor | gpg --show-keys
pub   rsa2048 2017-10-27 [SC] [expired: 2024-04-29]
      A4B83CD05FDF5C5178482D4A1488EB46E192A257
uid                      home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
```

Open Build Service updates this key only on publish and only if the key is expired.
That's unfortunate because a relase would have to be published as soon as the key expires and users would have to manually add the new key.
One solution would be to ship a dedicated package containing an up to date key.
However that's quite some maintenance work.
Fortunately the guys at OBS offered an alternative solution.
Expiry dates of keys are [soon](https://github.com/openSUSE/open-build-service/pull/16082) user configurable.
Setting the expiry date to some more years than the default two years will make this less of a problem since most users will have set up a new OS by then anyway.
Until the mentioned PR has been merged and the key is still valid for around two years only users of the affected distributions have to run the command above to update the key.
Everything should be fine until 2026-07-11 then.

```
# curl -fsSL "https://build.opensuse.org/projects/home:manuelschneid3r/signing_keys/download?kind=gpg" | gpg --dearmor | gpg --show-keys
pub   rsa2048 2017-10-27 [SC] [expires: 2026-07-11]
      A4B83CD05FDF5C5178482D4A1488EB46E192A257
uid                      home:manuelschneid3r OBS Project <home:manuelschneid3r@build.opensuse.org>
```








