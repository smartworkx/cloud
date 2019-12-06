# Smartworkx cloud

Chosen for google cloud because it has cheaper kubernetes support.

## Triggering deploy
curl -X POST -u <username> https://api.github.com/repos/<account>/<repo>/deployments -d @staging.json

## Installation of terraform and setting up project

https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/5.1.1

- init-cloud.sh 
- terraform apply
- go clusters in web browser copy command to connect 
https://console.cloud.google.com/kubernetes/list?authuser=2&hl=nl&project=smartworkx-test
- do kubectl get nodes to check
- install helm
- run helm init
- check tiller is running in the cluster kubectl get pods --all-namespaces
- kubectl create serviceaccount --namespace kube-system tiller
- kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
- kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

## Working locally
- https://microk8s.io/docs/
- alias kubectl='microk8s.kubectl'

## Usefull
- https://kubernetes.io/docs/reference/kubectl/cheatsheet/
