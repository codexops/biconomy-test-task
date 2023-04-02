## Kubernetes

## Prerequisites

- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- AWS credentials ( ACCESS_ID and SECRET_KEY ) for EKS access
- [helm3](https://helm.sh/docs/intro/install/)

## Setup

- Clone Repo

```sh
      git clone path/to/repo

      cd k8s
```

## Deploy Webservers

```sh
      helm upgrade --install webserver helm-chart/
```
### Deploy Cluter Addons

Webserver-one:
```sh
      kubectl apply -f cluster-addons/metrics-server.yaml
```
<br>

### Deploy Ingress

`Note`: Replace DNS_TO_REPLACE with DNS Domain and INGRESS_CLASS_TO_REPLACE with ingress controller Class. Loadbalancer will be auto created with the help of Ingress.
<br>
For Deploying Internet facing [Ingress-controller](https://www.nginx.com/blog/deploying-nginx-ingress-controller-on-amazon-eks-how-we-tested/)
```sh
      kubectl apply -f webservers/ingress.yaml
```
We can deploy seprate ingress class for internal services.

To test on local without Ingress

```sh
      kubectl -n webservers port-forward svc/webserver 3000:3000
```
Open any browser with http://localhost:80/

### Application Monitoring through Prometheus and Grafana

Deploy Promethues as a metrics scraper and Grafana for visualizing the graphs of the metrics for getting better insight of application deployed in Kubernetes cluster.

```sh
      helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
      helm repo update
      helm install [RELEASE_NAME] prometheus-community/prometheus
      helm repo add grafana https://grafana.github.io/helm-charts
      helm install grafana grafana/grafana
```
### Improvements

- Use Network policies to control the network access in k8s cluster and use different namespace for internal and external services.
- Use separate service accounts for each service with only required permissions.
- We can use alb ingress controller which is more compatible with AWS services.
- Expose the services only on https.

