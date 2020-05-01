# portage-config

Portage configuration (and more) for my Gentoo installation on Thinkpad T420.

Configuration is done to make myself a close-to-perfect system for daily use. The main focuses for this build were to make the system as minimal and easy to develop on.

## Installation

Just copy the files you need to your `/etc/portage` directory.

To replicate package stack installed on my system you could replace `/var/lib/portage/world` with the respective file from this repository.

For kernel configuration refer to `.config` file in the root of this repository.

Make sure to change any host-specific configuraiton, otherwise you may end up with unusable (or even onbootable) system.

## Internals

* Gentoo profile is `default/linux/amd64/17.1/systemd`.
* `sys-kernel/pf-sources` is the only kernel build I have and use. Usually the latest availible version.
* Disk includes two partitions: EFI and LVM on LUKS parition split to contain `/`, `/home` and `[SWAP]` paritions.
* Init system is `sys-apps/systemd`. Because resistance is futile.
* Management of booting process, initramfs and kernel builds is done via `sys-kernel/buildkernel` from [sakaki-tools](https://github.com/sakaki-/sakaki-tools) overlay.
* `CFLAGS` are configured to the basic and safe `-march=native -O2 -pipe`
* `app-portage/fetchcommandwrapper` in conjunction with `net-misc/aria2` is used for Gentoo tree retrieval.
* `app-portage/layman` is used for overlay management.
* `ACCEPT_KEYWORDS` are configured to support unstable builds by default.
* `ACCEPT_LICENSE` only includes FSF-approved licenses with a few exclusions.
* Language support is enabled only for English with minor per-package support for Russian, German, French and Japanese.
* Prioritisation of non-bundled (`system-*`) libraries is enabled globally.
* No auditing or SELinux is enabled. A few kernel-level mitigations are present.
* Installation is GTK-free. The only graphical framework present is Qt5.
* Support for both ALSA and PulseAudio is enabled gobally. OSS stripped.
* `ld.gold` is the default linker.
* Both LLVM and GCC toolchain are installed and configured for developement environment (C/C++).
* Haskell-related packages are pulled from [gentoo-haskell](https://github.com/gentoo-haskell/gentoo-haskell) overlay.
* Latest stable Python versions are enabled globally.
* Basic ROS developement environment support.
* Heavy usage of `savedconfig` and live patching. Thanks Gentoo for these amazing features!

## Contact

For any questions and suggestions please ping __azahi__ at Rizon or Freenode. Or send me an email at `azahi@teknik.io`.

Plese do not submit PRs or issues here. This is not a developement repository!
