#!/bin/bash

# install nwg-look
clear && echo "installing dependencies of nwg-look" && sleep 2
sudo apt install libgtk-3-dev libcairo2-dev libglib2.0-dev golang git curl
clear && echo "starting build of nwg-look..." && sleep 2
git clone https://github.com/nwg-piotr/nwg-look && cd nwg-look && make build && sudo make install && cd ..

# install alacritty
clear && echo "setting up rustup" && sleep 2 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
. "$HOME/.cargo/env"
clear && echo "starting build of alacritty..." && sleep 2 
git clone https://github.com/alacritty/alacritty && cd alacritty && sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 && cargo build --release && sudo cp target/release/alacritty /usr/local/bin && sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg && sudo desktop-file-install extra/linux/Alacritty.desktop && sudo update-desktop-database && cd ..

# install packages for desktop and dot files
clear && echo "installing desktop packages (i3, rofi, etc)" && sleep 2 
sudo apt install rofi i3 picom btop polybar feh

# install dotfiles
clear && echo "installing dotfiles" && sleep 2 
cp -r config/* ~/.config/ && cp -r local/share/* ~/.local/share/ && mkdir -p ~/.fonts && cp -r fonts/* ~/.fonts/ && mkdir -p ~/Pictures/wallpapers && cp -r wallpapers/* ~/Pictures/wallpapers/
