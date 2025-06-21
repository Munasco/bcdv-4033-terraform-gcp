resource "google_compute_firewall" "ssh_allow" {
  name    = "bcdv-exam-allow-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # NEW — tell GCP where SSH traffic may originate
  source_ranges = ["0.0.0.0/0"]   # open to any IP; tighten to your CIDR if desired

  target_tags = ["bcdv-exam"]
}