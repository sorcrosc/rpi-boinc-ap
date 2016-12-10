#!/bin/bash

# This script assume that the PC++(pc-boinc) and boinc are in beside folders

# Configure boinc
# ./configure --disable-server --disable-manager --disable-client --with-boinc-alt-platform=arm-unknown-linux-gnueabihf --enable-optimize CFLAGS='-ftree-vectorize' CXXFLAGS='-ftree-vectorize' LDFLAGS=-static-libgcc

echo "*****************************"
echo "* BUILD PC++ (BOINC) armv8 *"
echo "*****************************"

cd ../pc-boinc/src

export CXX=g++
export CC=gcc

export EXECUTABLE=pc_armv8-a ARCH='-march=armv8-a -mtune=cortex-a53'

ln -sf $($CXX -print-file-name=libstdc++.a)
make -f ../../gene_pc/Makefile_arm clean
make -f ../../gene_pc/Makefile_arm

mv ../bin/pc* ../../gene_pc/bin/
cd -
