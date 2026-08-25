resource "cloudflare_dns_record" "smartcar" {
  zone_id = var.cloudflare_zone_id

  name    = "smartcar"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "mqtt_smartcar" {
  zone_id = var.cloudflare_zone_id

  name    = "mqtt.smartcar"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "stream_smartcar" {
  zone_id = var.cloudflare_zone_id

  name    = "stream.smartcar"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}
