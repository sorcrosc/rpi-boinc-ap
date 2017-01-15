#!/bin/bash

# This script assume that the PC++(pc-boinc) and boinc are in beside folders

# Configure boinc for crosscompiling
# ./configure --host=arm-linux-gnueabihf --target=arm-unknown-linux-gnueabihf --disable-server --disable-manager --disable-client --enable-optimize CFLAGS='-ftree-vectorize' CXXFLAGS='-ftree-vectorize' LDFLAGS='-static-libgcc' CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++

echo "*****************************"
echo "* BUILD PC++ (BOINC) armv7 *"
echo "*****************************"

here=$(pwd)
cd ../pc-boinc/src

export CXX=arm-linux-gnueabihf-g++
export CC=arm-linux-gnueabihf-gcc

export EXECUTABLE=pc_armv7_vfpv3 ARCH='-fsigned-char -ftree-vectorize -march=armv7-a -mtune=cortex-a9 -mfpu=vfpv3-d16 -mfloat-abi=hard'
#export EXECUTABLE=pc_armv7_vfpv4 ARCH='-fsigned-char -ftree-vectorize -march=armv7-a -mtune=cortex-a7 -mfpu=vfpv4 -mfloat-abi=hard'

make -f $here/Makefile_arm clean
make -f $here/Makefile_arm

mv ../bin/pc* $here/bin/
cd -
