#!/usr/bin/bash

# Add an AUR remote for each submodule based on its path

SUBMODULES=`git config --file .gitmodules  --get-regexp path | awk '{ print $2 }'`
AURPULL="https://aur.archlinux.org/"
AURPUSH="ssh://aur@aur.archlinux.org/"

for mod in $SUBMODULES
do
  git remote add "${mod}" "${AURPULL}${mod}.git"
  git remote set-url --push "${mod}" "${AURPUSH}${mod}.git"
done
