/*
  POC Playground Provider Management
  22.03.2019
*/


// Virtual DSO
resource "aws_security_group" "playground-poc" {
    name = "playground-poc"
    description = "IN 22 -- OUT 53 80 443"

    // ENTREES

    // ssh
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // SORTIES

    // mise à jour apt-get et téléchargement
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    // mise à jour apt-get et téléchargement
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    // DNS
    egress {
        from_port = 53
        to_port = 53
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "playground-poc",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}