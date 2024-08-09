#!/usr/bin/env bash
nitrogen --set-zoom-fill $HOME/Pictures/Wallpapers/Firefox_wallpaper.png --save --head=0
cp -rf $HOME/.config/rices/montagnes_violettes/.gtkrc-2.0 $HOME/.gtkrc-2.0
cp -rf $HOME/.config/rices/montagnes_violettes/.config/* $HOME/.config/
kitty +kitten themes --reload-in=all "Montagnes Violettes"
pkill picom
pkill dunst 
pkill conky
bspc wm -r
sleep 2
dunstify "Theme: Montagnes Violettes successfully applied!"
