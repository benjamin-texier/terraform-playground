/*
  POC Playground Provider Management
  22.03.2019
*/

resource "aws_instance" "playground-poc-1" {
    ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = "t2.nano"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.playground-poc.id}"]
    subnet_id = "${aws_subnet.eu-west-3a.id}"
    associate_public_ip_address = true
    source_dest_check = false
    root_block_device {volume_size = "8"}
    tags {
        Name = "playground-poc-1",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
        StartPolicy = "Always"
    }
    provisioner "local-exec" {
        command = "sleep 100 && ansible-playbook -i '${self.public_ip},' -u ${var.remote_user}--private-key ${var.aws_key_path} ./post-install/manage.yml"
    }
}