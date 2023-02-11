
# Setup for local development
.PHONY: localhost
localhost:
	open http://127.0.0.1:4000/
	bundle exec jekyll serve

.PHONY: install
install:
	bundle install

