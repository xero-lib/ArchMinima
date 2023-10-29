#!/usr/bin/env bash

if [ ! command -v arch-chroot &> /dev/null ]
then
	echo "arch-chroot not detected, please ensure you are in the boot environment"
	exit 2;
fi

echo -n "Enter path to desired install disk: "
read TGTDSK

if [ ! -b "$TGTDSK" ]
then
	echo -e "Invalid disk \"$TGTDSK\"\nFormat should be '/dev/<diskID>'"
	exit 2
fi

echo -en "Creating EFI boot (+256MB) swap (+$(lsmem | grep "Total online" | awk '{print $NF}')) and remainder as Linux FS\nStarting fdisk..."

# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can 
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDSK}
  o # clear the in memory partition table
  g # create guid partition table
  n # new partition
    # default - partition 1
    # default - start at beginning of disk
  +256M # 256 MB boot parttion
  t # select type for new partition
  1 # select partition 1 automatically, partition type 1: EFI System
  n # new partition
    # default - partion number 2
    # default - start immediately after preceding partition
  +$(lsmem | grep "Total online" | awk '{print $NF}') # extend swap partition to match the currently installed RAM
  t # select type for new partition
	# default - select partition 2
  19 # partition type 19: Linux swap
  n # new partition
	# default - partition 3
	# default - start immediately after preceding partition
	# default - proceed until end of disk
  t # select type for new partition
	# default - select partition 3
  20 # partition type 20: Linux filesystem
  w # write the partition table, which quits
EOF

mkfs.fat "${TGTDSK}1"
mkswap "${TGTDSK}2"
mkfs.ext4 "${TGTDSK}3"

mount "${TGTDSK}3" /mnt
mount --mkdir "${TGTDSK}1" /mnt/boot
swapon "${TGTDSK}2"

echo -n "Please enter your CPU brand in all lowercase (intel or amd): "
read CPUBRAND

pacstrap -K /mnt base base-devel linux linux-firmware fish grub efibootmgr os-prober wget archlinux-keyring nvidia "${CPUBRAND}-ucode"
genfstab -U /mnt >> /mnt/etc/fstab

cp -vr arch-setup/Scripts /mnt/root
mkdir /mnt/root/media
cp -vr media /mnt/root/media
cp -v arch-setup/arch-config.sh /mnt/root
cp -v arch-setup/user-config.sh /mnt/root

arch-chroot /mnt ~/arch-config.sh

umount -R /mnt
swapoff "${TGTDSK}2"
