# Terraform project for an EC2 Docker ready VM

Use your favourite method to have credential on your machine.

Copy the file `terraform.tfvars.template` to `terraform.tfvars` and set your configuration, then just run:

    terraform init
    terraform plan
    terraform apply

At the end you should have an output similar to this:

```
build = <<EOT
Connect with:

ssh -i dockerhost.pem ubuntu@ec2-<ip>.<region>.compute.amazonaws.com

Enjoy!

EOT
dockerhost-ip = "<ip>"
private-key-name = "dockerhost.pem"
```

the terraform creates for you the pem certificate file, login with ssh string from output.

*note*: if you can't reach the machine check for the external security group on AWS console and check if the ip allowed matches your public ip.

once logged in the VM you may wait a couple of minutes for docker to be fully installed by cloud init script.

The you could test docker with:

    docker run -p 8080:80  httpd:2.4

Check on yout broweser (the sampe public dns you used to connect to the machine):

    ec2-<ip>.<region>.compute.amazonaws.com:80

And you should recive the "It works" page from the Apache

# check errors

You can check setup error on server on the file:

    /var/log/cloud-init-output.log
