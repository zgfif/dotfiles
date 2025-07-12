#! /usr/bin/bash

echo $(pactl list sink-inputs | grep 'media.name' | cut -d '=' -f2 | sed 's/^ "//;s/"$//' | tail -n 1);
