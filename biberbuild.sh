#!/bin/sh

curl -L https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/current/biblatex-biber.tar.gz/download | \
    tar xz --strip 1 -C /biber

perl ./Build.PL
./Build installdeps
./Build test
./Build install

tar czvf /opt/biber.tar.gz -C / /usr/local/
