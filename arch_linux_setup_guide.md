# Preparation
1. download official ISO from archlinux.org
2. make a bootable USB from this ISO
3. boot into usb

# Install preparation
1. using iwctl to connect Wifi 
    1. `device list` to check wifi station (e.g. wlan0)
    2. `station wlan0 connect <SSID>`

# Arch Installer
- choose HK mirror
- format disk using recommended partition, using btrfs
- set root password
- create user
- set time zone
- use linux-zen kernel
- set disk encryption
- network setting -> NetworkManager

# Post Install 

## Commands
1. install git
2. `mkdir n && cd n`
3. git clone git@github.com/nsfxd/c
4. run `pacman.sh` and `pacman_gnome.sh`

## Firefox
1. 
