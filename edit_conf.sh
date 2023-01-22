#!/usr/bin/env bash

options=("alacritty
bash
bspwm
cmus
dunst
grub
picom
polybar
ranger
sxhkd
lvim
xresources
zsh
quit")

#choice=$(echo -e "${options[@]}" | dmenu -g 5 -l 5 -fn 'Hermit:size=10' -p 'Edit file: ' -nb '#222222' -nf '#b8b8b8' -sb '#007687' -sf '#222222')
#choice=$(echo -e "${options[@]}" | rofi -dmenu -p 'Edit config file: ')
choice="$(echo -e "${options[@]}" | fzf --prompt="Select a File : " --border=sharp --color=dark --height 70% --reverse --header="           CONFIGS " --info=hidden --header-first)"

case "$choice" in
    quit)
        echo "Program terminated." && exit 1
        ;;
    alacritty)
        choice="$HOME/.config/alacritty/alacritty.yml"
        ;;
    bash)
        choice="$HOME/.config/bash/.bashrc"
        ;;
    bspwm)
        choice="$HOME/.config/bspwm/bspwmrc"
        ;;
    dunst)
        choice="$HOME/.config/bspwm/dunstrc"
        ;;
    grub)
        choice="/etc/default/grub"
        ;;
    cmus)
        choice="$HOME/.config/cmus/autosave"
        ;;
    picom)
        choice="$HOME/.config/bspwm/picom.conf"
        ;;
    polybar)
        choice="$HOME/.config/bspwm/polybar/config"
        ;;
    ranger)
        choice="$HOME/.config/ranger/rc.conf"
        ;;
    sxhkd)
        choice="$HOME/.config/bspwm/sxhkdrc"
        ;;
    lvim)
        choice="$HOME/.config/lvim/config.lua"
        ;;
    xresources)
        choice="$HOME/.config/bspwm/xsettingsd"
        ;;
    zsh)
        choice="$HOME/.zshrc"
        ;;
    *)
        exit 1
        ;;
esac
xfce4-terminal -e "lvim "$choice""


