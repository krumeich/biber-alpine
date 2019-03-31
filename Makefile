.PHONY: image biber

biber: image
	docker run -v $(PWD):/usr/local/bin -e branch=$(BRANCH) -e repo=$(REPO) krumeich/biber-alpine

image:
	docker build $(CACHE_OPTION) --tag krumeich/biber-alpine .

