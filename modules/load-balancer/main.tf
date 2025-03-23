# Create a URL map for routing HTTP requests
resource "google_compute_url_map" "url_map" {
  name            = var.url_map_name
  default_service = var.backend_self_link
}

# Create an HTTP proxy to handle HTTP requests
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.http_proxy_name
  url_map = google_compute_url_map.url_map.self_link
}

# Create a global IP address if not provided by the user
resource "google_compute_global_address" "ip_address" {
  count = var.ip_address == null ? 1 : 0
  name  = var.ip_address_name
}

# Create an HTTP forwarding rule to route traffic on port 80
resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name                  = var.http_forwarding_rule_name
  target                = google_compute_target_http_proxy.http_proxy.self_link
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL"
  ip_address            = var.ip_address != null ? var.ip_address : google_compute_global_address.ip_address[0].address
}

# Create a managed SSL certificate for the specified domain
resource "google_compute_managed_ssl_certificate" "ssl_cert" {
  name = var.ssl_cert_name
  
  managed {
    domains = [var.domain_name]
  }
}

# Create an HTTPS proxy to handle HTTPS requests
resource "google_compute_target_https_proxy" "https_proxy" {
  name             = var.https_proxy_name
  url_map          = google_compute_url_map.url_map.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.ssl_cert.self_link]
}

# Create an HTTPS forwarding rule to route traffic on port 443
resource "google_compute_global_forwarding_rule" "https_forwarding_rule" {
  name                  = var.https_forwarding_rule_name
  target                = google_compute_target_https_proxy.https_proxy.self_link
  port_range            = "443"
  load_balancing_scheme = "EXTERNAL"
  ip_address            = var.ip_address != null ? var.ip_address : google_compute_global_address.ip_address[0].address
}
