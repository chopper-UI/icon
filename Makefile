THEME = $(HOME)/.spm/themes/chopper

build-doc:
	@nico build -v -C $(THEME)/nico.js

debug:
	@nico server -C $(THEME)/nico.js --watch debug

server:
	@nico server -C $(THEME)/nico.js

watch:
	@nico server -C $(THEME)/nico.js --watch

publish-doc: clean build-doc
	@spm publish --doc _site -s chopper

clean:
	@rm -fr _site

build:
	@spm build

reporter = spec
url = tests/runner.html
test:
	@mocha-phantomjs --reporter=${reporter} http://127.0.0.1:8000/${url}


.PHONY: build-doc debug server publish-doc clean test
