output "instance_dso_ip_addr" {
  value       = "${aws_eip.playground-poc-1.public_ip}"
  description = "The public IP address of the Playground-poc instance."
}