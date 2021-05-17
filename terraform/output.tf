output "key_pair_name" {
  value = "${aws_key_pair.auth.key_name}"
}

output "public_key_path" {
  value = "${var.public_key_path}"
}

output "private_key_path" {
  value = "${var.private_key_path}"
}