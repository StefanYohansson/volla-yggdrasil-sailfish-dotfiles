#!/usr/bin/env bash

mkdir -p tmp
cd tmp

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# install mopidy
pip install -U mopidy

# install spotify plugin.
pip install -U cffi
pip install -U mopidy-spotify

# install Iris (web frontend for mopidy)
pip install -U mopidy-iris

systemctl --user restart pulseaudio

systemctl --user enable mopidy.service
systemctl --user start mopidy.service
