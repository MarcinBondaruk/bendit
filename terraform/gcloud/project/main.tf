terraform {
  backend "gcs" {}
}

variable "project" {}

resource "google_project_service" "cloud_resource_manager_api" {
  project = var.project
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "compute_api" {
  project = var.project
  service = "compute.googleapis.com"
}

resource "google_project_service" "iam_api" {
  project = var.project
  service = "iam.googleapis.com"
}

