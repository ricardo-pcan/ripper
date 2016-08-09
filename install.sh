#!/bin/bash

#git clone https://github.com/ricardo-pcan/ripper.git ~/.ripper

# Check if ripper config files exists in the environment
if [ -f ~/.zshrc ]; then
    echo -e "\n \e[92m Set the zsh options ..\e[0m"
    rm ~/.zshrc
    ln -sf $HOME/.ripper/includes/.zshrc $HOME/
    source ~/.zshrc
fi

if [ -f ~/.tmux.conf ]; then
    echo -e "\n \e[92m Set the tmux options ..\e[0m"
    rm ~/.tmux.conf
    ln -sf $HOME/.ripper/includes/.tmux.conf $HOME/
    tmux source-file ~/.tmux.conf
fi

if [ -f ~/.i3/config ]; then
    echo -e "\n \e[92m Set the i3 options ..\e[0m"
    rm ~/.i3/config
    ln -sf $HOME/.ripper/includes/.i3/config $HOME/.i3/
fi

if [ -f ~/.vimrc.local ]; then
    echo -e "\n \e[92m Set the vim options ..\e[0m"
    rm ~/.vimrc.local
    ln -sf $HOME/.ripper/includes/.vimrc.local $HOME/
fi


    echo -e "\n \e[95m Please windows + R for reload i3 config\e[0m"


    bootstrap() {
        # Install aplications
        sudo pacman -Syu
        sudo pacman -S --noconfirm chromium
        sudo pacman -S --noconfirm virtualbox
        sudo pacman -S --noconfirm vagrant
        sudo pacman -S --noconfirm tmux
        sudo pacman -S --noconfirm zsh
        sudo pacman -S --noconfirm docker
        sudo gpasswd -a $USER docker
        sudo systemctl start docker
        sudo pacman -S --noconfirm pulseaudio
    }


