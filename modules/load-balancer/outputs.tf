# Output the IP address for the load balancer (either from variable or computed)
output "ip_address" {
  description = "IP address for the load balancer"
  value       = var.ip_address != null ? var.ip_address : google_compute_global_address.ip_address[0].address
}

# Output the self link of the HTTP proxy
output "http_proxy_self_link" {
  description = "Self link of the HTTP proxy"
  value       = google_compute_target_http_proxy.http_proxy.self_link
}

# Output the self link of the HTTPS proxy
output "https_proxy_self_link" {
  description = "Self link of the HTTPS proxy"
  value       = google_compute_target_https_proxy.https_proxy.self_link
}

# Output the self link of the SSL certificate
output "ssl_cert_self_link" {
  description = "Self link of the SSL certificate"
  value       = google_compute_managed_ssl_certificate.ssl_cert.self_link
}
