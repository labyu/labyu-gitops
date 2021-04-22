#!/bin/bash


CERT_PATH=/etc/letsencrypt/live/labyu.me/cert.pem
KEY_PATH=/etc/letsencrypt/live/labyu.me/privkey.pem
SECRET=labyu-tls-secret



################
# Default
################
kubectl -n default delete secret $SECRET
kubectl -n default create secret tls $SECRET \
  --cert=$CERT_PATH \
  --key=$KEY_PATH

###############
# Argocd
###############
NS=argocd
kubectl -n $NS delete secret $SECRET
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$NS -f -


###############
# Jenkins
###############
NS=jenkins
kubectl -n $NS delete secret $SECRET
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$NS -f -

###############
# Logging
###############
NS=logging
kubectl -n $NS delete secret $SECRET
kubectl get secret $SECRET --namespace=default -oyaml | grep -v namespace | kubectl apply --namespace=$NS -f -


