resource "cloudflare_dns_record" "smartcar" {
  zone_id = var.cloudflare_zone_id

  name    = "smartcar"
  type    = "A"
  content = aws_instance.control_plane.public_ip
  ttl     = 1
  proxied = true
}
