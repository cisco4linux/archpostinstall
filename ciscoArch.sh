#!/bin/bash

echo "--------------------------------------------------------------"
echo "> Please change pacman pararlel dowloads to a  higher number <"
echo "--------------------------------------------------------------"
sudo nano /etc/pacman.conf
#PARALEL DOWLOADS 15 is ok for me

echo "---------------------------------------"
echo ">     Updating System <"
echo "---------------------------------------"
yes | sudo pacman -Syu

echo "------------------------------------------"
echo ">     Installing programs via pacman <"
echo "------------------------------------------"
yes | sudo pacman -Sy git firefox steam neofetch discord nvidia-lts vlc bitwarden gimp pacman-contrib vte3 openrgb flatpak yakuake
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "------------------------------------------"
echo ">     Installing programs via flatpak <"
echo "------------------------------------------"
flatpak install -y flathub org.onlyoffice.desktopeditors

echo "-----------------------------------------"
echo ">      Installing yay <"
echo "-----------------------------------------"
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../ && rm -rfv yay/

#echo "-----------------------------------------"
#echo ">      Removing Gnome non used <"
#echo "-----------------------------------------"
#yes | sudo pacman -Runs gnome-maps gnome-connections gnome-tour epiphany gnome-contacts gnome-calendar gnome-scanner simple-scan 

echo "-----------------------------------------"
echo ">      Starting bluetooth service <"
echo "-----------------------------------------"
sudo systemctl enable bluetooth.service
yes | sudo systemctl start bluetooth.service

echo "-----------------------------------------"
echo ">      Installing synth-shell <"
echo "-----------------------------------------"
yes | sudo pacman -S powerline-fonts
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
cd ../ && sudo rm -rfv synth-shell/

#echo "-----------------------------------------"
#echo ">      Enabling SSH Service <"
#echo "-----------------------------------------"
#sudo systemctl enable sshd
#sudo systemctl start sshd

echo "-----------------------------------------"
echo ">      YAY! Careful <"
echo "-----------------------------------------"
yay -S pamac-aur

#echo "-----------------------------------------"
#echo ">      Installing GNOME Extensions <"
#echo "-----------------------------------------"
#EXT_LIST=(
#arch-update@RaphaelRochet
#ddterm@amezin.github.com
#dynamic-calendar-and-clocks-icons@fcusr.github.com
#freon@UshakovVasilii_Github.yahoo.com
#fuzzy-clock@keepawayfromfire.co.uk
#Rounded_Corners@lennart-k
#status-area-horizontal-spacing@mathematical.coffee.gmail.com
#tophat@fflewddur.github.io
#trayIconsReloaded@selfmade.pl
#upower-battery@codilia.com
#weatheroclock@CleoMenezesJr.github.io
#AddCustomTextToWorkSpaceIndicators@pratap.fastmail.fm
#)

#GN_CMD_OUTPUT=$(gnome-shell --version)
#GN_SHELL=${GN_CMD_OUTPUT:12:2}
#for i in "${EXT_LIST[@]}"
#do
#    busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${i}
#done

echo "-----------------------------------------"
echo ">      DONE <"
echo ">      Customize time! <"
echo "-----------------------------------------"
