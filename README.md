# Udacity Devops-Capstone-Project

## Hello- World CI/CD deployment  


## Project Overview  
 In this project, I applied the skills and knowledge which was developed throughout the Cloud DevOps Nanodegree program. These include:

1)	Working in AWS
2)	Using Jenkins to implement Continuous Integration and Continuous Deployment 
3)	Building pipelines 
4)	Working with CloudFormation to deployclusters 
5)	Building Kubernetes clusters 
6)	Building Docker containers in pipelines


## Steps of Project 
- Developing a CI/CD pipeline for microservices applications with rolling deployment.
- Developing Continuous Integration steps such as linting.
- Developing Contiguous Deployment like pushing the built Docker containers to the Docker repository.
- Deploying these Docker containers to a  Kubernetes cluster. 
- Used eksctl to create the Kubernetes cluster.
- Used the Jenkins pipline to deploy my Kubernetes cluster using Cloudformation.

## create Kubernetes cluster using AWS 

```shell
$ eksctl create cluster --name Mostafa_Devops --node-type t2.micro --region us-east-2

$ aws eks update-kubeconfig --name Mostafa_Devops

$ kubectl config use-context arn:aws:eks:us-east-2:653404899093:cluster/Mostafa_Devops

$ kubectl apply -f deploy.yml
```

## Creating Docker and Kubernetes locally 

#### **1-Docker Configuration**
-  Run the project using docker use this command `run_docker.sh` 
-  Upload Docker image is to docker via `upload_docker.sh`
-  Delete Docker image is via  `delete_docker.sh`


#### **2-Kubernetes Configuration**

-  Run the project using kubernetes use this command`run_kubernetes.sh`


## Steps for running Jenkins Pipeline
## A. AWS steps
1. Log in to the AWS management console, as a Root user. Find and select the IAM (Identify and Access Management) service.

2. click on "Group" menu item from the left sidebar. Create a new group and name it "jenkins", and attach the following policies:
  AmazonEC2FullAccess
  AmazonVPCFullAccess
  AmazonS3FullAccess.

3. Create an IAM user

4. Create a new key pair for access to your instance(s). Choose EC2 as the service after logging in. Select "Key Pairs" from the sidebar on the left, from the "Network and Security" section. Enter the "pipeline" name when prompted. Save the ".pem" file. If you will use an SSH client on a Mac or Linux computer to connect to your Linux instance, use the following command to set the permissions of your private key file so that only you can read it:

      chmod 400 your_user_name-key-pair-region_name.pem
      
5. Launch the EC2 t2.micro for the free tier, pick "Ubuntu 18.04 LTS amd64," review, and when hitting "launch" ensure that an existing pair ("pipeline") from before is selected. If you're not using the right key pair, you cannot log in. Now, an Ubuntu 18.04 t2.micro instance is launched in the AWS EC2, that can be accessed via SSH using the PEM file.

6. Once launched, create a security group for the vm. In the left sidebar, under Network and Security, select "Security Groups." Under name, use: 'jenkins', description: "basic Jenkins security group," VPC should have the default one used. Click Add Rule: Custom TCP Rule, Protocol: TCP, Port Range 8080, Source 0.0.0.0/0 Then add the SSH rule: Protocol: SSH, Port range: 22, From source, use the dropdown and select "My IP."

### B. Setup Jenkins
1.	Visit Jenkins on its default port, 8080, with your server IP address or domain name included like this: http://your_server_ip_or_domain:8080.
2.	Next you will see the "Unlock Jenkins" screen, displaying the location of the initial password. In the terminal, use cat to show the password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
3.	Copy and paste the 32-character alphanumeric password from the terminal into the Admin password field, then Continue.
4.	When installation is complete, you are prompted to set up the first admin user. Create the admin user and make note of both the user and password to use in the future.


### C. Install BlueOcean on Jenkins
1. "Blue Ocean" and other required plugins need to be installed. Logged in as an admin, go to the top left, click 'Jenkins', then 'manage Jenkins', and select 'Manage Plugins'.

2. Use the "Available" tab, filter by "Blue Ocean," select the first option ("BlueOcean aggregator") and install without a restart.

3. Filter once again for "pipeline-aws" and install, this time selecting "Download now and install after restart."

4. Once all plugins are installed, Jenkins will restart. If it hasn't restarted, run the following in the VM:
```
sudo systemctl restart jenkins
```
5. Verify everything is working for Blue Ocean by logging in. An "Open Blue Ocean" link should show up in the sidebar. Click it, and it will take you to the "Blue Ocean" screen, where we will have to add a project.


