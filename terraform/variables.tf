variable "do_token" {}

variable "clusterZone" {
  default = "fra1"
}

variable "clusterVersion" {
  default = "1.16.2-do.3"
}
variable "slugSize" {
  default = "s-1vcpu-2gb"
}

variable "enviroment" {
  default = "development"
}
