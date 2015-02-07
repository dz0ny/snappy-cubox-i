#!/bin/bash
BASE=$(pwd)
cd ./snappy_package/system/lib/modules/3.14.14/kernel
find . -type f -follow -printf "%P\n" | fgrep -vf $BASE/MANIFEST \
| sort | uniq -u | xargs rm -r
cd $BASE

du -hsc snappy_package
cd snappy_package
tar -zcvf ../device.tar.xz .[^.]* ..?* *
cd $BASE