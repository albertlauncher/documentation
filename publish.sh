#!/bin/bash

set -o errexit

echo -e "\e[34m- - - Build Jekyll site - - -\e[0m"
jekyll b -s src -d albertlauncher.github.io || exit 1

echo -e "\e[34m- - - Push to github pages - - -\e[0m"
cd albertlauncher.github.io || exit 2
git add -A || exit 3
git commit -m "Update website" || exit 4
git push || exit 5

echo -e "\e[34m- - - Finally push to documentation - - -\e[0m"
cd ../src || exit 6
git add -A || exit 7
git commit -m "Update" || exit 8
git push || exit 9
