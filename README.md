# archpostinstall
Automated script for after installing Arch.

After installing Arch fresh just do:

sudo pacman -S git

git clone https://github.com/cisco4linux/archpostinstall.git

chmod +x archpostinstall/ciscoArch.sh

cd archpostinstall

./ciscoArch.sh

cd ../ && sudo rm -rfv archpostinstall/
