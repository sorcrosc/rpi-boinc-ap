#!/bin/bash

for app in bin/pc*;do


# clean file of old runs
rm -f boinc_lockfile stderr.txt

# input data
#   * input/experiments.csv
#   * input/tile.txt

# results stored in
#   * output/
echo $app
time $app input/tile.txt output/output.txt 0.05 1 393
echo

done
