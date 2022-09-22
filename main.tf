resource "google_compute_instance" "shadowsocks" {
  name         = "shadowsocks"
  machine_type = var.instance_type

  tags = ["foo", "bar"]

  zone = var.zone
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-v20220822"
    }
  }


  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
    ssh-keys = "${var.user}:${file(var.public_key)}"
  }

connection  {
  type        = "ssh"
  user        = var.user
  host        = google_compute_instance.shadowsocks.network_interface[0].access_config[0].nat_ip
  timeout     = "30s"
  private_key = file("~/.ssh/id_rsa")
}

  provisioner "file" {
    source       = "/Users/wguan/Work/Code/study/terrform/google_terraform/config.json"
    destination = "/home/wguan/config.json"
}

  metadata_startup_script = <<EOF
sudo - su
cd ~
apt install wget
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
./bbr.sh
cp /home/wguan/config.json /etc/shadowsocks-python/config.json
/bin/python /usr/local/bin/ssserver -c /etc/shadowsocks-python/config.json -d restart
EOF
}


output "public_ip" {
  value = google_compute_instance.shadowsocks.network_interface[0].access_config[0].nat_ip
}
