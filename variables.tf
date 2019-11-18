variable "project_id" {
  description = "The project ID to host the cluster in"
  default = "smartworkx-test"
}

variable "cluster_name_suffix" {
  description = "A suffix to append to the default cluster name"
  default     = "test"
}

variable "region" {
  description = "The region to host the cluster in"
  default = "europe-west4"
}

variable "network" {
  description = "The VPC network to host the cluster in"
  default = "default"

}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  default = "default"
}

variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
  default = "default-01-gke-01-pods"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for pods"
  default = "default-01-gke-01-services"
}

variable "create_service_account" {
  default = false
}

variable "skip_provisioners" {
  type        = bool
  description = "Flag to skip local-exec provisioners"
  default     = false
}