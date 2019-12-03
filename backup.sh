#!/bin/sh

BACKUPDIR="$PWD"

[ ! -d "$BACKUPDIR/etc/portage" ] && \
    mkdir --parents --verbose "$BACKUPDIR/etc/portage"
[ ! -d "$BACKUPDIR/var/lib/portage" ] && \
    mkdir --parents --verbose "$BACKUPDIR/var/lib/portage"

cp --recursive --verbose /etc/portage/* "$BACKUPDIR/etc/portage/"
cp --recursive --verbose /var/lib/portage/world "$BACKUPDIR/var/lib/portage/"
