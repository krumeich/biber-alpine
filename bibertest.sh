#!/bin/sh

BIBER_BRANCH=${branch:-dev}
BIBER_REPO=${repo:-plk/biber}

wget https://raw.githubusercontent.com/${BIBER_REPO}/${BIBER_BRANCH}/testfiles/test.bcf
wget https://raw.githubusercontent.com/${BIBER_REPO}/${BIBER_BRANCH}/testfiles/test.bib

/usr/local/bin/biber --version

/usr/local/bin/biber --validate-control test.bcf

/usr/local/bin/biber --convert-control test.bcf
