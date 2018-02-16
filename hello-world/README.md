# hello-world

## Prerequisites

  - gcloud 
  - kubectl
  - helm

## Installation Guidelines

Create a Static IP using gcloud
```
gcloud compute addresses create hello-world-ip --global
```
Check if the IP got created
```
gcloud compute addresses describe hello-world-ip --global
```
Check if the IP got created
```
gcloud compute addresses describe hello-world-ip --global
```
Create a secret in your Kubernetes Cluster
```
kubectl create secret tls hello-world-secret --key /path_to_key/tls.key --cert /path_to_cert/tls.crt
```
Update YOUR_HOST_NAME in ./hello-world/values.yaml with your host name.
```
ingress:
  enabled: true
  annotations: 
    kubernetes.io/ingress.global-static-ip-name: hello-world-ip
    kubernetes.io/ingress.allow-http: "false"
  path: /
  hosts:
    - YOUR_HOST_NAME # Update this e.g. example.com, hello-world.example.com
  tls: 
    - secretName: hello-world-secret
      hosts:
        - YOUR_HOST_NAME # Update this e.g. example.com, hello-world.example.com
```
Install using Helm
```
helm install ./hello-world
```

## Cleaning Up

Find the Helm Name (HELM_NAME) using the below command
```
helm list
```
Delete Helm
```
helm delete HELM_NAME
```
Delete Static IP
```
gcloud compute addresses delete hello-world-ip --global
```
## References

  - [Developing Charts using Helm](https://docs.helm.sh/developing_charts/)
  - [Configuring Domain Names with Static IP Addresses on Google Cloud](https://cloud.google.com/kubernetes-engine/docs/tutorials/configuring-domain-name-static-ip)
