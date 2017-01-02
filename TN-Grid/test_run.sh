#!/bin/bash

# input data
#   * input/experiments2.csv
#   * input/tile2.txt

# results stored in
#   * output/

[ ! -a input/experiments2.csv ] && echo "unpacking experiments set" && gunzip -k input/experiments2.csv.gz

for app in bin/pc!(*gz); do

echo
echo -\> ${app##*/}
time $app input/tile2.txt output/output2.txt 0.05 1 2470
echo

# clean files of current run
rm -f boinc_lockfile boinc_finish_called stderr.txt

done

