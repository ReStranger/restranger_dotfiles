#!/bin/bash
git clone --depth 1 https://github.com/guillaumeboehm/wal-telegram ./src/wal-telegram
cd src/wal-telegram/
sudo make install PREFIX=$(pwd)/../../bin/wal-telegram
sudo rm /usr/bin/wal-telegram
cd ../../
sudo rm -r ./src/wal-telegram/
source ./.venv/bin/activate || source ./.venv/bin/activate.fish || source ./.venv/bin/activate.csh
pip install -r requirements.txt
