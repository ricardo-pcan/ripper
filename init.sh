#!/bin/bash

echo -e "\n \e[92m Clone the ripper project\e[0m"
if [ -d ~/.ripper ]; then
    echo -e "\n \e[92m Clone project\e[0m"
fi
sudo pacman -S --noconfirm git
git clone https://github.com/ricardo-pcan/ripper.git ~/.ripper
# Install all applications
sudo pacman -Syu
sudo pacman -S --noconfirm chromium
sudo pacman -S --noconfirm virtualbox
sudo pacman -S --noconfirm gnome-terminal
sudo pacman -S --noconfirm vagrant
sudo pacman -S --noconfirm tmux
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm docker
sudo gpasswd -a $USER docker
sudo systemctl start docker
sudo pacman -S --noconfirm pulseaudio
sudo pacman -S --noconfirm httpie
sudo pacman -S --noconfirm rofi
yaourt -S --noconfirm spotify
yaourt -S --noconfirm gpmdp
yaourt -S --noconfirm vocal

echo -e "\n \e[92m Install Nozbe \e[0m"
cd
wget https://files.nozbe.com/330/NozbeLinux.tar
tar -xvf ~/NozbeLinux.tar
cd ~/LinuxInstaller/
./downloader.sh
# Install my config
if [ -f ~/.zshrc ]; then
    echo -e "\n \e[92m Set the zsh options ..\e[0m"
    rm ~/.zshrc
    ln -sf $HOME/.ripper/includes/.zshrc $HOME/
    source ~/.zshrc
else
    echo -e "\n \e[92m Set the zsh options ..\e[0m"
    echo -e "\n \e[92m Copy the zsh options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.zshrc $HOME/
    source ~/.zshrc
fi

if [ -f ~/.gitconfig ]; then
    echo -e "\n \e[92m Set the git options ..\e[0m"
    rm ~/.gitconfig
    ln -sf $HOME/.ripper/includes/.gitconfig $HOME/
    source ~/.gitconfig
else
    echo -e "\n \e[92m Set the git options ..\e[0m"
    echo -e "\n \e[92m Copy the git options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.gitconfig $HOME/
    source ~/.gitconfig
fi

if [ -f ~/.tmux.conf ]; then
    echo -e "\n \e[92m Set the tmux options ..\e[0m"
    rm ~/.tmux.conf
    ln -sf $HOME/.ripper/includes/.tmux.conf $HOME/
    tmux source-file ~/.tmux.conf
else
    echo -e "\n \e[92m Set the tmux options ..\e[0m"
    echo -e "\n \e[92m Copy the tmux file ..\e[0m"
    ln -sf $HOME/.ripper/includes/.tmux.conf $HOME/
    tmux source-file ~/.tmux.conf
fi

if [ -f ~/.i3/config ]; then
    echo -e "\n \e[92m Set the i3 options ..\e[0m"
    rm ~/.i3/config
    ln -sf $HOME/.ripper/includes/.i3/config $HOME/.i3/
else
    echo -e "\n \e[92m Set the i3 options ..\e[0m"
    echo -e "\n \e[92m Copy the i3 options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.i3/config $HOME/.i3/

fi

if [ -f ~/.i3status.conf ]; then
    echo -e "\n \e[92m Set the i3status options ..\e[0m"
    rm ~/.i3status.conf
    ln -sf $HOME/.ripper/includes/.i3status.conf $HOME/.i3status.conf
else
    echo -e "\n \e[92m Set the i3status options ..\e[0m"
    echo -e "\n \e[92m Copy the i3status options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.i3status.conf $HOME/.i3status.conf

fi

if [ -f ~/.rofirc ]; then
    echo -e "\n \e[92m Set the rofi options ..\e[0m"
    rm ~/.rofirc
    ln -sf $HOME/.ripper/includes/.rofirc $HOME/
else
    echo -e "\n \e[92m Set the rofi options ..\e[0m"
    echo -e "\n \e[92m Copy the rofi options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.rofirc $HOME/
fi

if [ -d ~/.fonts ]; then
    echo -e "\n \e[92m Set the fonts options ..\e[0m" # Active fonts
    rm -r ~/.fonts
    ln -s $HOME/.ripper/includes/.fonts $HOME/
else
    echo -e "\n \e[92m Set the fonts options ..\e[0m"
    echo -e "\n \e[92m Copy the fonts options ..\e[0m"
    ln -s $HOME/.ripper/includes/.fonts $HOME/
fi
fc-cache -vf ~/.fonts/ # Active fonts

if [ -f ~/.vimrc.local ]; then
    echo -e "\n \e[92m Set the vim options ..\e[0m"
    rm ~/.vimrc.local
    ln -sf $HOME/.ripper/includes/.vimrc.local $HOME/
else
    echo -e "\n \e[92m Set the vim options ..\e[0m"
    echo -e "\n \e[92m Copy the vim options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.vimrc.local $HOME/
fi

if [ -f ~/.config/gtk-3.0/settings.ini ]; then
    echo -e "\n \e[92m Set the gtk3.0 options ..\e[0m"
    rm ~/.config/gtk-3.0/settings.ini
    ln -sf $HOME/.ripper/includes/.settings.ini $HOME/.config/gtk-3.0/settings.ini
else
    echo -e "\n \e[92m Set the gtk3.0 options ..\e[0m"
    echo -e "\n \e[92m Copy the gtk3.0 options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.settings.ini $HOME/.config/gtk-3.0/settings.ini
fi

if [ -f ~/.gtkrc-2.0 ]; then
    echo -e "\n \e[92m Set the gtk2.0 options ..\e[0m"
    rm ~/.gtkrc-2.0
    ln -sf $HOME/.ripper/includes/.gtkrc-2.0 $HOME/
else
    echo -e "\n \e[92m Set the gtk2.0 options ..\e[0m"
    echo -e "\n \e[92m Copy the gtk2.0 options ..\e[0m"
    ln -sf $HOME/.ripper/includes/.gtkrc-2.0 $HOME/
fi
echo -e "\n \e[95m Please windows + R for reload i3 config\e[0m"
