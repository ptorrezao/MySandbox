variable "hcloud_token" {
  description = "Hetzner Cloud Token"
}

variable "networkmask" {
  default = "10.98.0.0/16"
}

variable "ssh_public_key" {
  description = "SSH public key to be copied on machines"
  default = "~/.ssh/id_rsa.pub"
}
variable "ssh_private_key" {
  description = "SSH private key to be used to log into machines"
  default = "~/.ssh/id_rsa"
}

variable "node_image" {
  description = "SO Image used on the Machines"
  default = "ubuntu-18.04"
}

variable "master_type" {
  default = "cx21"
}

variable "worker_type" {
  default = "cx11"
}

variable "workers" {
    default = 2
    description = "Quantity of Workers"
}