#!/bin/sh

BIBER_BRANCH=${branch:-dev}
BIBER_REPO=${repo:-plk/biber}

wget https://raw.githubusercontent.com/${BIBER_REPO}/${BIBER_BRANCH}/testfiles/test.bcf
wget https://raw.githubusercontent.com/${BIBER_REPO}/${BIBER_BRANCH}/testfiles/test.bib

/opt/bin/biber --version

/opt/bin/biber --validate-control test.bcf

/opt/bin/biber --convert-control test.bcf
