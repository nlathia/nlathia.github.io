
# Setup for local development
.PHONY: localhost
localhost:
	bundle exec jekyll serve

.PHONY: install
install:
	bundle install

