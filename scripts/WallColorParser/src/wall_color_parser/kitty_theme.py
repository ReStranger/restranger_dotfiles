import os

def kitty_theme_gen():
    os.system("cp ~/.cache/wal/colors-kitty.conf ~/.config/kitty/themes/material.conf")
    os.system("kitten themes --reload-in=all Material")
