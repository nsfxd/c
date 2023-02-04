#!/bin/bash

echo "[user]
default=$USER

[interop]
enabled=true
appendWindowsPath=false

[network]
hostname=a
generateHosts=false

[boot]
systemd=true
" | sudo tee /etc/wsl.conf
