#! /bin/bash

set -o errexit
set -o xtrace
docker run -it --rm --name jekyll -p "4000:4000" -v "$(pwd)/src:/srv/jekyll" jekyll/jekyll jekyll serve
