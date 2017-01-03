#!/bin/bash

# This script assume that the PC++(pc-boinc) and boinc are in beside folders

# Configure boinc for crosscompiling
# ./configure --host=armv6zk-rpi-linux-gnueabihf --target=arm-unknown-linux-gnueabihf --disable-server --disable-manager --disable-client --enable-optimize CFLAGS='-ftree-vectorize' CXXFLAGS='-ftree-vectorize' LDFLAGS='-static-libgcc' CC=armv6zk-rpi-linux-gnueabihf-gcc CXX=armv6zk-rpi-linux-gnueabihf-g++

echo "*****************************"
echo "* BUILD PC++ (BOINC) armv6zk (rpi1) *"
echo "*****************************"

here=$(pwd)
cd ../pc-boinc/src

export CXX=armv6zk-rpi-linux-gnueabihf-g++
export CC=armv6zk-rpi-linux-gnueabihf-gcc

# crosstool-ng .config file: armv6zk-rpi-linux-gnueabihf.config.
export EXECUTABLE=pc_armv6zk_vfp ARCH='-fsigned-char -ftree-vectorize -march=armv6zk -mtune=arm1176jz-s -mfpu=vfp -mfloat-abi=hard'

make -f $here/Makefile_arm clean
make -f $here/Makefile_arm

mv ../bin/pc* $here/bin/
cd -
