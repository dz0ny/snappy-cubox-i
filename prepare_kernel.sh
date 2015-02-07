#!/bin/bash

if [ ! -d "kernel" ]; then 
	git clone git@github.com:SolidRun/linux-imx6-3.14.git kernel --depth=1
	mkdir -p patches
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=cdf1d7d42c8be81b6fb94ed196962a73e49d5e20" -O patches/1.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=6449590644fd05c469a1b5b821822b6d2e910850" -O patches/2.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=3791236b61d21bfe2251963e06b5d1cf30019095" -O patches/3.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=bf69831c2ea590976cc31d59165912fabf5ece2f" -O patches/4.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=9ef3eeb8ccfbecdebbdc1fd0cc40c30b4949bf35" -O patches/5.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=d2930a4a0320f7dad9dfcf82ead31eb87796e3ac" -O patches/6.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=35d28e36fef0a4554622c83470a6acb948035470" -O patches/7.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=cb7b2b908a0702414139c812c7fd19a048795e02" -O patches/8.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=78d9521b5e287c1ccc300008d903a9e2d9d7591c" -O patches/9.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=a55a83e050916583a53027d60ab2460ff0756c9a" -O patches/10.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=dd0d8e76becd608a21de4c9984144d9ec2446cd9" -O patches/11.patch
	wget "http://kernel.ubuntu.com/git?p=ppisati/ubuntu-vivid.git;a=patch;h=2397f31f6811158a7402ee8b13cc349f0f1a9586" -O patches/12.patch
	wget "https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/linux-imx6-cubox-dt/0001-Bluetooth-allocate-static-minor-for-vhci.patch" -O patches/13.patch
	wget "https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/linux-imx6-cubox-dt/001_cec.patch" -O patches/14.patch
	wget "https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/linux-imx6-cubox-dt/002_cec.patch" -O patches/15.patch
	wget "https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/linux-imx6-cubox-dt/003_cec.patch" -O patches/16.patch
	
	cd kernel
	git rm -rf security/apparmor
	git commit -s -m "UBUNTU: SAUCE: (no-up) apparmor: remove security/apparmor directory"
	patch -p1 --no-backup-if-mismatch < ../patches/1.patch
	patch -p1 --no-backup-if-mismatch < ../patches/2.patch
	patch -p1 --no-backup-if-mismatch < ../patches/3.patch
	patch -p1 --no-backup-if-mismatch < ../patches/4.patch
	patch -p1 --no-backup-if-mismatch < ../patches/5.patch
	patch -p1 --no-backup-if-mismatch < ../patches/6.patch
	patch -p1 --no-backup-if-mismatch < ../patches/7.patch
	patch -p1 --no-backup-if-mismatch < ../patches/8.patch
	patch -p1 --no-backup-if-mismatch < ../patches/9.patch
	patch -p1 --no-backup-if-mismatch < ../patches/10.patch
	patch -p1 --no-backup-if-mismatch < ../patches/11.patch
	patch -p1 --no-backup-if-mismatch < ../patches/12.patch
	git commit -s -m "UBUNTU: SAUCE: Snappy and Core support"
	patch -p1 --no-backup-if-mismatch < ../patches/13.patch
	patch -p1 --no-backup-if-mismatch < ../patches/14.patch
	patch -p1 --no-backup-if-mismatch < ../patches/15.patch
	patch -p1 --no-backup-if-mismatch < ../patches/16.patch
	git commit -s -m "Cubox-i: CEC and BT fixes"
fi

