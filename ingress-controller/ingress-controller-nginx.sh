#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/baremetal/service-nodeport.yaml

IPADDR=$(kubectl get node k8s-1 -o go-template --template '{{range .status.addresses}}{{if (eq .type "InternalIP")}}{{.address}}{{end}}{{end}}')
kubectl patch svc ingress-nginx -n ingress-nginx --patch '{ "spec": {"externalIPs": [ "'${IPADDR}'" ] }}'
kubectl get pods -n ingress-nginx
kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx --watch