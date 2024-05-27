output "private-key-name" {
  description = "The private key name needed to log into the dockerhost"
  value = local_file.private_key.filename
}

output "dockerhost-ip" {
  description = "The dockerhost IP. Remember that the username is 'ubuntu'"
  value = aws_instance.dockerhost.public_ip
}

output "build" {
  value = <<-EOT
    Connect with: 

    ssh -i dockerhost.pem ubuntu@${aws_instance.dockerhost.public_dns}

    Enjoy! 
    EOT
}