provider "google" {
  version = "~> 3.4"
  credentials = vars.google_service_account

  project = "mythic-guild-264223"
  region  = "us-central1"
  zone    = "us-central1-c"
}

variable "google_service_account" {
  type = string
  description = "JSON string of google service account key file used to access GCP"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
