# How to retrieve Kubernetes Master token

```
kubeadm token generate
kubeadm token create <generated-token> --print-join-command --ttl=0
```
