
# Setup for local development
.PHONY: localhost
localhost:
	bundle exec jekyll serve --open-url



.PHONY: install
install:
	bundle install

