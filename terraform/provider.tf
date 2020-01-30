provider "hcloud" {
	token = "${var.hcloud_token}"
}

resource "hcloud_ssh_key" "cluster_admin" {
	name       = "cluster_admin"
	public_key = "${file(var.ssh_public_key)}"
}