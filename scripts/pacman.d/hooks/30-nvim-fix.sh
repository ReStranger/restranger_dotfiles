#!/bin/sh
sed -i 's/Terminal=true/Terminal=false/' /usr/share/applications/nvim.desktop
sed -i 's/Exec=nvim %F/Exec=env -u WAYLAND_DISPLAY alacritty -e nvim %F/' /usr/share/applications/nvim.desktop

