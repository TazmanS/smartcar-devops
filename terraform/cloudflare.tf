resource "cloudflare_dns_record" "smartcar" {
  zone_id = var.cloudflare_zone_id

  name    = "smartcar"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "mqtt" {
  zone_id = var.cloudflare_zone_id

  name    = "mqtt"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}

resource "cloudflare_dns_record" "stream" {
  zone_id = var.cloudflare_zone_id

  name    = "stream"
  type    = "A"
  content = aws_eip.control_plane.public_ip
  ttl     = 1
  proxied = false
}
