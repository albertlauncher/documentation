#! /bin/bash

set -o errexit
set -o xtrace
docker run -it --rm --name jekyll -v "$(pwd)/src:/srv/jekyll" jekyll/jekyll jekyll build
docker run -it --rm -v $(pwd)/src/_site:/src  klakegg/html-proofer:3.17.0 --allow-hash-href --check-html --empty-alt-ignore
cd ./src/_site
git init
git add .
git commit -m "Build `date`"
git push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master
cd -
