# mysql

## Installation Guidelines

### An approach that worked
Use Docker to build a custom image with data and schema and then use it for the Helm.
```
helm fetch stable/mysql
```
Unzip the file and edit the files in it. I edited deploymet.yaml.
```
kubectl create -f ./mysql-initdb-config.yaml
```
Or use this
```
kubectl create configmap mysql-initdb-config --from-file=./db.sql
```
Install using Helm
```
helm install --set service.type=LoadBalancer --name database ./mysql
```
To delete use helm delete and kubectl delete.
```
helm delete database
```
```
kubectl delete -f ./mysql-initdb-config.yaml
```
Or 
```
kubectl delete configmap mysql-initdb-config
```

### An approach that did not work( This is a bit messy)

Install MySQL exposing that to the outside world first.
```
helm install --name database -f ./mysql/mysql-helm.yaml stable/mysql
```
Get the IP of the Load Balancer.
```
kubectl get services
```
Connect to the Database and run the Database Scripts from db directory( run schema.sql first, then data.sql). Once done check if you can see the tables got created. 

Execute a Helm Upgrade to make sure the Database is accessible only within the Cluster.  
```
helm upgrade -f ./mysql/mysql-helm-upgraded.yaml database stable/mysql
```
Even kubectl patch did not work. 
```
kubectl patch service database-mysql -p '{"spec":{"type":"LoadBalancer"}}'
```
Note: Looks like you cannot change the Service Type to "LoadBalancer" now.

## References

  - [kubectl patch command](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#patch/)
  - [helm fetch command](http://technosophos.com/2017/04/05/if-kubernetes-is-your-home-helm-is-your-ikea.html)
  - [How to load mysql with data in kubernetes](https://stackoverflow.com/questions/45681780/how-to-initialize-mysql-container-when-created-on-kubernetes)
  