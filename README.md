# My Sandbox

## Road Map

- [X] Deploy Kubernetes Cluster on Cloud via Terraform 
    - Run the Terraform script 
        ```bash
            terraform init
            terraform plan
            terraform apply
        ```
        Run command generated on Cluster Id
    - After you run the Terraform script you might want to change you kube config
        ```bash
        kubectl apply -f helm/tiller.yml 
        helm init --service-account tiller --override spec.selector.matchLabels.'name'='tiller',spec.selector.matchLabels.'app'='helm' --output yaml | sed 's@apiVersion: extensions/v1beta1@apiVersion: apps/v1@' | kubectl apply -f -
        ```
- [ ] Deploy nginx-ingress
    - Prepare Ingress
        ```bash
            kubectl create -f hello-kubernetes-first.yaml
            kubectl create -f hello-kubernetes-second.yaml
            helm install stable/nginx-ingress --name nginx-ingress --set controller.publishService.enabled=true --set controller.defaultBackendService=birra
        ```
- [ ] Deploy nginx-ingress with TLS
    - Prepare TLS
        ```bash
            kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml
            kubectl create namespace cert-manager
            helm repo add jetstack https://charts.jetstack.io
            helm install --name cert-manager --version v0.11.0 --namespace cert-manager jetstack/cert-manager
            kubectl create -f production_issuer.yaml
        ```
- [ ] Migrate Personal Projects into k8s

