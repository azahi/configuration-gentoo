# portage-config

Portage configuration (and more) from my Gentoo installation on Thinkpad T420.

A lot of hours were sunk into configuring this mess to make myself a
close-to-perfect system for daily use. The main two point behind this
work were to make the system as minimal as possible and easy to use as
a daily driver.

## Installation

Just copy everything you need to your `/etc/portage` directory.

To replicate the package stack installed on my system you could replace
`/var/lib/portage/world` with the respective file from this repository.

For kernel configuration refer to `.config` file in the root of this repository.

Make sure to change any host-specific stuff, otherwise you may end up with
unusable (or even unbootable) system.

## Internals

* Gentoo profile is `default/linux/amd64/17.1/systemd`.
* `sys-kernel/pf-sources` is the only Linux flavor I use. Usually the latest
availible version.
* The disk is partitioned in two (GPT): EFI partition for booting and LVM on
LUKS parition split to contain `/`, `/home` and `[SWAP]` volumes.
* Init system is `sys-apps/systemd`. I have a love/hate relationship with it.
So, no comment here.
* Management of the booting process, initramfs generation and kernel building
is done via `sys-kernel/buildkernel` from
[sakaki-tools](https://github.com/sakaki-/sakaki-tools) overlay.
* `CFLAGS` are `-march=native -O2 -pipe`. Nothing really fancy here.
* `ld.gold` is the default linker. The only issue here is the kernel itself
which can be compiled only with `ld.bfd`.
* `app-portage/fetchcommandwrapper` in conjunction with `net-misc/aria2` is used
for Gentoo tree retrieval.
* `app-portage/layman` is used for overlay management.
* `ACCEPT_KEYWORDS` are set to pull unstable ebuilds by default.
* `ACCEPT_LICENSE` only allows FSF-approved licenses with a few exceptions.
* Language support is enabled only for English with a minor per-package support
for Russian, German, French and Japanese.
* Prioritisation of non-bundled (`system-*`) dependencies is enabled globally.
* SELinux is disabled. Auditing support is disabled. A few kernel-level
mitigations are present.
* Installation is GTK-free. The only graphical framework present is Qt5.
* Support for both ALSA and PulseAudio is enabled (almost) gobally. No OSS.
* Both LLVM and GCC toolchains are installed and configured for developement
environment (C/C++).
* Haskell-related packages are pulled strictly from
[gentoo-haskell](https://github.com/gentoo-haskell/gentoo-haskell) overlay
ignoring the main tree.
* Heavy usage of `savedconfig` and live patching.
