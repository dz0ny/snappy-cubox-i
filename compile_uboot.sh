#!/bin/bash
export PATH=${PATH}:$(pwd)/gcc/bin
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
if [ ! -d "uboot" ]; then 
	git clone git@github.com:SolidRun/u-boot-imx6.git uboot --depth=1
	cd uboot
	patch -p1 --no-backup-if-mismatch < ../patches/uboot-snappy.patch
	patch -p1 --no-backup-if-mismatch < ../patches/uboot-source-addr-missing.patch
	patch -p1 --no-backup-if-mismatch < ../patches/uboot-fatwrite.patch
	patch -p1 --no-backup-if-mismatch < ../patches/uboot-snappy-boot.patch
else
	cd uboot
fi

make clean
make mx6_cubox-i_config
make
cp SPL ../snappy_package/flashtool-assets/cubox-i/
cp u-boot.img ../snappy_package/flashtool-assets/cubox-i/