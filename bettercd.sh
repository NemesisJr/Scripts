#!/usr/bin/env bash

# Created By: Cybersnake
# Created On: Tue 11 Oct 2022 03:19:24 PM 
# Project: File manager


bettercd() {
    >/dev/null cd $1
    if [ -z $1 ]
    then
        while true;
        do
            selection="$(lsd -a | fzf --height 95% --reverse --info hidden --prompt "$(pwd)/" --preview ' cd_pre="$(echo $(pwd)/$(echo {}))";
                    echo $cd_pre;
                    echo;
                    lsd -a --color=always "${cd_pre}";
                    termpix --width 100 --true-color {} 2>/dev/null;
                    bat --style=numbers --theme=ansi --color=always {} 2>/dev/null' --bind alt-j:preview-down,alt-k:preview-up --preview-window=right:65%)"
        if [[ -d "$selection" ]]
        then
            >/dev/null cd "$selection"
        elif [[ -f "$selection" ]]
        then
            for file in $selection; 
            do
                if [[ $file == *.txt ]] || [[ $file == *.sh ]] || [[ $file == *.lua ]] || [[ $file == *.conf ]] || [[ $file == .*rc ]] || [[ $file == *rc ]] || [[ $file == autostart ]] || [[ $file == *.tex ]] || [[ $file == *.py ]]
                then
                    lvim "$selection"
                elif [[ $file == *.docx ]] || [[ $file == *.odt ]] 
                then
                    devour libreoffice "$selection" 2>/dev/null
                elif [[ $file == *.pdf ]]
                then
                    devour evince "$selection"
                elif [[ $file == *.jpg ]] || [[ $file == *.png ]] || [[ $file == *.xpm ]]
                then
                    feh "$selection"
                else [[ $file == *.xcf ]]
                    devour feh "$selection"
            fi
        done
        else 
            break
        fi
    done
    fi
}

bettercd

