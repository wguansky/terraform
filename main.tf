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
    ssh-keys =<<EOF
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
EOF
  }

connection  {
  type        = "ssh"
  user        = var.user
  host        = google_compute_instance.shadowsocks.network_interface[0].access_config[0].nat_ip
  timeout     = "30s"
  private_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9v27NssaH777izO3SL+rCHMMHCtBKPPvF/Hux8xa7j0fbPvl9ypLZWPqQdUgOnLRAT/JKM5EmhSODmIP6Um7lV/HV8z30JWcYvSlmePBVu1CtBtuclGbiDuqQIS4vH/fwOtHm/lTUi0jlThCA/g3OhwsYnuZ6FJWlDMQejDpYLCxAYL+pGJbxBxN73tgukK+bcUyvobIlSbMBSOerny3lhEiy6qoXfPQi/nTn6Odi3fPmoGv01w3jQ0ObaQY9OYVt6F6kL20GMAFTBAYNqJpipMHyTPzkEw7PeFX3ZrJDDu0P0+3eeBXlEyInExZceJLmkt6YZWM/tnUAt9eo+Kvfjfr+G7nnq+NGj3/g22fwxljl2Bp+TZTKggCPASXKBt1mISzZBPCjLHL2W78K6xGgXj1bP7N/xVOnAeCtVXDsC2TIU7yIptpkhly8GBUJaGv0zKS2qDBZWU0eQ0DW7R7Vx9sJbmzExAVoK/HjSJGU1wgtUM2qCfGFfr2Dterb6Cs= wguan@HANM13615-A.local"
}

  provisioner "file" {
    content=<<EOF
{
    "server":"0.0.0.0",
    "server_port":8888,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"mstr123",
    "timeout":300,
    "method":"aes-256-gcm",
    "fast_open":false
}
EOF
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
