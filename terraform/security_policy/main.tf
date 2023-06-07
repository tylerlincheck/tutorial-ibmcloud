provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "new-sg" {
  name = "my-sec-grp-4"
  vpc_id      = "vpc-0980463a25ba24a2b"
  description = "Allow HTTP and SSH traffic via Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-0521a1ab6cb98215d"
    count = 1
    subnet_id = "subnet-08f72eee863a99fe7"
    instance_type = "t2.micro"
    key_name = "MyKeyPair"
    vpc_security_group_ids = ["${aws_security_group.new-sg.id}"]
} 

resource "aws_ebs_volume" "data-vol" {
 availability_zone = "us-east-2c"
 size = 40
 tags = {
        Name = "data-volume"
 }

}
#
resource "aws_volume_attachment" "attach-vol" {
 device_name = "/dev/sdc"
 volume_id = "${aws_ebs_volume.data-vol.id}"
 instance_id = "${aws_instance.ec2_instance[0].id}"
}
