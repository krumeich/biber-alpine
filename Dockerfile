FROM alpine:3.8

RUN apk update && apk upgrade

RUN apk --no-cache add \
    bash git curl make gcc musl-dev openssl openssl-dev libxslt \
    libxslt-dev libgcrypt-dev perl perl-dev perl-utils unzip \
    perl-module-build perl-app-cpanminus gnupg  

RUN cpan install CPAN
RUN cpan install PAR::Packer
RUN cpan install Archive::Zip
RUN cpan install Net::SSLeay
RUN cpan install IO::Socket::SSL
RUN cpan install LWP::Protocol::https
RUN cpan install Business::ISBN
RUN cpan install Business::ISMN
RUN cpan install Business::ISSN
RUN cpan install Class::Accessor
RUN cpan install Data::Compare
RUN cpan install Data::Dump
RUN cpan install Data::Uniqid
RUN cpan install DateTime::Calendar::Julian
RUN cpan install DateTime::Format::Builder
RUN cpan install Encode::EUCJPASCII
RUN cpan install Encode::HanExtra
RUN cpan install Encode::JIS2K
RUN cpan install File::Slurper
RUN cpan install Lingua::Translit
RUN cpan install List::AllUtils
RUN cpan install List::MoreUtils
RUN cpan install List::MoreUtils::XS
RUN cpan install Log::Log4perl
RUN cpan install PerlIO::utf8_strict
RUN cpan install Regexp::Common
RUN cpan install Sort::Key
RUN cpan install Text::BibTeX
RUN cpan install Text::CSV
RUN cpan install Text::CSV_XS
RUN cpan install Text::Roman
RUN cpan install Unicode::Collate
RUN cpan install Unicode::GCString
RUN cpan install Unicode::LineBreak
RUN cpan install XML::LibXML
RUN cpan install XML::LibXML::Simple
RUN cpan install XML::LibXSLT
RUN cpan install XML::Writer
RUN cpan install autovivification
RUN cpan install Config::AutoConf
RUN cpan install ExtUtils::LibBuilder
RUN cpan install File::Which
RUN cpan install Test::Differences
RUN cpan install IO::String
RUN cpan install Unicode::Normalize

RUN apk add perl-par-packer

ADD biberbuild.sh /

CMD ["/biberbuild.sh"]
