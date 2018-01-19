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
