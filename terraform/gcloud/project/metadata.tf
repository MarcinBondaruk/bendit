resource "google_compute_project_metadata" "default_ssh_keys" {
  metadata = {
    ssh-keys = <<EOF
      bendit:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK4kPtJefse0JAlE0dMKbiXJaO34m8NWm0ewCUrxf+m7 bendit@bendit
    EOF
  }
}
