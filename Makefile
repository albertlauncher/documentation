info:
	less Makefile

clean:
	rm src/Gemfile.lock
	docker container rm jekyll

doxygen:
	rm -rf albert src/reference
	git clone --depth 1 https://github.com/albertlauncher/albert.git
	doxygen

build:
	docker-compose up --build jekyll-build

serve:
	docker-compose up jekyll-serve

html-proofer:
	docker-compose up html-proofer

deploy: doxygen html-proofer build
	git -C ./src/_site init
	git -C ./src/_site add .
	git -C ./src/_site commit -m "Build `date`"
	git -C ./src/_site push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master

.PHONY: doxygen
