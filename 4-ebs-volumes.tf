/*
  POC Playground Provider Management
  22.03.2019
*/

// EBS
resource "aws_volume_attachment" "playground-poc-1" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.playground-poc-1.id}"
  instance_id = "${aws_instance.playground-poc-1.id}"
}

resource "aws_ebs_volume" "playground-poc-1" {
    availability_zone = "${var.availability_zone}"
    size = 5
    type = "gp2"
    tags {
        Name = "playground-poc",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}
