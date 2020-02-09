variable "do_token" {}

variable "clusterZone" {
  default = "fra1"
}

variable "clusterVersion" {
  default = "1.16.6-do.0"
}
variable "slugSize" {
  default = "s-1vcpu-2gb"
}

variable "enviroment" {
  default = "development"
}
