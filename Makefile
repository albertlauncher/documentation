info:
	less Makefile

clean:
	rm src/Gemfile.lock || true
	docker container rm jekyll-build jekyll-serve

doxygen:
	rm -rf albert src/reference
	git clone --depth 1 https://github.com/albertlauncher/albert.git
	doxygen

build: doxygen
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

.PHONY: doxygen
