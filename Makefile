BIBER_BINARY := biber
BIBER_ARCHIVE := biber-linux_x86_64-musl.tar.gz
OTHER_BINARIES := biblex bibparse dumpnames


.PHONY: all image biber test test-image clean upload package

all: test

image:
	docker build $(CACHE_OPTION) -f Dockerfile.build --tag krumeich/biber-alpine .

biber: image
	docker run --rm -v $(PWD):/opt -e branch=$(BRANCH) -e repo=$(REPO) krumeich/biber-alpine

test-image:
	docker build $(CACHE_OPTION) -f Dockerfile.test --tag krumeich/biber-test .

test: $(BIBER_BINARY) test-image
	docker run --rm -v $(PWD):/usr/local/bin krumeich/biber-test

clean:
	rm -f $(BIBER_BINARY) $(BIBER_ARCHIVE) $(OTHER_BINARIES)

upload:	test package
	scp $(BIBER_ARCHIVE) krumeich@frs.sourceforge.net:/home/pfs/p/biblatex-biber/biblatex-biber/development/binaries/Linux-musl

package: $(BIBER_ARCHIVE)

$(BIBER_ARCHIVE): $(BIBER_BINARY)
	tar czf $(BIBER_ARCHIVE) $(BIBER_BINARY)


