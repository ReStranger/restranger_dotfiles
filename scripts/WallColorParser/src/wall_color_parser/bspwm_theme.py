import os

def bspwm_theme_gen():
    HOME = os.getenv("HOME")

    # Чтение цветов из файла
    with open(f'{HOME}/.cache/wal/colors', 'r') as file:
        colors = file.readlines()

    # Генерация bash переменных
    bash_variable = ""
    for index, color in enumerate(colors):
        bash_variable += f"color{index}='{color.strip()}'\n"
    with open(f'{HOME}/.config/bspwm/colors', 'w') as file:
        file.write(bash_variable)
    os.system("bspc wm -r")
    return print("bspwm theme have been changed")
