#!/bin/bash

for app in bin/pc*;do

# input data
#   * input/experiments.csv
#   * input/tile.txt

# results stored in
#   * output/

echo
echo -\> ${app##*/}
time $app input/tile.txt output/output.txt 0.05 1 393
echo

# clean files of run
rm -f boinc_lockfile boinc_finish_called stderr.txt

done

