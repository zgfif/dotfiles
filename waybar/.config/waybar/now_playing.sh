#! /usr/bin/bash

pactl list sink-inputs \
	| grep 'media.name' \
	| cut -d '=' -f2 \
	| sed -e 's/^ "//' -e 's/"$//' -e 's/&/\&amp;/g' \
	| tail -n 1

# retrieves the list of sink-inputs
# extracts only with 'media.name'
# removes " in the start and " in the end and replaces all & with \&amp; for correct gtk view
# takes only 1 last media.name





