terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  # API token is read from $CLOUDFLARE_API_TOKEN env
}

variable "zone_id" {
  sensitive = true
  type = string
}

variable "account_id" {
  sensitive = true
  type = string
}

resource "cloudflare_dns_record" "bendit_dev" {
  type = "A"
  zone_id = var.zone_id
  name = "@"
  content = "34.0.240.173"
  ttl = 1
  proxied = true
}

resource "cloudflare_dns_record" "all_subdomains" {
  type = "A"
  zone_id = var.zone_id
  name = "*"
  content = "34.0.240.173"
  ttl = 1
  proxied = true
}
