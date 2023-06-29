all: doxygen-build jekyll-build jekyll-deploy

doxygen-build:
	[ -d albert ] || git clone --depth 1 https://github.com/albertlauncher/albert.git
	[ -d albert/doxygen-awesome-css ] || git clone --depth 1 https://github.com/jothepro/doxygen-awesome-css.git albert/doxygen-awesome-css
	cp Doxyfile albert
	docker run --rm -v $(shell pwd)/albert:/data -v $(shell pwd)/output:/output -it hrektts/doxygen doxygen 
	mv output/html src/reference 

jekyll-build:	
	docker run -t --rm -v "$(shell pwd)/src:/srv/jekyll" jekyll/jekyll jekyll build

jekyll-serve:
	docker run -t --rm -v "$(shell pwd)/src:/srv/jekyll" -p "4000:4000" jekyll/jekyll jekyll serve --host 0.0.0.0

jekyll-check:
	docker run -t --rm -v "$(shell pwd)/src/_site:/src" klakegg/html-proofer:3.17.0 --allow-hash-href --check-html --empty-alt-ignore || true

jekyll-deploy: 
	git -C ./src/_site init
	git -C ./src/_site add .
	git -C ./src/_site commit -m "Build `date`"
	git -C ./src/_site push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master

