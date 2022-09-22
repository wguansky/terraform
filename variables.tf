variable "region" {
  type    = string
  default = "asia-east2"
}

variable "project_id" {
  type    = string
  default = "my-first-k8s-362709"
}

variable "zone" {
  type    = string
  default = "asia-east2-b"
}
variable "instance_type" {
  type    = string
  default = "e2-medium"
}

variable "user" {
default = "wguan"
}

variable "public_key"{
type=string
}

variable "private_key"{
type=string
}
