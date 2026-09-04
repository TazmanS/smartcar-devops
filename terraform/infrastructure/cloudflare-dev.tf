resource "cloudflare_dns_record" "smartcar_dev" {
  zone_id = var.cloudflare_zone_id

  name    = "smartcar-dev"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "mqtt_smartcar_dev" {
  zone_id = var.cloudflare_zone_id

  name    = "mqtt.smartcar-dev"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "stream_smartcar_dev" {
  zone_id = var.cloudflare_zone_id

  name    = "stream.smartcar-dev"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "grafana_smartcar_dev" {
  zone_id = var.cloudflare_zone_id

  name    = "grafana.smartcar-dev"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}
