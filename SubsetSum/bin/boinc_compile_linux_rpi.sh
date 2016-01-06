#!/bin/bash

# COMPILE BOINC WITH:
#_autosetup
#./configure --disable-client --disable-server LDFLAGS=-static-libgcc CFLAGS=-ftree-vectorize CXXFLAGS=-ftree-vectorize FFLAGS=-ftree-vectorize
#make
#ln -s `g++ -print-file-name=libstdc++.a`
#make

# g++ version in use
GPP='4.9'

# SubsetSum version
VERSION=0.16

PLATFORM=arm-unknown-linux-gnueabihf

# All march, mtune, mcpu give less performances

#OPTS='-mcpu=arm1176jz-s -mfloat-abi=hard -mfpu=vfp'

OPTS='-march=armv6zk -mtune=arm1176jz-s -mfloat-abi=hard -mfpu=vfp'

HERE=$(pwd)
cd ../../subset_sum_at_home/client/

g++ -DVERSION=$VERSION $OPTS -O3 -ftree-vectorize -funroll-loops -static-libgcc -Wall \
-DVERBOSE -DENABLE_CHECKPOINTING -DFALSE_ONLY -D_BOINC_ -D__STDC_LIMIT_MACROS \
-I../../boinc -I../../boinc/api -I../../boinc/lib \
subset_sum_main.cpp ../common/binary_output.cpp ../common/n_choose_k.cpp ../common/generate_subsets.cpp \
-o $HERE/SubsetSum_${VERSION}_$PLATFORM -L../../boinc/lib -L../../boinc/api \
/usr/lib/gcc/arm-linux-gnueabihf/${GPP}/libstdc++.a -lboinc_api -lboinc -pthread

cd $HERE

