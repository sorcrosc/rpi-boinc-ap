#!/bin/bash

# This script assume that the PC++(pc-boinc) and boinc are in beside folders

# Configure boinc for crosscompiling
# ./configure --host=aarch64-linux-gnu --target=aarch64-unknown-linux-gnu --disable-server --disable-manager --disable-client --enable-optimize CFLAGS='-ftree-vectorize' CXXFLAGS='-ftree-vectorize' LDFLAGS='-static-libgcc' CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++

echo "*****************************"
echo "* BUILD PC++ (BOINC) armv8 *"
echo "*****************************"

here=$(pwd)
cd ../pc-boinc/src

export CXX=aarch64-linux-gnu-g++
export CC=aarch64-linux-gnu-gcc

export EXECUTABLE=pc_armv8-a ARCH='-fsigned-char -ftree-vectorize -march=armv8-a -mtune=cortex-a53'

make -f $here/Makefile_arm clean
make -f $here/Makefile_arm

mv ../bin/pc* $here/bin/
cd -
