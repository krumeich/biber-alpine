#!/bin/sh

/usr/local/bin/biber-linux_x86_64-musl --version

/usr/local/bin/biber-linux_x86_64-musl --validate-control test.bcf

/usr/local/bin/biber-linux_x86_64-musl --convert-control test.bcf
