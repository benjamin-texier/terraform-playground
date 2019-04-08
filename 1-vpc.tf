/*
  POC Playground Provider Management
  22.03.2019
*/

resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true

    tags {
        Name = "playground",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
    tags {
        Name = "playground",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}

resource "aws_subnet" "eu-west-3a" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.subnet_cidr}"
    availability_zone = "${var.availability_zone}"

    tags {
        Name = "playground",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}

resource "aws_route_table" "eu-west-3a" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags {
        Name = "playground",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}

resource "aws_route_table_association" "eu-west-3a" {
    subnet_id = "${aws_subnet.eu-west-3a.id}"
    route_table_id = "${aws_route_table.eu-west-3a.id}"
}