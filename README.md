# My Sandbox

## Road Map

- [X] Deploy Cluster on Cloud via Terraform 
    - Run the Terraform script 
        ```bash
            terraform init
            terraform plan
        ```
    - After you run the Terraform script you might want to change you kube config
        ```bash
        
        ```
- [ ] Deploy Kubernetes Cluster
    - Prepare helm
        ```bash
            
        ```
- [ ] Deploy Traefik as Ingress Controller
        https://docs.traefik.io/user-guides/crd-acme/
        Add
        kubectl create namespace cert-manager
        kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.13.0/cert-manager.yaml
- [ ] Migrate Personal Projects into k8s

