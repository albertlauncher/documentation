build:	
	docker run -t --rm -v "$(shell pwd)/src:/srv/jekyll" jekyll/jekyll jekyll build
	[ -d doxygen-awesome-css ] || git clone https://github.com/jothepro/doxygen-awesome-css.git
	docker run --rm -v $(shell pwd):/data -v $(shell pwd)/src/_site/reference:/output -it hrektts/doxygen doxygen

serve:
	docker run -t --rm -v "$(shell pwd)/src:/srv/jekyll" -p "4000:4000" jekyll/jekyll jekyll serve --host 0.0.0.0

check:
	docker run -t --rm -v "$(shell pwd)/src/_site:/src" klakegg/html-proofer:3.17.0 --allow-hash-href --check-html --empty-alt-ignore || true

deploy: 
	git -C ./src/_site init
	git -C ./src/_site add .
	git -C ./src/_site commit -m "Build `date`"
	git -C ./src/_site push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master

