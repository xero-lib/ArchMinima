ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
clear

echo -n "Enter hostname: "
read hostname
echo "$hostname" > /etc/hostname
clear

echo "en_US.UTF-8 UTF-8" > /etc/local.gen
locale-gen

echo -n "Setting root password..."
passwd 

groupadd uucp 
groupadd libvirt 
groupadd wireshark

clear

echo -n "Enter superuser account name: "
read user
useradd -m -s /bin/fish "$user" -G uucp,libvirt,wireshark

echo "Setting password for ${user}..."
passwd "$user"
clear

echo "${user} ALL=(ALL) ALL" >> /etc/sudoers #probably not the best idea

echo "Installing GRUB..."
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
echo "Enabling multilib repositories..."
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

mount -t tmpfs -o size=1G tmpfs /tmp

echo "Initializing pacman..."
pacman-key --init
pacman-key --populate
pacman -Sy --needed --noconfirm archlinux-keyring && pacman -Su --noconfirm
pacman -S --needed --noconfirm iwd vim man-db man-pages git libvirt virt-manager docker docker-compose rustup cargo xdg-user-dirs xdg-utils openssh dhcpcd nerd-fonts noto-fonts-emoji

runuser -u "$user" -c xdg-user-dirs-update

ln -s '/lib/systemd/system/libvirtd.service' '/etc/systemd/system/multi-user.target.wants/libvirtd.service'
ln -s '/lib/systemd/system/docker.service' '/etc/systemd/system/multi-user.target.wants/docker.service'
ln -s '/lib/systemd/system/sshd.service' '/etc/systemd/system/multi-user.target.wants/sshd.service'
ln -s '/lib/systemd/system/dhcpcd.service' '/etc/systemd/system/multi-user.target.wants/dhcpcd.service'
ln -s '/lib/systemd/system/iwd.service' '/etc/systemd/system/multi-user.target.wants/iwd.service'

install -d -m 0755 -o $user "/home/${user}/Applications"
cd "/home/${user}/Applications"
git clone https://git.suckless.org/dwm
cd dwm
wget "https://dwm.suckless.org/patches/actualfullscreen/dwm-actualfullscreen-20211013-cb3f58a.diff"
wget "https://dwm.suckless.org/patches/alt-tab/dwm-alttab-6.4.diff"
wget "https://dwm.suckless.org/patches/autostart/dwm-autostart-20210120-cb3f58a.diff"
wget "https://dwm.suckless.org/patches/focusonclick/dwm-focusonclick-20200110-61bb8b2.diff"
wget "https://dwm.suckless.org/patches/preserveonrestart/dwm-preserveonrestart-6.3.diff"
wget "https://dwm.suckless.org/patches/statusallmons/dwm-statusallmons-6.2.diff"
wget "https://dwm.suckless.org/patches/centeredmaster/dwm-centeredmaster-20160719-56a31dc.diff"
wget "https://dwm.suckless.org/patches/restartsig/dwm-restartsig-20180523-6.2.diff"

echo "Patching dwm..."
sleep 1
for i in *.diff
do
	patch < $i
done
make install

cd ..
git clone https://github.com/torrinfail/dwmblocks.git
make install

mv ~/Scripts "/home/${user}/"
mv ~/user-config.sh "/home/${user}/"
cp ~/media/bg.jpg "/home/${user}/Pictures/"
chown -R $user "/home/${user}"

su "$user" -c "/home/${user}/user-config.sh"
rmdir "/home/${user}/media"

exit

