#!/usr/bin/bash
# Check all trees
check_los_dt=$(basename lineage-device-tree)
if [ -f "$check_los_dt" ]; then
  cp -r lineage-device-tree /home/Auto-Dumper
     if [ ! -f "$check_los_dt" ]; then
        echo "No LineageOS compatible device tree found. Copying has been cancelled."
     fi;
fi;
check_tw_dt=$(basename twrp-device-tree)
if [ -f "$check_tw_dt" ]; then
  cp -r twrp-device-tree /home/Auto-Dumper
     if [ ! -f "$check_tw_dt" ]; then
        echo "No TWRP compatible device tree found. Copying has been cancelled.";
     fi;
fi;
