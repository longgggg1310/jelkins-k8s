# Ref: https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/blob/master/examples/simple_autopilot_public
# To define that we will use GCP
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.80.0" // Provider version
    }
  }
  required_version = "1.11.1" // Terraform version
}

// The library with methods for creating and
// managing the infrastructure in GCP, this will
// apply to all the resources in the project
provider "google" {
  project     = var.project_id
  region      = var.region
}

// Google Cloud Storage
// https://cloud.google.com/storage/docs/terraform-create-bucket-upload-object
// or refer to https://registry.terraform.io/providers/hashicorp/google/latest/docs
# resource "google_storage_bucket" "static" {
#   name          = var.bucket
#   location      = var.region

#   # Enable bucket level access
#   uniform_bucket_level_access = true
# }

# // Google Compute Engine
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-standard-2"
  zone         = "asia-southeast1-a"

#   // This instances use ubuntu image
  boot_disk {
    initialize_params {
      image = var.image
      size = var.disk_size
    }
  }

#   // Default network for the instance
  network_interface {
    network = "default"
    access_config {}
  }
  metadata ={
    ssh-keys = var.ssh_keys
  }
}

// Google Kubernetes Engine
resource "google_container_cluster" "my-gke" {
  name     = "${var.project_id}-new-gke"
  location = var.region

  // Enabling Autopilot for this cluster
  enable_autopilot = true
}

resource "google_storage_bucket" "my-bucket" {
  name          = var.bucket
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_compute_firewall" "firewall_mlops1" {
  name          = var.firewall_name
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["8081", "50000", "22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
