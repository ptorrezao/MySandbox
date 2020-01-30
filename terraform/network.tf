resource "hcloud_network" "kubernetesNetwork" {
  name = "kubernetes"
  ip_range = "${var.networkmask}"
}

resource "hcloud_network_subnet" "kubernetesnetwork_subnet" {
  network_id = "${hcloud_network.kubernetesNetwork.id}"
  type = "server"
  network_zone = "eu-central"
  ip_range   = "${var.networkmask}"
}

resource "hcloud_server_network" "srvnetwork" {
  server_id = "${hcloud_server.master.id}"
  network_id = "${hcloud_network.kubernetesNetwork.id}"
}

resource "hcloud_server_network" "srvnetwork_workers" {
  count       = "${var.workers}"
  server_id  = "${element(hcloud_server.worker.*.id, count.index)}"
  network_id = "${hcloud_network.kubernetesNetwork.id}"
}
