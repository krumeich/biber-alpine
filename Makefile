BIBER_BINARY := biber
BIBER_ARCHIVE := biber-linux-musl_x86_64.tar.gz
CTAN_DIR := biber-linux-musl
CTAN_ARCHIVE := $(CTAN_DIR).tar.gz
OTHER_BINARIES := biblex bibparse dumpnames


.PHONY: all image biber test test-image clean sourceforge package ctan

all: test

image:
	docker build $(CACHE_OPTION) -f Dockerfile.build --tag krumeich/biber-alpine .

biber:
	docker run --rm -v $(PWD):/opt -e branch=$(BRANCH) -e repo=$(REPO) krumeich/biber-alpine:biber220

test-image:
	docker build $(CACHE_OPTION) -f Dockerfile.test --tag krumeich/biber-test .

test: $(BIBER_BINARY) test-image
	docker run --rm -v $(PWD):/usr/local/bin -e branch=$(BRANCH) -e repo=$(REPO) krumeich/biber-test

clean:
	rm -rf $(BIBER_BINARY) $(BIBER_ARCHIVE) $(OTHER_BINARIES) $(CTAN_DIR) $(CTAN_ARCHIVE)

sourceforge:	test package
	scp $(BIBER_ARCHIVE) krumeich@frs.sourceforge.net:/home/pfs/p/biblatex-biber/biblatex-biber/development/binaries/Linux-musl

package: $(BIBER_ARCHIVE)

$(BIBER_ARCHIVE): $(BIBER_BINARY)
	tar czvf $(BIBER_ARCHIVE) $(BIBER_BINARY)

ctan: $(BIBER_BINARY)
	./biberpackage.sh


