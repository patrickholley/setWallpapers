# setWallpapers
A lightweight script that watches for monitor changes in Linux (Ubuntu 20.04) and adjusts the wallpapers accordingly. I set this as a startup application on login. System Monitor reports ~280KiB in memory use, so it should be virtually unnoticeable.

This script is very personally tailored to my needs, though it may give you an idea of how to accomplish this same task on your system.

Note that this is only updating the already-set wallpaper files my Linux installation uses, and it only works with PNG images. Also, since it is fairly small and I know exactly how it works, error-handling is nonexistent, so make sure you either add error-handling yourself or that all needed images exist prior to executing the script.

To do the initial change for the login background settings, I used the script found here: https://github.com/PRATAP-KUMAR/focalgdm3

To do the initial change for my desktop background settings, I ran the following commands:
```
gsettings set org.gnome.desktop.background picture-options 'spanned'
gsettings get org.gnome.desktop.background picture-uri 'file:///example/file/path.png'
```
