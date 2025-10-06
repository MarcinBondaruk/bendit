terraform {
  backend "gcs" {}
}

variable "project" {}

resource "google_compute_network" "vpc" {
  name = "bendit-vpc"
  project = var.project
}

output "bendit_vpc_self_link" {
  value = google_compute_network.vpc.self_link
}
