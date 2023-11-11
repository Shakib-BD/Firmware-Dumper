#!/usr/bin/bash
echo "Searching for the TWRP device tree..."
cd twrp-device-tree
check_dt=$(basename BoardConfig.mk)
if [ ! -f "$check_dt" ]; then
  echo "The TWRP compatible device tree has not been created.";
  echo "Pushing Canceled."
  exit;
fi;
echo "A TWRP compatible device tree has been created."
echo "Pushing..."
g_init=$(git init)
if [ ! -f "$g_init" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
g_branch=$(git branch -M twrp-"${{ env.DCN }}")
if [ ! -f "$g_branch" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
g_add=$(git add .)
if [ ! -f "$g_add" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
g_commit=$(git commit -s -m ""${{ env.DCN }}": TWRP compatible device tree")
if [ ! -f "$g_commit" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
g_upload=$(gh repo create twrp_device_"${{ env.DB }}"_"${{ env.DCN }}" --public --description="TWRP Device tree for ${{ env.DCN }}." --source=. --remote=origin --push)
if [ ! -f "$g_upload" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
echo "Succesfull."
