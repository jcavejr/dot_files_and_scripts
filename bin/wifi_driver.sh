#!/usr/bin/env sh
cd /home/jeff/rtl8821ce
make clean
make
sudo make install
sudo modprobe 8821ce
