resource "google_compute_firewall" "default_outbound_traffic" {
  name = "all-outbound-traffic"
  network = data.terraform_remote_state.vpc.outputs.bendit_vpc_self_link

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  priority = 0
  destination_ranges = ["0.0.0.0/0"]
  direction = "EGRESS"
}

resource "google_compute_firewall" "home_to_bendit" {
  name = "home-to-bendit"
  network = data.terraform_remote_state.vpc.outputs.bendit_vpc_self_link

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = ["22", "80", "8080"]
  }

  priority = 1

  source_ranges = ["109.231.1.186"]
  destination_ranges = ["0.0.0.0/0"]
}
