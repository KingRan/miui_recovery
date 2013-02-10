#!/bin/bash
#version:0.1
#author:linkscue@gmail.com
#usage: ./flash_stuttgart.sh

# please copy mkramdsik & mkimage to ~/bin/ derectory.
if [[ `which mkramdisk` == "" ]]; then
    echo "E:please cp mkramdisk & mkimage to ~/bin/"
    exit 1
fi

# assume pwd is miui_recovery/patch_device/stuttagard/stuttagrd_tools
cd ../../../out/patch_device/stuttgart/

echo "1) make ramdisk.gz .."
mkramdisk ramdisk-recovery.img ramdisk.cpio.gz

echo "2) repack boot.img .."
bootimg --repack-bootimg 0x10000000 "" 2048 2048

read -p "---> please reboot device to fastboot mode .."
fastboot flash recovery boot.img
fastboot reboot
cd -
