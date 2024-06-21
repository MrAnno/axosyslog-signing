#!/usr/bin/env bash

set -e
set -x

export GNUPGHOME="$(mktemp -d)" && echo $GNUPGHOME
gpg --generate-key --batch axosyslog-pgp-gen.conf
gpg --export --armor --output axosyslog-pub.asc "AxoSyslog Signing Key"
gpg --export-secret-keys --armor --output axosyslog-priv.asc "AxoSyslog Signing Key"
rm -rf $GNUPGHOME
