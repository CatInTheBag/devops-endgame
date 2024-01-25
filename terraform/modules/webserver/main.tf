resource "aws_security_group" "myapp-security-group" {
  name = "myapp security group"
  vpc_id = var.vpc_id

  #incomming traffic rules
  ingress {
    #to configure range, from 22 to 22, only means one port 22
    #TODO: fix cidr_blocks
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #outgoing traffic rules
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
    prefix_list_ids = []
  }

  tags = {
    Name = "${var.env_prefix}-security-group"
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name = "ssh-key-public"
  public_key = var.public_key
}

resource "aws_instance" "myapp-ec2" {
  #TODO: fix to get last with script
  ami = "ami-0faab6bdbac9486fb"
  instance_type = var.instance_type

  subnet_id = var.webserver_subnet_id
  vpc_security_group_ids = [aws_security_group.myapp-security-group.id]
  availability_zone = "${var.availability_zone}a"

  associate_public_ip_address = true
  key_name = aws_key_pair.ssh-key.key_name

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = var.private_key
  }

  provisioner "file" {
    source      = "/terraform/ansible/initial-configuration.yaml"
    destination = "/tmp/initial-configuration.yaml"
  }

  provisioner "remote-exec" {

    inline = [
      "sudo apt update && apt upgrade -y",
      "sudo apt install -y docker.io",
      "sudo systemctl start docker",
      "sudo usermod -aG docker ubuntu",
      "echo 'export RUNNER_TOKEN=${var.runner_token}' | sudo tee -a /etc/profile > /dev/null",
      "source /etc/profile",
      "echo 'RUNNER_TOKEN is set to: ${var.runner_token}' > ~/runner_token.log",
      "sudo apt install -y software-properties-common ",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install -y ansible",
      "cd ~",
      "mkdir actions-runner && cd actions-runner",
      "curl -o actions-runner-linux-x64-2.311.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-linux-x64-2.311.0.tar.gz",
      "echo '29fc8cf2dab4c195bb147384e7e2c94cfd4d4022c793b346a6175435265aa278  actions-runner-linux-x64-2.311.0.tar.gz' | shasum -a 256 -c",
      "tar xzf ./actions-runner-linux-x64-2.311.0.tar.gz",
      "./config.sh --url https://github.com/CatInTheBag/terraform-aws-final-project --token ${var.runner_token} --labels self-hosted,ubuntu,ec2 --name aws-ec2 --unattended --replace",

      "sudo ./svc.sh install",
      "sudo ./svc.sh start",
    ]
    on_failure = continue
  }

  tags = {
    Name = "${var.env_prefix}-myapp-ec2-instance-ssh"
  }
}