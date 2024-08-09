#!/usr/bin/env bash

image_directory="$HOME/.config/neofetch"

image_files=("$image_directory"/*.jpg "$image_directory"/*.png)


random_image="${image_files[$RANDOM % ${#image_files[@]}]}"

img_sourse="--source $random_image"
# Печатаем сообщение о успешном выборе изображения
sh -c "neofetch --kitty $img_sourse"
