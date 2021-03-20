#!/bin/bash

CERT_PATH=/etc/letsencrypt/live/baruntravel.me/cert.pem
KEY_PATH=/etc/letsencrypt/live/baruntravel.me/privkey.pem
SECRET=baruntravel-tls-secret

################
# Default
################
kubectl -n baruntravel delete secret $SECRET
kubectl -n baruntravel create secret tls $SECRET \
  --cert=$CERT_PATH \
  --key=$KEY_PATH


