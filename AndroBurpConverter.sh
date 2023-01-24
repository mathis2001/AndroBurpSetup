#!/bin/bash

CERT_PATH="cacert.der"

openssl x509 -inform DER -in $CERT_PATH -out cacert.pem

CERT="`openssl x509 -inform PEM -subject_hash_old -in cacert.pem | head -1`.0"

mv cacert.pem $CERT

echo "Certificate successfully converted to $CERT !"
