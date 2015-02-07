#!/bin/bash
if [ ! -d "gcc" ]; then 
	git clone https://github.com/offensive-security/gcc-arm-linux-gnueabihf-4.7  gcc --depth 1
fi

