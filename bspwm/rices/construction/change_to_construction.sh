#!/bin/sh
#nitrogen --set-zoom-fill $HOME/Pictures/Wallpapers/Firefox_wallpaper.png --save --head=0
#cp -rf $HOME/.config/rices/construction/.gtkrc-2.0 $HOME/.gtkrc-2.0
cp -rf $HOME/.config/rices/construction/.config/* $HOME/.config/
#kitty +kitten themes --reload-in=all "Montagnes Violettes"
pkill picom
pkill dunst 
pkill conky
bspc wm -r
sleep 2
dunstify "Theme: Construction successfully applied!"
