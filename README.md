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

## References

  - [Developing Charts using Helm](https://docs.helm.sh/developing_charts/)