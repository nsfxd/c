#!/bin/sh
# https://stackoverflow.com/a/52269934

usage() {
  echo "Usage: cpgit [GITHUB_REPO_SUBDIR_URL] [PATH]"
  exit
}

silent() {
 $@ > /dev/null 2>&1
}

url=$1
targetDir=$2

if [[ -z "$url" ]]; then
  usage
fi

if [[ -z "$targetDir" ]]; then
  targetDir="."
fi

domain=$(echo $url | cut -d '/' -f3)

repoFromUrl() {
  case "$domain" in
    # https://github.com/tokio-rs/axum/tree/main/examples/hello-world
    github.com) echo $url | cut -d '/' -f1-5
    ;;
    # https://git.sr.ht/~sircmpwn/sway/tree/master/item/sway
    git.sr.ht) echo $url | cut -d '/' -f1-5
    ;;
    # https://gitlab.freedesktop.org/xrdesktop/gnome-shell/-/tree/42.0-xrdesktop/src
    *gitlab*) echo $url | cut -d '/' -f1-5
    ;;
    *) echo "failed to detect repo"; exit 1
    ;;
  esac
}

subDirFromUrl() {
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

repo=$(repoFromUrl)
subDir=$(subDirFromUrl)
tmpDir=$(mktemp -d -t XXXXXXXXXX-$(date +%Y-%m-%d-%H-%M-%S))

echo "Copying ""$url"" into ""'""$targetDir""'""..."
silent pushd "$tmpDir"
silent git clone \
  --depth 1  \
  --filter=blob:none  \
  --sparse \
  "$repo" .
silent git sparse-checkout set "$subDir"
silent popd
mkdir -p "$targetDir"
mv "$tmpDir"/"$subDir" "$targetDir"
