.phony: site site-local run publish
site:
	rm -rf output
	emacs --script publish.el
	ln -sfv ../static output/static

site-local:
	CONFIG=local emacs --script publish.el

run: site-local
	mkdir -p output
	rm -f output/static
	ln -sfv ../static output/static
	mongoose-server -d output

publish: site
	./upload.sh
