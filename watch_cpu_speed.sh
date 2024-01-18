#!/bin/bash
watch -n 1 "awk '/^processor/ {cpu=\$3} ; /^[c]pu MHz/ {print \"CPU \" cpu \": \" \$4 \" MHz\"}' /proc/cpuinfo"