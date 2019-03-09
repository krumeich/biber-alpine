.PHONY: image biber

image:
	docker build $(CACHE_OPTION) --tag krumeich/biber-alpine .

biber:
	docker run -v $PWD:/usr/local/bin -e branch=$(BRANCH) krumeich/biber-alpine
