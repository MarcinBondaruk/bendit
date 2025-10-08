resource "cloudflare_zone_setting" "tls_1_3" {
  zone_id = var.zone_id
  setting_id = "tls_1_3"
  value = "on"
}

resource "cloudflare_zone_setting" "automatic_https_rewrites" {
  zone_id = var.zone_id
  setting_id = "automatic_https_rewrites"
  value = "on"
}

resource "cloudflare_zone_setting" "ssl" {
  zone_id = var.zone_id
  setting_id = "ssl"
  value = "strict"
}
