# My Sandbox

## Road Map

- [X] Deploy Cluster on Cloud via Terraform 
    - Run the Terraform script 
        ```bash
            terraform init
            terraform plan
            terraform apply
        ```
        Run command generated on Cluster Id
    - After you run the Terraform script you might want to change you kube config
        ```bash
        kubectl apply -f tiller.yml 
        helm init --service-account tiller --override spec.selector.matchLabels.'name'='tiller',spec.selector.matchLabels.'app'='helm' --output yaml | sed 's@apiVersion: extensions/v1beta1@apiVersion: apps/v1@' | kubectl apply -f -
        ```
- [ ] Deploy Kubernetes Cluster
    - Prepare helm
        ```bash
            kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.1/deploy/static/mandatory.yaml
            kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.1/deploy/static/provider/cloud-generic.yaml
        ```
- [ ] Deploy Traefik as Ingress Controller
        https://docs.traefik.io/user-guides/crd-acme/
        Add
        kubectl create namespace cert-manager
        kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.13.0/cert-manager.yaml
- [ ] Migrate Personal Projects into k8s

