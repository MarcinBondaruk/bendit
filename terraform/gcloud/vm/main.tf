terraform {
  backend "gcs" {}
}

variable "project" {}
variable "location" {}

resource "google_compute_disk" "bendit_core_disk" {
    name = "bendit-core-disk"
    type = "pd-ssd"
    size = 20
    zone = "${var.location}-a"
}

resource "google_compute_instance" "bendit_core" {
  name = "bendit-core"
  machine_type = "e2-micro"
  zone = "${var.location}-a"

  tags = ["bendit-core"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      labels = {
      }
    }
  }

  attached_disk {
    source = google_compute_disk.bendit_core_disk.self_link
  }

  network_interface {
    network = data.terraform_remote_state.vpc.outputs.bendit_vpc_self_link
    subnetwork = data.terraform_remote_state.subnet.outputs.bendit_subnet_self_link
    network_ip = data.terraform_remote_state.reserved_address.outputs.bendit_private_ip

    access_config {
      network_tier = "STANDARD"
      nat_ip = data.terraform_remote_state.reserved_address.outputs.bendit_public_ip
    }
  }

  service_account {
    email = data.terraform_remote_state.iam.outputs.bendit_core_sa_email
    scopes = []
  }
}
