provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "exam_vm" {
  name         = "bcdv-4033-final-exam-vm"
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file("~/.ssh/id_rsa.pub")}"
  }

  tags = ["bcdv-exam"]
}
