provider "google" {
  version = "~> 3.4"
  credentials = file("service-account-key.json")

  project = "mythic-guild-264223"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_engine" "name" {
  
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}