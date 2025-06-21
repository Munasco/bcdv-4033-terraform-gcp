output "public_ip" {
  value       = google_compute_instance.exam_vm.network_interface[0].access_config[0].nat_ip
  description = "VM public IP address"
}

