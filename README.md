Steps to use:

1. cd ~
2. git clone https://github.com/zgfif/dotfiles.git
3. sudo pacman -S stow
4. cd ~/dotfiles
5. stow waybar
6. Check $ls -la ~/.config/waybar/


Packages:

# hyprshot - to make screenshots
yay -S hyprshot

# to change brightness in hypridle
yay -S brightnessctl

# to generate Material You color palette
yay -S matugen-bin

I use hyprpaper, so to change wallpaper I write a **changewallpaper script**[click here](https://gist.github.com/zgfif/008734750ee384ad867aff27fc99533f). Save it to /usr/local/bin .''changewallpaper filename'' is used in matugen.

matugen image <whatever_wallpaper_you_want>

# setting up starship
pacman -S starship

# then add to ~/.barshrc
eval "$(starship init bash)"

