#!/bin/sh

repoAndSub=$1
to=$2

repo=$(echo $repoAndSub | cut -d "/" -f1-2 )
sub=$(echo $repoAndSub | cut -d "/" -f3- )

grepo="git@github.com:$repo"
tmp=/tmp/"$(echo $sub | sed 's/\//_/g')"-$(date +%s)

# Create local repository for subdirectory checkout, make it hidden to avoid having to drill down to the subfolder

mkdir -p $tmp
pushd $tmp
git init
git remote add -f origin $grepo
git config core.sparseCheckout true

# # Add the subdirectory of interest to the sparse checkout.
echo $sub >> .git/info/sparse-checkout
git pull origin master
popd

mkdir -p $to
mv $tmp/$sub/* $to
