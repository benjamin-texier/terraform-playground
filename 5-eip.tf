/*
  POC Playground Provider Management
  22.03.2019
*/

// EIP
resource "aws_eip" "playground-poc-1" {
    instance = "${aws_instance.playground-poc-1.id}"
    vpc = true
    tags {
        Name = "eip-playground-1",
        Department = "SANDBOX",
        ProjectName = "PLAYGROUND-POC"
    }
}