def parse_theme(json_data):
    theme = {
        "colors": {
            "primary": {
                "foreground": json_data["special"]["foreground"],
                "background": json_data["special"]["background"]
            },
            "cursor": {
                "cursor": json_data["special"]["cursor"],
                "text": json_data["colors"]["color0"]
            },
            "normal": {
                "black": json_data["colors"]["color0"],
                "red": json_data["colors"]["color1"],
                "green": json_data["colors"]["color2"],
                "yellow": json_data["colors"]["color3"],
                "blue": json_data["colors"]["color4"],
                "magenta": json_data["colors"]["color5"],
                "cyan": json_data["colors"]["color6"],
                "white": json_data["colors"]["color7"]
            },
            "bright": {
                "black": json_data["colors"]["color8"],
                "red": json_data["colors"]["color9"],
                "green": json_data["colors"]["color10"],
                "yellow": json_data["colors"]["color11"],
                "blue": json_data["colors"]["color12"],
                "magenta": json_data["colors"]["color13"],
                "cyan": json_data["colors"]["color14"],
                "white": json_data["colors"]["color15"]
            }
        }
    }

    return theme
