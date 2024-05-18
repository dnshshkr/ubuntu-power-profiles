#!/bin/bash

# Clear memory cache
sudo sync; echo 3 > /proc/sys/vm/drop_caches

# Clear apt cache
sudo apt-get clean
sudo apt-get autoclean

# Clear thumbnail cache
rm -rf ~/.cache/thumbnails/*

# Clear systemd journal logs
sudo journalctl --vacuum-time=2weeks

# Clear browser cache
rm -rf ~/.cache/mozilla/firefox/*
rm -rf ~/.cache/google-chrome/*

# Clear pip3 cache
rm -rf ~/.cache/pip

echo "Cache clearing completed."

