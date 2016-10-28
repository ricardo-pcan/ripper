#!/bin/bash

load_config() {
    # Check if ripper config files exists in the environment
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
        echo -e "\n \e[92m Set the fonts options ..\e[0m"
        rm -r ~/.fonts
        ln -s $HOME/.ripper/includes/.fonts $HOME/
    else
        echo -e "\n \e[92m Set the fonts options ..\e[0m"
        echo -e "\n \e[92m Copy the fonts options ..\e[0m"
        ln -s $HOME/.ripper/includes/.fonts $HOME/
    fi

    if [ -f ~/.vimrc.local ]; then
        echo -e "\n \e[92m Set the vim options ..\e[0m"
        rm ~/.vimrc.local
        ln -sf $HOME/.ripper/includes/.vimrc.local $HOME/
    else
        echo -e "\n \e[92m Set the vim options ..\e[0m"
        echo -e "\n \e[92m Copy the vim options ..\e[0m"
        ln -sf $HOME/.ripper/includes/.vimrc.local $HOME/
    fi
    echo -e "\n \e[95m Please windows + R for reload i3 config\e[0m"
}



    bootstrap() {
        # Install aplications
        sudo pacman -Syu
        sudo pacman -S --noconfirm git
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
    }

    install_powerline() {
        pip install --user git+git://github.com/Lokaltog/powerline
        mkdir -p ~/.fonts/
        mkdir -p ~/.config/fontconfig/conf.d/
        wget -O ~/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
        wget -O ~/.config/fontconfig/conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
        fc-cache -vf ~/.fonts
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    }

    clone_ripper() {
        # Clone the ripper project
        echo -e "\n \e[92m Clone the ripper project\e[0m"
        if [ -d ~/.ripper ]; then
            echo -e "\n \e[92m  project\e[0m"
        fi
        git clone https://github.com/ricardo-pcan/ripper.git ~/.ripper
    }


$@
