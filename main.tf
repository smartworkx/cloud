provider "google" {
  credentials=file("key.json")

  project = "smartworkx-test"
  region  = "europe-west4"
  zone    = "europe-west4-c"
}

module "gke" {
  source                   = "terraform-google-modules/kubernetes-engine/google"
  project_id               = var.project_id
  name                     = "smartworkx-cluster-${var.cluster_name_suffix}"
  regional                 = true
  region                   = var.region
  network                  = var.network
  subnetwork               = var.subnetwork
  ip_range_pods            = var.ip_range_pods
  ip_range_services        = var.ip_range_services
  create_service_account   = false
}

data "google_client_config" "default" {
}