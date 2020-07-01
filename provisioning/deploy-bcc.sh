#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


echo "=============================Arch - AUR - Source bcc============================================================"

pacman -Syu --noconfirm #Update and upgrade  all packages on the system
pacman -S --noconfirm git

#https://nanxiao.me/en/install-bcc-on-archlinux/
#https://github.com/iovisor/bcc/blob/master/INSTALL.md#arch---aur
git clone https://github.com/iovisor/bcc.git
mkdir bcc/build; cd bcc/build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
make install

pacman -S linux-headers
which bcc

ls -lai /usr/share/bcc
export MANPATH=/usr/share/bcc/man:$MANPATH
export PATH=/usr/share/bcc/tools:$PATH
