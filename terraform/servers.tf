resource "hcloud_server" "master" {
  name        = "master-1"
  image       = "${var.node_image}"
  server_type = "${var.master_type}"
  ssh_keys    = ["${hcloud_ssh_key.cluster_admin.id}"]

  connection {
    private_key = "${file(var.ssh_private_key)}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /root/bootstrap.sh",
      "bash /root/bootstrap.sh",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/scripts/master.sh"
    destination = "/root/master.sh"
  }

  provisioner "remote-exec" {
    inline = "/bin/bash /root/master.sh"
  }

  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/copy_local.sh"

    environment {
      SSH_PRIVATE_KEY = "${var.ssh_private_key}"
      SSH_CONN        = "root@${hcloud_server.master.ipv4_address}"
      COPY_TO_LOCAL   = "creds/"
    }
  }
}

resource "hcloud_server" "worker" {
  count       = "${var.workers}"
  name        = "worker-${count.index}"
  server_type = "${var.worker_type}"
  image       = "${var.node_image}"
  depends_on  = ["hcloud_server.master"]
  ssh_keys    = ["${hcloud_ssh_key.cluster_admin.id}"]

  connection {
    private_key = "${file(var.ssh_private_key)}"
  }

  provisioner "file" {
    source      = "${path.module}/scripts/bootstrap.sh"
    destination = "/root/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /root/bootstrap.sh",
      "bash /root/bootstrap.sh",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/creds/cluster_join"
    destination = "/tmp/cluster_join"

    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${file(var.ssh_private_key)}"
    }
  }

  provisioner "file" {
    source      = "${path.module}/scripts/node.sh"
    destination = "/root/node.sh"
  }

  provisioner "remote-exec" {
    inline = "bash /root/node.sh"
  }
}
