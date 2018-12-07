FROM alpine

RUN apk update && apk upgrade

RUN apk add curl make gcc musl-dev openssl openssl-dev libxslt \
    libxslt-dev libgcrypt-dev perl perl-dev perl-utils \
    perl-module-build perl-app-cpanminus gnupg perl-par-packer

WORKDIR /biber

RUN curl -L https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/current/biblatex-biber.tar.gz/download | \
    tar xz --strip 1 -C /biber

RUN perl ./Build.PL
RUN ./Build installdeps

WORKDIR /

RUN rm -rf /biber

WORKDIR /biber

ADD biberbuild.sh /biber

CMD ["./biberbuild.sh"]
