# jenkins

## Installation Guidelines

Install Jenkins without any modifications. By default LoadBalancer configuration will be installed.
```
helm install stable/jenkins
```
To set ServiceType use --set flag. 
```
helm install --set Master.ServiceType=ClusterIP stable/jenkins
```

## Enabling TLS through an Ingress


## References

  - [Croc Hunter](https://github.com/lachie83/croc-hunter)
  - [Croc Hunter CI/CD Pipeline Video1](https://www.youtube.com/watch?v=NVoln4HdZOY&t=435s)
  - [Croc Hunter CI/CD Pipeline Video2](https://www.youtube.com/watch?v=eMOzF_xAm7w&t=810s)