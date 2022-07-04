image:
	DOCKER_BUILDKIT=0 docker build --tag jekyll .

serve:
	docker run -it --rm -p "4000:4000" -v "$(shell pwd)/src:/srv/jekyll" jekyll serve --host 0.0.0.0

build:	
	docker run -it --rm -v "$(shell pwd)/src:/srv/jekyll" jekyll build

check:
	docker run -it --rm -v $(shell pwd)/src/_site:/src klakegg/html-proofer:3.17.0 --allow-hash-href --check-html --empty-alt-ignore || true

deploy: build check
	git -C ./src/_site init
	git -C ./src/_site add .
	git -C ./src/_site commit -m "Build `date`"
	git -C ./src/_site push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master


