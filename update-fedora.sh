#!/bin/bash
#
# Script for complex update Fedora Workstation
# Created by Yevgeniy Goncharov, https://sys-adm.in
#

# Auto update
dnf update -y

# Check the akmod packages and rebuilds them if needed
akmods --force

# Create initial ramdisk images for preloading modules
dracut -f /boot/initramfs-$(uname -r).img $(uname -r)

# Reboot yes / no
echo -en "reboot(y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
  echo "System will be reboot..."
  reboot
else
  echo -e "You system is updated. Please reboot in future. Bye..."
  exit 1
fi