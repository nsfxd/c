#!/bin/sh

/mnt/c/windows/system32/WindowsPowerShell/v1.0/powershell.exe Get-Clipboard | tr -d '\r' | sed -z '$ s/\n$//'
