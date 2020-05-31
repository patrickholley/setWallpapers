#!/bin/bash
while true
do
	monitorCount=$(xrandr | grep -oi " connected " | wc -l)

	prefix="/hdd/Wallpapers/"
	suffix="Wallpaper.png"
	
	getWidth() {
		echo $(file $1 | grep -Po 'data, \K[^ ]+')
	}
	
	setWallpaper() {
		suffix="${1}Wallpaper.png"
		
		activeWallpaper="${prefix}active${suffix}"
		correctWallpaper="${prefix}${monitorCount}${suffix}"
		
		activeLoginWallpaperWidth=$(getWidth $activeWallpaper)
		correctLoginWallpaperWidth=$(getWidth $correctWallpaper)

		if [ "$activeWallpaperWidth" != "$correctWallpaperWidth" ]; then
			cp $correctWallpaper $activeWallpaper
		fi
	}
	
	for wallpaperType in "" "Login"; do
		setWallpaper $wallpaperType
	done
	
	sleep 5
done

