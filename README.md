# My Sandbox

## Road Map

- [X] Deploy Cluster on Cloud via Terraform 
    - Run the Terraform script 
        ```bash
        terraform apply -auto-approve
        ```
    - After you run the Terraform script you might want to change you kube config
        ```bash
        cp creds/admin.conf  ~/.kube/config 
        ```
- [ ] Deploy Kubernetes Cluster
    - Prepare helm
        ```bash
        kubectl apply -f tiller.yaml 
        helm init --service-account tiller --override spec.selector.matchLabels.'name'='tiller',spec.selector.matchLabels.'app'='helm' --output yaml | sed 's@apiVersion: extensions/v1beta1@apiVersion: apps/v1@' | kubectl apply -f -
        kubectl apply -f metallb_configmap.yaml
        
        kubectl apply -f kubernetes/user.yml
        kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml
        kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

        kubectl apply -f https://raw.githubusercontent.com/kubernetes/csi-api/release-1.14/pkg/crd/manifests/csidriver.yaml
        kubectl apply -f https://raw.githubusercontent.com/kubernetes/csi-api/release-1.14/pkg/crd/manifests/csinodeinfo.yaml
        kubectl apply -f https://raw.githubusercontent.com/hetznercloud/csi-driver/master/deploy/kubernetes/hcloud-csi.yml
        ```
- [ ] Deploy Traefik as Ingress Controller
- [ ] Migrate Personal Projects into k8s

