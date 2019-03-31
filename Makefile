BIBER_BINARY := biber-linux_x86_64-musl
BIBER_ARCHIVE :=$(BIBER_BINARY).tar.gz

.PHONY: all image biber test test-image clean upload

all: test

image:
	docker build $(CACHE_OPTION) -f Dockerfile.build --tag krumeich/biber-alpine .

biber: image
	docker run -v $(PWD):/usr/local/bin -e branch=$(BRANCH) -e repo=$(REPO) krumeich/biber-alpine

test-image:
	docker build $(CACHE_OPTION) -f Dockerfile.test --tag krumeich/biber-test .

test: $(BIBER_BINARY) test-image
	docker run --rm -v $(PWD):/usr/local/bin krumeich/biber-test

clean:
	rm -f $(BIBER_BINARY) $(BIBER_ARCHIVE)

$(BIBER_BINARY): biber

$(BIBER_ARCHIVE): $(BIBER_BINARY)
	tar czf $(BIBER_ARCHIVE) $(BIBER_BINARY)


