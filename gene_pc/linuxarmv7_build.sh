#!/bin/bash

# This script assume that the PC++(pc-boinc) and boinc are in beside folders

# Configure boinc for crosscompile
# ./configure --host=arm-unknown-linux-gnueabihf  --disable-server --disable-manager --disable-client --enable-optimize CFLAGS='-ftree-vectorize' CXXFLAGS='-ftree-vectorize' LDFLAGS=-static-libgcc CC=armv7-unknown-linux-gnueabihf-gcc CXX=armv7-unknown-linux-gnueabihf-g++

echo "*****************************"
echo "* BUILD PC++ (BOINC) armv7 *"
echo "*****************************"

cd ../pc-boinc/src

export CXX=armv7-unknown-linux-gnueabihf-g++
export CC=armv7-unknown-linux-gnueabihf-gcc

# crosstool-ng -march=armv7-a -mtune=cortex-a7 -mfpu=vfpv3
# rename armv7-unknown-linux-gnueabihf.config as .config for crosstool-ng
export EXECUTABLE=pc_armv7_vfpv3 ARCH='-fsigned-char -march=armv7-a -mtune=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard'

# crosstool-ng -march=armv7-a -mtune=cortex-a7 -mfpu=vfpv4-d16
#export EXECUTABLE=pc_armv7_vfpv4-d16 ARCH='-fsigned-char -march=armv7-a -mtune=cortex-a7 -mfpu=vfpv4-d16 -mfloat-abi=hard'

ln -sf $($CXX -print-file-name=libstdc++.a)
make -f ../../gene_pc-boinc/Makefile_arm clean
make -f ../../gene_pc-boinc/Makefile_arm

mv ../bin/pc* ../../gene_pc-boinc/bin/
cd -
