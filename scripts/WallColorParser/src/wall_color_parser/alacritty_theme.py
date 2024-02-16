from src.wall_color_parser.parser import parse_theme
import json
import toml
import os

def alacritty_theme_gen():
    HOME = os.getenv("HOME")
    # Прочитаем JSON файл
    with open(f"{HOME}/.cache/wal/colors.json") as json_file:
        json_data = json.load(json_file)

    # Сгенерируем тему для Alacritty
    alacritty_theme = parse_theme(json_data)

    # Преобразуем тему в формат TOML
    alacritty_theme_toml = toml.dumps(alacritty_theme)

    # Сохраняем сгенерированную тему в TOML файл
    with open('/home/restranger/.config/alacritty/themes/material.toml', 'w') as toml_file:
        toml_file.write(alacritty_theme_toml)
    return print("Alacritty theme have been changed")
