# helm

## Usage Guidelines

Add Helm Repo
```
helm repo add welagedara https://welagedara.github.io/helm/
```
Check if the Repo got added succefully
```
helm repo list
```
Update the Repos
```
helm repo update
```
Install hello-world. The latest version will be installed if --version flag is not set.
```
helm install welagedara/hello-world 
```

## How to update the Repo

Check for errors
```
helm lint ./hello-world/
```
Package it
```
helm package ./hello-world/
```
Update index.yaml
```
helm repo index ./
```
Push the artifacts to Github
```
git push origin master
```

## Upgrade and Rollback 

Install the app
```
helm install ./hello-world
``` 
Upgrade the app
```
helm upgrade --set replicaCount=2,image.tag="1.13" HELM_NAME ./hello-world
```
To check nginx version
```
kubectl exec POD_NAME -- nginx -v
```
To rollback
```
helm rollback HELM_NAME REVISION_NUMBER
```
Example:
```
helm rollback needled-hog 1
```

## Releases

  - V1.0.0.RELEASE (hello-word helm chart is completed)

## References

  - [Developing Charts using Helm](https://docs.helm.sh/developing_charts/)
  - [Building Helm Charts From the Ground Up Video Tutorial](https://www.youtube.com/watch?v=vQX5nokoqrQ)
  