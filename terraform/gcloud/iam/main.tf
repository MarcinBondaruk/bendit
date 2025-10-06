terraform {
  backend "gcs" {}
}

variable "project" {}

resource "google_service_account" "bendit_core_sa" {
  account_id = "bendit-core"
  project = var.project
}

output "bendit_core_sa_email" {
  value = google_service_account.bendit_core_sa.email
}
