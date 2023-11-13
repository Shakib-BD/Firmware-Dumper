#!/usr/bin/bash
echo "Searching for system partition..."
check_sys=$(basename system);
if [ ! -f "$check_sys" ]; then;
   echo "WARNING: System partition not found!";
   unset check_sys;
fi;

if [ ! -f "$check_vendor" ]; then;
   echo "WARNING: Vendor partition not found!";
   unset check_vendor;
fi;

check_cust=$(basename cust);
if [ ! -f "$check_cust" ]; then;
   echo "WARNING: Cust partition not found!";
   unset check_cust;
fi;

check_product=$(basename product);
if [ ! -f "$check_product" ] then;
   echo "WARNING: Product partition not found!";
   unset check_product;
fi;

echo "Compress started...";
echo "Empty folders are cleared...";
find /home/Auto-Dumper/DumprX/out -type d -empty -exec rm -rf {} \; -print
echo "Creating the first part of the dump to be compressed...";
comp_partfirst=$(tar -cJvf dump_${{ env.DB }}_${{ env.DCN }}_part1.tar.xz --ignore-failed-read -W none system vendor *.img *.txt *.sha1 README.md);
if [ ! -f "$comp_partfirst" ]; then;
   echo "An error occurred while compressing the first part!";
   unset comp_partfirst;
   exit;
fi;

echo "Moving the first part...";
move_partfirst=$(mv -v dump_${{ env.DB }}_${{ env.DCN }}_part1.tar.xz /home/Auto-Dumper);
if [ ! -f "$move_partfirst" ]; then;
   echo "An error occurred while moving the first part!";
   unset comp_partfirst;
   unset move_partfirst;
   exit;
fi;

echo "After the first part compression, unnecessary files are deleted...";
sudo rm -rf system;
sudo rm -rf vendor;
sudo rm -rf README.md;
sudo rm -rf *.txt;
sudo rm -rf *.sha1;
sudo rm -rf *.img;
echo "Creating the two part of the dump to be compressed...";
comp_parttwo=$(tar -cJvf dump_${{ env.DB }}_${{ env.DCN }}_part2.tar.xz --ignore-failed-read -W none *);
if [ ! -f "$comp_parttwo" ]; then;
   echo "An error occurred while compressing the two part!";
   unset comp_partfirst;
   unset move_partfirst;
   unset comp_parttwo;
   exit;
fi;

echo "Moving the two part...";
move_parttwo=$(mv -v dump_${{ env.DB }}_${{ env.DCN }}_part2.tar.xz /home/Auto-Dumper);
if [ ! -f "$move_parttwo" ]; then;
   echo "An error occurred while moving the two part!";
   unset comp_partfirst;
   unset move_partfirst;
   unset comp_parttwo;
   unset move_parttwo;
   exit;
fi;

echo "Unnecessary old files are deleted...";
cd /home/Auto-Dumper;
delete=$(sudo rm -rf DumprX);
if [ ! -f "$delete" ]; then;
   echo "An error occurred while deleting unnecessary files!";
   unset comp_partfirst;
   unset move_partfirst;
   unset comp_parttwo;
   unset move_parttwo:
   unset delete;
   exit;
fi;

   unset comp_partfirst
   unset move_partfirst
   unset comp_parttwo
   unset move_parttwo
   unset delete
