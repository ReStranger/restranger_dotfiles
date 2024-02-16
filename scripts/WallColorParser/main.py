#!/usr/bin/env python
from src.wall_color_parser.alacritty_theme import alacritty_theme_gen
from src.wall_color_parser.eww_theme import eww_theme_gen
from src.wall_color_parser.bspwm_theme import bspwm_theme_gen
from src.wall_color_parser.kitty_theme import kitty_theme_gen
import os

img_patch = input("Укажите полный путь до обоев: ")
os.system(f"wal -n -i {img_patch}")
alacritty_theme_gen()
eww_theme_gen()
bspwm_theme_gen()
kitty_theme_gen()
os.system(f"nitrogen --set-zoom-fill {img_patch} --save --head=0 || nitrogen error")
os.system("pywalfox install && pywalfox update || pywalfox error")
os.system("/bin/sh -c './bin/wal-telegram/wal-telegram/wal-telegram $*' --wal || wal-telegram error")
