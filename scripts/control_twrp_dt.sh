#!/usr/bin/bash
echo "Searching for the TWRP device tree..."
cd /home/Auto-Dumper/twrp-device-tree
check_dt=$(basename BoardConfig.mk)
if [ ! -f "$check_dt" ]; then
  echo "The TWRP compatible device tree has not been created.";
  echo "Pushing Canceled."
  exit;
fi;
echo "A TWRP compatible device tree has been created."
echo "Pushing..."
sudo rm -rf .git
g_init=$(git init)
if [ ! -f "$g_init" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS device tree already uploaded."
  exit;
fi;
g_branch=$(git branch -M android-${{ env.AV }})
if [ ! -f "$g_branch" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS device tree already uploaded."
  exit;
fi;
g_remote=$(git remote add origin https://${{ secrets.GITLAB_TOKEN_NAME }}:${{ secrets.GITLAB_TOKEN }}@gitlab.com/${{ env.UN }}/twrp_device_${{ env.DB }}_${{ env.DCN }}.git)
if [ ! -f "$g_remote" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS device tree already uploaded."
  exit;
fi;
g_add=$(git add .)
if [ ! -f "$g_add" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
g_commit=$(git commit -s -m "${{ env.DCN }}: TWRP compatible device tree")
if [ ! -f "$g_commit" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
g_upload=$(git push -u origin android-${{ env.AV }})
if [ ! -f "$g_upload" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump and LineageOS tree already uploaded."
  exit;
fi;
echo "Succesfull."
cd /home/Auto-Dumper
