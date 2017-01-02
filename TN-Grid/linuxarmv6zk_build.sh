#!/bin/bash

# This script assume that the PC++(pc-boinc) and boinc are in beside folders

# Configure boinc for crosscompile
# ./configure --host=arm-unknown-linux-gnueabihf  --disable-server --disable-manager --disable-client --enable-optimize CFLAGS='-ftree-vectorize' CXXFLAGS='-ftree-vectorize' LDFLAGS=-static-libgcc CC=armv6zk-rpi-linux-gnueabihf-gcc CXX=armv6zk-rpi-linux-gnueabihf-g++

echo "*****************************"
echo "* BUILD PC++ (BOINC) armv6zk (rpi1) *"
echo "*****************************"

cd ../pc-boinc/src

export CXX=armv6zk-rpi-linux-gnueabihf-g++
export CC=armv6zk-rpi-linux-gnueabihf-gcc

# crosstool-ng -march=armv6zk -mtune=arm1176jz-s -mfpu=vfp
# armv6zk-rpi-linux-gnueabihf.config for this configuration. Rename as .config
export EXECUTABLE=pc_armv6zk_vfp ARCH='-march=armv6zk -mtune=arm1176jz-s -mfpu=vfp -mfloat-abi=hard'

ln -sf $($CXX -print-file-name=libstdc++.a)
make -f ../../gene_pc/Makefile_arm clean
make -f ../../gene_pc/Makefile_arm

mv ../bin/pc* ../../gene_pc/bin/
cd -
