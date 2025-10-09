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
    ports = ["22", "80", "443", "8080"]
  }

  priority = 1

  source_ranges = ["109.231.1.186"]
  destination_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "bendit_to_bendit" {
  name = "bendit-to-bendit"
  network = data.terraform_remote_state.vpc.outputs.bendit_vpc_self_link

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = ["80", "443", "8080"]
  }

  priority = 2

  source_ranges = ["34.0.240.173/32"]
  destination_ranges = ["10.118.10.2/32"]
}

resource "google_compute_firewall" "cloudflare_to_bendit" {
  name = "cloudflare-to-bendit"
  network = data.terraform_remote_state.vpc.outputs.bendit_vpc_self_link

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  priority = 2

  source_ranges = [
    "173.245.48.0/20",
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "141.101.64.0/18",
    "108.162.192.0/18",
    "190.93.240.0/20",
    "188.114.96.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17",
    "162.158.0.0/15",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "172.64.0.0/13",
    "131.0.72.0/22"
  ]
  destination_ranges = ["10.118.10.2/32"]
}

