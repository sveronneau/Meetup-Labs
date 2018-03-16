data "template_file" "student-cloudinit" {
  template = "${file("./cloudinit.tpl")}"
}

resource "cloudca_instance" toronto-osug-node {
   environment_id="${var.environment_id}"
   count="${var.student_count}"
   name="toronto-osug-lab-${count.index}"
   network_id="${var.network_id}"
   template="Ubuntu 16.04.03 HVM"
   compute_offering="4vCPU.16GB"
   ssh_key_name="${var.key_name}"
   user_data="${data.template_file.student-cloudinit.rendered}"
   root_volume_size_in_gb=150
}

resource "cloudca_public_ip" "my_publicip" {
   environment_id = "${var.environment_id}"
   vpc_id = "${var.vpc_id}"
   count="${var.student_count}"
}
