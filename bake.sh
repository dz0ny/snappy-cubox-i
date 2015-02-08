#!/bin/bash
rm -rf snappy_package
cp -r snappy_defaults snappy_package
mkimage -C none -A arm -T script -d snappy_defaults/boot/boot.scr snappy_package/boot/boot.scr 
bash get_gcc.sh
bash prepare_kernel.sh
bash compile_kernel.sh
bash compile_uboot.sh
bash package.sh
