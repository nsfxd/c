#!/bin/bash

args=(
  sof-firmware # laptop sound driver
  bluez bluez-utils # bluetooth support
  wl-clipboard # wayland clipboard support
  noto-fonts ttf-firacode-nerd noto-fonts-cjk # fonts
  gdm gnome-shell gnome-tweaks power-profiles-daemon gnome-control-center xdg-desktop-portal-gnome # gnome base 
  nautilus eog gnome-system-monitor gnome-disk-utility # gnome's gui
  firefox alacritty neovide # other gui
)

sudo pacman -Syu "${args[@]}"

dconf load / < $HOME/n/c/gnome/dconf-settings.ini
