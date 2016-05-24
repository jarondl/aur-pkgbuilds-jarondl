#!/usr/bin/bash

# Warranty void if used at all. Contains potentially
# destructive code.


# Add an AUR branch for each submodule based on its path.
# Make sure you have the right .gitmodules in the current dir.




SUBMODULES=`git config --file .gitmodules  --get-regexp path | awk '{ print $2 }'`

git fetch --all

echo " $SUBMODULES "

for mod in $SUBMODULES
do
  if git checkout --orphan "${mod}"; then
     # branch did not exist, new branch created
     git rm -rf .
  else
     git checkout "${mod}"
  fi
  git merge --ff-only "${mod}/master"
done
