terraform {
  backend "gcs" {}
}

resource "google_project_iam_member" "todo" {}
