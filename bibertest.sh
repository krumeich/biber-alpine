#!/bin/sh

/usr/local/bin/biber --version

/usr/local/bin/biber --validate-control test-dev.bcf

/usr/local/bin/biber --convert-control test-dev.bcf
