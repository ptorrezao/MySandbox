resource "digitalocean_kubernetes_cluster" "kubernetes" {
  name          = "k8scluster"
  region        = "${var.clusterZone}"
  version       = "${var.clusterVersion}"
  tags          = ["${var.enviroment}"]

  node_pool {
    name       = "worker-pool-as"
    size       = "${var.slugSize}"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
    tags       = ["${var.enviroment}"]
  }

  
}

data "local_file" "getkubeconfig" {
  filename = "${path.module}/scripts/getKubeConfig.sh"
}


output "cluster-id" {
  value = "${path.module}/scripts/getKubeConfig.sh ${var.do_token} ${digitalocean_kubernetes_cluster.kubernetes.id}  && cp creds/config  ~/.kube/config"
}