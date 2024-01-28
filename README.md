 <img width="520" alt="pngwing com" src="https://github.com/CatInTheBag/myapp-devops-final-project/assets/4971877/0ef78f7d-f917-481c-84fc-bda6916f4984">

 # Telerik DevOps Final Project ENDGAME 
 ### Project Overview

This repository contains the source code and documentation for the DevOps project.
The DevOps project is a Spring Boot application that automates the CI/CD pipeline using GitHub Actions, Docker, Ansible, Terraform, and AWS EC2, S3. The pipeline consists of the following stages:

  1. Continuous Integration (CI): The CI stage is triggered when a PR is made to the master branch. GitHub Actions runs the Java tests with Maven, performs linting, security checks, and credentials check. If all tests pass, the PR can be merged.


  1. Infrastructure Provisioning: After the PR is merged, the infrastructure provisioning stage is triggered. Terraform is used to provision the EC2 instance on AWS. The process involves fetching the GitHub token for custom runner creation on AWS, setting up Terraform, configuring AWS credentials, initializing Terraform, applying Terraform configuration for the creation of EC2, and providing a remote exec provisioner that updates the EC2 instance, installs Ansible, Docker, and starts the custom runner on the EC2.

  1. Continuous Deployment (CD): After the successful EC2 part, the CD stage is triggered. The Docker image is published on Docker Hub, and then it is pulled and run on the already created EC2 instance using the custom created runner on this instance. The Ansible playbook is executed to configure the EC2 instance and deploy the application.


### Prerequisites

  1.	Java 17, Maven, Git
  2.	GitHub account
   -	Repository secrets: PERSONAL_ACCESS_TOKEN
  3.	AWS account
   -	Repository secrets: AWS_ACCESS_KEY_ID
   -	Repository secrets: AWS_SECRET_ACCESS_KEY
  4.	Docker account
   -	Repository secrets: DOCKERHUB_USERNAME
   -	Repository secrets: DOCKERHUB_TOKEN
  5.	Snyk account
   -	Repository secrets: SNYK_TOKEN
  6.	Public and private key generated for SSH connection from Terraform to AWS
   -	Repository secrets: PUBLIC_KEY
   -	Repository secrets: SSH_PRIVATE_KEY
  7.	PRIVATE_IP set for SSH access to EC2
   - Repository secrets: PRIVATE_IP
  8.	Account in https://api-ninjas.com/
   -	Repository secrets: API_KEY

### Getting Started

 To get started with the DevOps project, follow these steps:
  1.	Clone the repository to your local machine.
  2.	Install the required dependencies.
  3.	Create a feature branch and make your changes.
  4.	Commit your changes and push them to the feature branch.
  5.	Create a pull request.
  6.	After the PR is merged, the infrastructure provisioning stage will be triggered automatically.
  7.	After the successful EC2 part, the CD stage will be triggered automatically.

![thanos__final_rest_by_danielabdu_dcgt4y5-pre](https://github.com/CatInTheBag/devops-endgame/assets/4971877/766853db-a22b-4594-a564-07ba37291697)
