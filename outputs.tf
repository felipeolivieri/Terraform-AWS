output "ips_dev0-1-2" {
    value = ["${aws_instance.dev.*.public_ip}"]
}

output "ip_dev4" {
    value = aws_instance.dev4.public_ip
}

output "ip_dev5" {
    value = aws_instance.dev5.public_ip
}

output "ip_dev6" {
    value = aws_instance.dev6.public_ip
}

output "ip_dev7" {
    value = aws_instance.dev7.public_ip
}
