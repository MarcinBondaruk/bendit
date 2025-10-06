terraform {
  backend "gcs" {}
}

variable "project" {}
variable "location" {}

resource "google_compute_subnetwork" "bendit_subnet" {
  name = "bendit-subnet"
  region = var.location
  network = data.terraform_remote_state.vpc.outputs.bendit_vpc_self_link
  ip_cidr_range = "10.118.10.0/24"
}
