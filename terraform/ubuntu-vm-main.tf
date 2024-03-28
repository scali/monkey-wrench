resource "google_compute_firewall" "firewall" {
  name    = "monkey-wrench-firewall-externalssh"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"] # FIXME: Not Secure. Limit the Source Range
  target_tags   = ["externalssh"]
}

resource "google_compute_firewall" "webserverrule" {
  name    = "monkey-wrench-webserver"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
  source_ranges = ["0.0.0.0/0"] # FIXME: Not Secure. Limit the Source Range
  target_tags   = ["webserver"]
}

# We create a public IP address for our google compute instance to utilize
resource "google_compute_address" "static" {
  name       = "vm-public-address"
  project    = var.project
  region     = var.region
  depends_on = [google_compute_firewall.firewall]
}

resource "google_compute_instance" "dev" {
  name         = "monkey-wrench-vm"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"
  tags         = ["externalssh", "webserver"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
  # Ensure firewall rule is provisioned before server, so SSH doesn't fail.
  depends_on              = [google_compute_firewall.firewall, google_compute_firewall.webserverrule]
  metadata_startup_script = "echo 'root:${var.vm_root_password}' | chpasswd;echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config;echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config"
}

output "ad_ip_address" {
  value = google_compute_address.static.address
}