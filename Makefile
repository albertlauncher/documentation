image:
	DOCKER_BUILDKIT=0 docker build --tag jekyll .

serve:
	docker run -it --rm -p "4000:4000" -v "$(shell pwd)/src:/srv/jekyll" jekyll serve --host 0.0.0.0

build:	
	docker run -it --rm -v "$(shell pwd)/src:/srv/jekyll" jekyll build

check:
	docker run -it --rm -v $(shell pwd)/src/_site:/src klakegg/html-proofer:3.17.0 --allow-hash-href --check-html --empty-alt-ignore || true

deploy:
	cd ./src/_site
	git init
	git add .
	git commit -m "Build `date`"
	git push --force "https://github.com/albertlauncher/albertlauncher.github.io.git" master
	cd -

# set -x -e
# cd ./site
# git init
# git config user.name "Travis CI"
# git config user.email "deploy@travis-ci.org"
# git add .
# git commit -m "Automated Travis CI deployment"
# git push --force "https://${GITHUB_TOKEN}@github.com/albertlauncher/albertlauncher.github.io.git" master # &> /dev/null
