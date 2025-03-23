# Self link of the backend bucket
variable "backend_self_link" {
  description = "Self link of the backend bucket"
  type        = string
}

# Domain name for the SSL certificate
variable "domain_name" {
  description = "Domain name for the SSL certificate"
  type        = string
}

# Static IP address for the load balancer (optional)
variable "ip_address" {
  description = "Static IP address for the load balancer"
  type        = string
  default     = null
}

# Name of the URL map
variable "url_map_name" {
  description = "Name of the URL map"
  type        = string
  default     = "ohc-url-map"
}

# Name of the HTTP proxy
variable "http_proxy_name" {
  description = "Name of the HTTP proxy"
  type        = string
  default     = "ohc-http-proxy"
}

# Name of the HTTPS proxy
variable "https_proxy_name" {
  description = "Name of the HTTPS proxy"
  type        = string
  default     = "ohc-https-proxy"
}

# Name of the SSL certificate
variable "ssl_cert_name" {
  description = "Name of the SSL certificate"
  type        = string
  default     = "ohc-cert"
}

# Name of the global IP address
variable "ip_address_name" {
  description = "Name of the global IP address"
  type        = string
  default     = "ohc-ip-address"
}

# Name of the HTTP forwarding rule
variable "http_forwarding_rule_name" {
  description = "Name of the HTTP forwarding rule"
  type        = string
  default     = "ohc-http-forwarding-rule"
}

# Name of the HTTPS forwarding rule
variable "https_forwarding_rule_name" {
  description = "Name of the HTTPS forwarding rule"
  type        = string
  default     = "ohc-https-forwarding-rule"
}
