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


# #####
Bug with hyprlock (when password input is not focused by default after suspend)

# package to move mouse
sudo pacman -S ydotool


# create a service for ydotool

mkdir -p ~/.config/systemd/user

Create file sudo vim  ~/.config/systemd/user/ydotoold.service  add to it:


[Unit]
Description=Ydotool daemon

[Service]
ExecStart=/usr/bin/ydotoold
Restart=on-failure

[Install]
WantedBy=default.target

Активируй сервис:

systemctl --user daemon-reload
systemctl --user enable --now ydotoold.service
systemctl --user status ydotoold.service


✦ ❯ ydotoold
You're advised to run this program as root, or YMMV.
failed to open uinput device: Permission denied

🔥 Проблема:

Когда ты запускаешь ydotoold от обычного пользователя, он не имеет прав для работы с устройством /dev/uinput, которое нужно для симуляции ввода.

✅ Решение: дать пользователю доступ к /dev/uinput

🔧 Шаг 1: Узнай, к какой группе принадлежит /dev/uinput

ls -l /dev/uinput

Обычно вывод будет примерно такой:

crw-rw---- 1 root input 10, 223 Jul 21 22:40 /dev/uinput

То есть устройством владеет группа input.
🔧 Шаг 2: Добавь себя в группу input

sudo usermod -aG input $USER

Затем перезагрузи систему, чтобы изменения вступили в силу:

reboot


## проверка

2. Проверить, что демон запущен и сокет появился:

ls -l /run/user/1000/.ydotool_socketш

Если файл существует — всё хорошо.

3. Протестировать движение мыши:
ydotool mousemove 1 1



### Activate Num Lock by-default
sudo pacman -S numlockx



### ADD multitouch


yay -S ruby-fusuma

if hasn't been found:
yay -Syu

sudo pacman -S xdotool wmctrl libinput
yay -S ruby-fusuma-plugin-sendkey ruby-fusuma-plugin-wmctrl
sudo gpasswd -a $USER input

libinput list-devices

Там должно быть что-то вроде:

Device:           SYNA2B31:00 06CB:CEB3 Touchpad

mkdir -p ~/.config/fusuma
nano ~/.config/fusuma/config.yml

swipe:
  3:
    left:
      command: "hyprctl dispatch workspace e+1"
    right:
      command: "hyprctl dispatch workspace e-1"
    up:
      command: "hyprctl dispatch killactive"
    down:
      command: "hyprctl dispatch exit"
  4:
    left:
      command: "playerctl previous"
    right:
      command: "playerctl next"
    up:
      command: "playerctl play-pause"
    down:
      command: "playerctl stop"

pinch:
  in:
    command: "xdotool key ctrl+minus"
  out:
    command: "xdotool key ctrl+plus"

threshold:
  swipe: 0.4
  pinch: 0.1
interval:
  swipe: 0.8
  pinch: 0.1

fusuma

В ~/.config/hypr/hyprland.conf:

exec-once = fusuma -d


## open image(s)
sudo pacman -S imv
imv <imagepath>



yay -S swayosd
