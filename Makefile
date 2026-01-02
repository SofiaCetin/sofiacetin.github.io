PAGES = $(wildcard pages/*.html)
HTML  = $(subst pages/,public/,$(PAGES))
ASSETS = $(wildcard assets/*)

all: public $(HTML)
.PHONY: all

public/%.html: pages/%.html layout/before.html layout/after.html
	./scripts/buildpage.sh $<

public: $(ASSETS)
	mkdir -p public
	cp -r assets/* public/
	touch public

clean:
	rm -rf public
.PHONY: clean