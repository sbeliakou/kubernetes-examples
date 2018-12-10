# Ingress Controller

## Nginx, Baremetal

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/baremetal/service-nodeport.yaml
kubectl patch svc ingress-nginx -n ingress-nginx --patch '{ "spec": {"externalIPs": [ "192.160.1.101" ] }}'
kubectl get pods -n ingress-nginx
kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx --watch
```