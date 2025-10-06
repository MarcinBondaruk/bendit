locals {
  project  = "lexical-aileron-473815-a6"
  location   = "europe-central2"
  bucket   = "bendit-terraform-state-bucket"

  state_prefix = "${path_relative_to_include()}/terraform.tfstate"
}

remote_state {
  backend = "gcs"
  config = {
    bucket   = local.bucket
    prefix   = local.state_prefix
    project  = local.project
    location = local.location
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "${local.project}"
  region  = "${local.location}"
}
EOF
}

inputs = {
  project = local.project
  location = local.location
  state_bucket = local.bucket
}
