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

[automount]
enabled = false
options = "metadata"
mountFsTab = true
" | sudo tee /etc/wsl.conf
