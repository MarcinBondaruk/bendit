variable "state_bucket" {}

data "terraform_remote_data" "iam" {
  backend = "gcs"

  config = {
    bucket = var.state_bucket
    prefix = "iam/terraform.tfstate"
  }
}
