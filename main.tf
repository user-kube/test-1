provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Jenkins-server" {
    ami = "ami-0f409bae3775dc8e5"
    instance_type = "t2.micro"
    key_name = "Microdegree"
    security_groups = ["myallinonesecuritygroup"]
    user_data = file("jenkins-script.sh")
    tags = {
        Name = "Jenkins-Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-0f409bae3775dc8e5"
    instance_type = "t2.micro"
    key_name = "Microdegree"
    security_groups = ["myallinonesecuritygroup"]
    user_data = file("Docker-script.sh")
    tags = {
        Name = "Docker-Server"
    }
}

