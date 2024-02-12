# /usr/bin/python3

import os
import random
import subprocess
import time


def random_wallpaper():
    dir = "/home/qianxi/.config/hypr/images"
    wallpapers = os.listdir(dir)
    output = subprocess.run(["swww", "query"], stdout=subprocess.PIPE).stdout.decode(
        "utf-8"
    )

    index = output.rfind("/")
    current_wallpaper = output[index + 1 :].strip()
    wallpapers.remove(current_wallpaper)
    next_wallpaper = random.choice(wallpapers)

    subprocess.run(["swww", "img", f"{dir}/{next_wallpaper}", "--transition-type", "any"])

# recv args
import sys
if len(sys.argv) > 1:
    if sys.argv[1] == "dameon":
        while True:
            random_wallpaper()
            time.sleep(1800)
    else:
        random_wallpaper()

