#!/bin/sh
nitrogen --set-zoom-fill $HOME/Pictures/Wallpapers/7d43c543989fce6428d40ad5f56a370f.jpeg --save --head=0
cp -rf $HOME/.config/rices/kaedehara_kazuha/.gtkrc-2.0 $HOME/.gtkrc-2.0
cp -rf $HOME/.config/rices/kaedehara_kazuha/.config/* $HOME/.config/
kitty +kitten themes --reload-in=all "Kaedehara Kazuha"
pkill picom
pkill dunst 
pkill conky
bspc wm -r
sleep 2
dunstify "Theme: Kaedehara Kazuha successfully applied!"
