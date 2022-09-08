SHELL := /bin/bash

POSTER_FILES =  myMacros.tex \
	poster-style.tex \
	poster-settings.tex \
	graphics/sfb-logo-quer.pdf \
	graphics/hhu-logo-hres.pdf \
	$(wildcard packages/*.sty) \
	poster-examples.tex  \
  muss.bbx \
	muss.cbx

test_poster:
	rm -fr test
	mkdir test
	cd test; mkdir poster-template
	cp -r --parents $(POSTER_FILES) test/poster-template
	cp poster-template.tex \
		references.bib \
		latexmkrc \
		test
	cd test; \
			latexmk -pdf poster-template.tex

release_poster:
	rm -fr temp
	mkdir temp
	cd temp; mkdir poster-template
	cp -r --parents $(POSTER_FILES) temp/poster-template
	cp poster-template.tex \
		references.bib \
		latexmkrc \
		temp
	cd temp; zip -r poster-template.zip *; mv poster-template.zip ..
	rm -fr temp
