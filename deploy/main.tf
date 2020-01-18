provider "google" {
  version = "~> 3.4"
  credentials = var.google_service_account

  project = "mythic-guild-264223"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/runner/api-tms/"
    ]
  }
}
