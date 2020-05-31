#!/bin/bash
while true
do
	getFilePath() {
		echo "/hdd/Wallpapers/${1}Wallpaper.png"
	}

	getWidth() {
		echo $(file $1 | grep -Po 'data, \K[^ ]+')
	}

	setWallpaper() {
		activeWallpaper=$(getFilePath "active${1}")
		correctWallpaper=$(getFilePath "$(xrandr | grep -oi " connected " | wc -l)${1}")

		if [ "$(getWidth $activeWallpaper)" != "$(getWidth $correctWallpaper)" ]
		then
			cp $correctWallpaper $activeWallpaper
		fi
	}

	for wallpaperType in "" "Login"; do
		setWallpaper $wallpaperType
	done

	sleep 5
done
