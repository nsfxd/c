#!/bin/sh
# https://stackoverflow.com/a/52269934
# https://sharats.me/posts/shell-script-best-practices/

set -o errexit
set -o nounset
set -o pipefail

silent() {
 $@ > /dev/null 2>&1
}

usage() {
  echo "Usage: cpgit [REPO_SUBDIR_URL | GITHUB_REPO_SUBDIR] [PATH]"
  exit
}

if [[ -z "$1" ]]; then
  usage
fi

targetDir="$2"
[[ "$1" == "http"* ]] && isURL=1 || isURL=0
[[ "$isURL" = 0 ]] && domain="github.com" || domain=$(echo "$1" | cut -d '/' -f3)
[[ "$isURL" = 0 ]] && repo=$(echo "$1" | cut -d '/' -f1-2) || repo=$(echo "$1" | cut -d '/' -f4-5)

url='git@'"$domain"':'"$repo"

subDirFromUrl() {
  local url="$1"
  case "$domain" in
    # https://github.com/tokio-rs/axum/tree/main/examples/hello-world
    github.com) echo $url | cut -d '/' -f8-
    ;;
    # https://git.sr.ht/~sircmpwn/sway/tree/master/item/sway
    git.sr.ht) echo $url | cut -d '/' -f9-
    ;;
    # https://gitlab.freedesktop.org/xrdesktop/gnome-shell/-/tree/42.0-xrdesktop/src
    *gitlab*) echo $url | cut -d '/' -f9-
    ;;
    *) echo "failed to detect repo"; exit 1
    ;;
  esac
}

[[ "$isURL" = 0 ]] && subDir=$(echo "$1" | cut -d '/' -f3-) || subDir=$(subDirFromUrl "$1")

tmpDir=$(mktemp -d -t XXXXXXXXXX-$(date +%Y-%m-%d-%H-%M-%S))

echo 'Copying '"$url"' into '"'""$targetDir""'"'...'
pushd "$tmpDir"
git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  "$url" .
git sparse-checkout set "$subDir"
popd
mkdir -p "$targetDir"

shopt -s dotglob
mv "$tmpDir"/"$subDir"/* "$targetDir"
