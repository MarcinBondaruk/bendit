variable "state_bucket" {}

data "terraform_remote_state" "vpc" {
  backend = "gcs"

  config = {
    bucket = var.state_bucket
    prefix = "vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnet" {
   backend = "gcs"

  config = {
    bucket = var.state_bucket
    prefix = "subnet/terraform.tfstate"
  }
}
