#!/bin/bash
for pkgName in $(cat packages-AUR.txt)

do
  yay -S --noconfirm $pkgName
done
echo "Installed all AUR packages."
