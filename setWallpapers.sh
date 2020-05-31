#!/bin/bash
while true
do
	getFilePath() {
		echo "/hdd/Wallpapers/${1}.png"
	}

	getWidth() {
		echo $(file $1 | grep -Po 'data, \K[^ ]+')
	}

	setWallpaper() {
		active=$(getFilePath "a${1}")
		correct=$(getFilePath "$(xrandr | grep -oi " connected " | wc -l)${1}")

		if [ "$(getWidth $active)" != "$(getWidth $correct)" ]
		then
			cp $correct $active
		fi
	}

	for type in "D" "L"; do
		setWallpaper $type
	done

	sleep 5
done
