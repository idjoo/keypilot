# Keypilot

Keypilot is a simple python script to control device by using X11, it utilize
the xdotool cli to emulate user inputs.

> [!WARNING]
> this script are intended just to simplify my workflow, i also made this on
> short notice so please do excuse the dirty code here and there. Feel free to
> contribute or open an issue to make any improvement.

## Requirements

- `xdotool`

## Usage

Run the `keypilot` cli and start typing, thats it!.

### Keyboard

A normal characters can just be typed directly. But not all special characters
and key combination are available. A custom key can be inputted by pressing
alt+a and typing the desired key, refer to [xdotool list of keycodes](https://gitlab.com/nokun/gestures/-/wikis/xdotool-list-of-key-codes)
for a complete list of available key that xdotool supports.

> [!NOTE]
> Refer to [const.py](https://github.com/pypa/gh-action-pypi-publish/tree/master/keypilot/const.py) for the list of available key mappings

> [!NOTE]
> Custom key combination can be used by using alt+a

### Mouse

Mouse movements are supported by using `alt+[Up/Down/Left/Right]`. But the
pixel movement range are hardcoded to 50 as of now.

## Known Limitations

- Hardcoded special characters and key combination mappings
- No configuration for custom key combination
- Incomplete key mappings
