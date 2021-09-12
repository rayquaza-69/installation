#!/usr/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "mama" >> /etc/hostname

echo "
127.0.0.1 localhost
::1   localhost
127.0.1.1 mama.localdomain  mama" >> /etc/hosts

echo "please input a root password"

pacman -S grub efibootmgr networkmanager network-manager-applet acpi dialog mtools dosfstools base-devel linux-headers bluez\
  bluez-utils cups git reflector xdg-utils xdg-user-dirs --noconfirm

echo "change mkinitcpio hooks if you plan on using a pendrive
base udev block keyboard autodetect modconf filesystems fsck"

grub-install --target=i386-pc --boot-directory=/boot /dev/sda
grub-install --target=x86_64-efi --efi-directory=/boot --boot-directory=/boot --removable --recheck 

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable Network-Manager
systemctl enable bluetooth
systemctl enable cups

useradd -mG wheel,audio,video,optical,network,storage,power,tty,users joe

echo "change passwd for joe"

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

echo "CLI installed"

reboot


