info:
    less Makefile

clean:
    rm src/Gemfile.lock || true
    docker container rm jekyll-build jekyll-serve

clone:
    git clone --recursive --depth 1 --jobs 100 https://github.com/albertlauncher/albert.git

doxygen:
    rm -rf src/reference
    doxygen

readmes:
    rm -rf src/_site/readmes
    mkdir -p src/_site/readmes
    for path in albert/plugins/*/README.md
    do
    echo ${i:15:-10}; done
    cp albert/README.md src/_site/readmes/albert.md
    cp albert/plugins/README.md src/_site/readmes/plugins.md
    cp albert/plugins/README.md src/_site/readmes/plugins.md

build:
    docker-compose up --build jekyll-build

serve: doxygen
    docker-compose up --build jekyll-serve

html-proofer: build
    docker-compose up html-proofer

deploy: doxygen html-proofer build
    git -C ./src/_site init
    git -C ./src/_site add .
    git -C ./src/_site commit -m "Build `date`"
    git -C ./src/_site push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master

