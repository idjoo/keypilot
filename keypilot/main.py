from os import environ
from sys import exit, stdout
from subprocess import run
from shutil import which

from readchar import readkey

from keypilot.const import KEY_MAPPINGS, MOUSE_DIRECTIONS


def main():
    if which("xdotool") is None:
        print("xdotool is not installed")
        exit(1)

    environ.setdefault("DISPLAY", ":0")

    while True:
        try:
            inp = readkey()
        except KeyboardInterrupt:
            exit(0)

        if inp == "\x1b[1;":
            readkey()  # Skip the next character
            direction = MOUSE_DIRECTIONS.get(readkey())
            if direction is not None:
                print(repr(direction))
                run(["xdotool", "mousemove_relative", "--polar", str(direction), "50"])
            continue

        key = KEY_MAPPINGS.get(inp, inp)

        if key == "custom":
            key = input("Custom: ")

        if key == "Enter":
            print()
        elif key == "BackSpace":
            stdout.write('\b \b')
            stdout.flush()
        else:
            print(key, end="", flush=True)

        run(["xdotool", "key", key])


if __name__ == "__main__":
    main()
