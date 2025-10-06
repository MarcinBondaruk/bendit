terraform {
  backend "gcs" {}
}

variable "project" {}
variable "location" {}

resource "google_compute_address" "bendit_private_ip" {
  project = var.project
  name = "bendit-private-ip"
  subnetwork = data.terraform_remote_state.subnet.outputs.bendit_subnet_self_link
  region = var.location

  address_type = "INTERNAL"
  address = "10.118.10.2"
}

resource "google_compute_address" "bendit_public_ip" {
  name = "bendit-public-ip"
  network_tier = "STANDARD"
  address_type = "EXTERNAL"
}

output "bendit_private_ip" {
  value = google_compute_address.bendit_private_ip.address
}

output "bendit_private_ip_self_link" {
  value = google_compute_address.bendit_private_ip.self_link
}

output "bendit_public_ip" {
  value = google_compute_address.bendit_public_ip.address
}

output "bendit_public_ip_self_link" {
  value = google_compute_address.bendit_public_ip.self_link
}
