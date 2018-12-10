## Kubernetes Cluster in Docker (DinD)

[kubernetes-sigs/kubeadm-dind-cluster](https://github.com/kubernetes-sigs/kubeadm-dind-cluster)

### Rolling Out

Options
```
./dind-cluster-v1.12.sh
usage:
  ./dind-cluster-v1.12.sh up
  ./dind-cluster-v1.12.sh reup
  ./dind-cluster-v1.12.sh down
  ./dind-cluster-v1.12.sh init kubeadm-args...
  ./dind-cluster-v1.12.sh join kubeadm-args...
  ./dind-cluster-v1.12.sh clean
  ./dind-cluster-v1.12.sh copy-image [image_name]
  ./dind-cluster-v1.12.sh e2e [test-name-substring]
  ./dind-cluster-v1.12.sh e2e-serial [test-name-substring]
  ./dind-cluster-v1.12.sh dump
  ./dind-cluster-v1.12.sh dump64
  ./dind-cluster-v1.12.sh split-dump
  ./dind-cluster-v1.12.sh split-dump64
```

Keep Scripts up2date
```
wget https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.9.sh
wget https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.10.sh
wget https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.11.sh
wget https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.12.sh
wget https://raw.githubusercontent.com/kubernetes-sigs/kubeadm-dind-cluster/master/fixed/dind-cluster-stable.sh

chmod a+x *.sh
```

Export Necessary Settings
```
export NUM_NODES=3
export EXTRA_PORTS="80:80"
...
```

Manage the Cluster
```
./dind-cluster-v1.12.sh up
...
deployment.extensions/kubernetes-dashboard scaled
..............................[done]
NAME          STATUS   ROLES    AGE     VERSION
kube-master   Ready    master   14m     v1.12.1
kube-node-1   Ready    <none>   3m51s   v1.12.1
kube-node-2   Ready    <none>   3m46s   v1.12.1
kube-node-3   Ready    <none>   3m50s   v1.12.1
* Access dashboard at: http://127.0.0.1:32769/api/v1/namespaces/kube-system/services/kubernetes-dashboard:/proxy
```