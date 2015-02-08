#!/bin/bash

mkdir -p snappy_package/assets
mkdir -p snappy_package/assets/dtbs
mkdir -p snappy_package/system

export PATH=${PATH}:$(pwd)/gcc/bin
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

cd kernel
touch .scmversion
if [ ! -f ".config" ]; then
	make imx_v7_cbi_hb_defconfig
	scripts/kconfig/merge_config.sh .config arch/arm/configs/snappy/*.config
fi

make -j $(grep -c processor /proc/cpuinfo) zImage imx6q-cubox-i.dtb imx6dl-cubox-i.dtb imx6dl-hummingboard.dtb modules

make modules_install INSTALL_MOD_PATH=../snappy_package/system
cp arch/arm/boot/zImage ../snappy_package/assets/zImage
cp arch/arm/boot/dts/*.dtb ../snappy_package/assets/dtbs