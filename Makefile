GEM=gem
BUNDLE_PATH?=vendor/bundle
BUNDLE_BIN=$(BUNDLE_PATH)/bin/bundle
export GEM_PATH:=$(PWD)/vendor/bundle

install:
	${GEM} install --no-user-install --install-dir $(BUNDLE_PATH) bundler -v "<2"
	$(BUNDLE_BIN) install --path $(BUNDLE_PATH)

clean:
	rm -Rf vendor

serve:
	$(BUNDLE_BIN) exec jekyll serve -w -H 0.0.0.0
