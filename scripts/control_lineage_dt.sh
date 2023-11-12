#!/usr/bin/bash
echo "Searching for the LineageOS device tree..."
cd lineage-device-tree
check_dt=$(basename BoardConfig.mk)
if [ ! -f "$check_dt" ]; then
  echo "The LineageOS compatible device tree has not been created.";
  echo "Pushing Canceled."
  exit;
fi;
echo "A LineageOS compatible device tree has been created."
echo "Pushing..."
sudo rm -rf .git
g_init=$(git init)
if [ ! -f "$g_init" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump already uploaded."
  exit;
fi;
g_branch=$(git branch -M lineage-${{ env.DCN }})
if [ ! -f "$g_branch" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump already uploaded."
  exit;
fi;
g_remote=$(git remote add origin https://${{ secrets.GITLAB_TOKEN_NAME }}:${{ secrets.GITLAB_TOKEN }}@gitlab.com/${{ env.UN }}/lineage_device_${{ env.DB }}_${{ env.DCN }}.git)
if [ ! -f "$g_remote" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump already uploaded."
  exit;
fi;
g_add=$(git add .)
if [ ! -f "$g_add" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump already uploaded."
  exit;
fi;
g_commit=$(git commit -s -m "${{ env.DCN }}: LineageOS compatible device tree")
if [ ! -f "$g_commit" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump already uploaded."
  exit;
fi;
g_upload=$(git push -u origin lineage-${{ env.DCN }})
if [ ! -f "$g_upload" ]; then
  echo "Pushing failed!"
  echo "NOTE: Dump already uploaded."
  exit;
fi;
echo "Succesfull."
