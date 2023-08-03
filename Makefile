all: doxygen jekyll-build jekyll-deploy

doxygen:
	rm -rf albert
	git clone --depth 1 https://github.com/albertlauncher/albert.git
	doxygen
	rm -rf src/reference
	mv albert/output/html src/reference

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

clean:
	rm -rf output albert

.PHONY: doxygen
