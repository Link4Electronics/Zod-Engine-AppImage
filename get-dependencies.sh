#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    libdecor     \
    sdl12-compat \
    sdl_image    \
    sdl_mixer    \
    sdl_ttf

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package gtk2
make-aur-package wxgtk2.8
make-aur-package libmysqlclient

# If the application needs to be manually built that has to be done down here
wget https://master.dl.sourceforge.net/project/zod/linux_releases/zod_linux-2011-09-06.tar.gz
