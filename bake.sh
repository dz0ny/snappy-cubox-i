#!/bin/bash
rm -rf snappy_package
cp -r snappy_defaults snappy_package
bash get_gcc.sh
bash prepare_kernel.sh
bash compile_kernel.sh
bash compile_uboot.sh
echo "tar cfJ device.tar.xz -C snappy_package/ ."