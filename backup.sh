#!/bin/sh

### Functions
prepare() {
    for i in etc var usr; do
        [ -d "./$i" ] &&
            rm -rf "./$i"
    done
}

mkdir_check() {
    [ ! -d "$1" ] &&
        mkdir -p "$1"
}

rm_check() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        rm -rf "$1"
    fi
}

dump_dir() {
    mkdir_check ".$1"
    rsync --archive "$1/" ".$1"
}

dump_file() {
    rsync --archive "$1" ".$1"
}

### Prepare
prepare

### Dump
# portage
dump_dir /etc/portage
mkdir_check ./var/lib/portage
dump_file /var/lib/portage/world
dump_file /var/lib/portage/world_sets
rm_check ./etc/portage/bashrc
rm_check ./etc/portage/bashrc.d
rm_check ./etc/portage/make.conf.lto
rm_check ./etc/portage/make.conf.lto.defines
rm_check ./etc/portage/package.cflags
mkdir_check ./etc/portage/package.cflags
dump_file /etc/portage/package.cflags/10-local.conf

# eclean
dump_dir /etc/eclean

# X11
dump_dir /etc/X11/xorg.conf.d

# doas
dump_file /etc/doas.conf

# Python
dump_dir /etc/python-exec

# Kernel
mkdir_check ./usr/src/linux
zcat /proc/config.gz >./usr/src/linux/.config

# Kernel modules
dump_dir /etc/modprobe.d
dump_dir /etc/modules-load.d

# sysctl
dump_dir /etc/sysctl.d
dump_file /etc/sysctl.conf

# OpenRC
dump_dir /etc/runlevels
dump_dir /etc/conf.d

# udev
dump_dir /etc/udev/rules.d
dump_file /etc/udev/udev.conf

# env.d
dump_dir /etc/env.d

# fontconfig
dump_dir /etc/fonts/conf.d

# LMT
mkdir_check ./etc/laptop-mode
dump_file /etc/laptop-mode/laptop-mode.conf
mkdir_check ./etc/laptop-mode/conf.d
dump_file /etc/laptop-mode/conf.d/intel-hda-powersave.conf
dump_file /etc/laptop-mode/conf.d/intel-sata-powermgmt.conf
dump_dir /etc/pm

# UPower
dump_dir /etc/UPower

# syslog-ng
mkdir_check ./etc/syslog-ng
dump_file /etc/syslog-ng/syslog-ng.conf

# logrotate
dump_dir /etc/logrotate.d
dump_file /etc/logrotate.conf

# Misc.
dump_file /etc/buildkernel.conf
dump_file /etc/dispatch-conf.conf
dump_file /etc/filesystems
dump_file /etc/fstab
dump_file /etc/fuse.conf
dump_file /etc/genkernel.conf
dump_file /etc/hdparm.conf
dump_file /etc/issue
dump_file /etc/locale.gen
dump_file /etc/login.defs
dump_file /etc/mpd.conf
dump_file /etc/thinkfan.conf
dump_file /etc/timezone
