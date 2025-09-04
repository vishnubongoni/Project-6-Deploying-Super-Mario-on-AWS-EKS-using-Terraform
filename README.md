# **🚀 Deploying Super Mario on AWS EKS using Terraform**  

Super Mario is a game we all cherish, and in this project, we bring it to life on AWS EKS (Elastic Kubernetes Service) using Terraform for infrastructure automation. This deployment leverages Kubernetes, AWS EC2, and Terraform to ensure a seamless, scalable, and cloud-native gaming experience.

✅ Key Features
Automated Infrastructure Provisioning – Using Terraform to deploy AWS resources
Kubernetes Orchestration – Running Super Mario on EKS for scalability
Containerization – Dockerized game deployment
AWS EC2 & Load Balancing – Ensuring high availability and performance
GitOps Workflow – Infrastructure as Code (IaC) with version control  

![Super Mario](https://imgur.com/Njqsei9.gif)  

---

## 📌 **Project Overview**

This project provisions an **EKS cluster** on AWS and deploys the **Super Mario game** using **Terraform** and **Kubernetes manifests**. The deployment includes:

- ✅ Amazon EKS Cluster provisioning
- ✅ Terraform Infrastructure as Code (IaC)
- ✅ Kubernetes Deployment & Service for Super Mario
- ✅ AWS S3 Backend for Terraform state management
- ✅ IAM roles & policies for EKS & worker nodes

---

## **📁 Project Structure**  

```bash
📂 DEPLOYMENT-OF-SUPER-MARIO
│── 📂 EKS-TF               # Terraform configuration files for AWS EKS
│   ├── backend.tf          # S3 backend for Terraform state management
│   ├── main.tf             # AWS EKS Cluster and Node Group definition
│   ├── provider.tf         # AWS provider configuration
│   ├── deployment.yaml     # Kubernetes Deployment for Super Mario
│   ├── service.yaml        # Kubernetes Service for exposing Super Mario app
│── 📄 README.md            # Project documentation
```

---

## **📌 Prerequisites**  

Before proceeding, ensure you have the following installed:

- ✅ **Terraform** (>=1.3.0)  
- ✅ **AWS CLI** (Configured with proper credentials)  
- ✅ **kubectl** (For managing Kubernetes resources)  
- ✅ **Docker** (For containerization)  

---
Completion steps →
Step 1 → Login and basics setup

Step 2 → Setup Docker ,Terraform ,aws cli , and Kubectl

Step 3 → IAM Role for EC2

**Step 4 →**Attach IAM role with your EC2

Step 5 → Building Infrastructure Using terraform

Step 6 → Creation of deployment and service for EKS

Step 7 → Destroy all the Infrastructure

Let’s do it

----------------------------------------------------------------------------------------------------
**Step 1 → Login and basics setup**

1.login into your aws account as a root user

2. Launch an EC2 instance with Regular Settings and allow https,http and set a key pair
 
3. Click on launch Instance
  
4. click on connect and you are connected with your machine
 
5. run the following commands

a. sudo su

b. apt update -y

------------------------------------------------------------------------------------------------------

**Step 2 → Setup Docker ,Terraform ,AWS cli , and Kubectl**

1.Setup Docker---> apt install docker.io

2. usermod -aG docker $USER
   
3. newgrp docker


**Setup Terraform -->**

1.sudo apt install wget -y

2.wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg — dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo “deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main” | sudo tee /etc/apt/sources.list.d/hashicorp.list

3.sudo apt update && sudo apt install terraform -y

**Setup AWS cli -->**

Aws using your computer’s command lines instead of clicking around on a website. It helps you do things like telling AWS to create or manage stuff, all by typing commands in a special language your computer understands. It’s like giving orders to AWS with your keyboard instead of a mouse.

1.curl “https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o “awscliv2.zip”

2.sudo apt-get install unzip -y

3.unzip awscliv2.zip

4.sudo ./aws/install


**Setup kubectl -→**

1.sudo apt install curl -y

2.curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl

3.sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Step 3 → IAM Role for EC2**

Why we need IAM role for EC2 → It is used by your ec2 instance to create EKS cluster and manage s3 bucket by applying this IAM role it gives the authenticity to your ec2 to do changes in aws account

1.on the search bar type IAM

2. click on Roles on the left side
  
3. click on create role and choose EC2 from the dropdown
 
4. click on next
  
5. choose administrator access on permission sections
  
6. click on next and give a name to your role
  
7. click on create role option and your IAM role is created

---------------------------------------------------------------------------------------------------------------------------------------------

**Step 4 →Attach IAM role with your EC2**

1.go to EC2 section

2.click on actions → security → modify IAM role option

3. choose the role from dropdown and click on update IAM role

Now everything is done what we have to do is just throw and some commands and build our infrastructure using terraform to run super mario

--------------------------------------------------------------------------------------------------------------------------------------------------

**Step 5 → Building Infrastructure Using terraform**

1.Clone the GitHub repo by →

a. mkdir super_mario

b. cd super_mario

c. git clone https://github.com/vishnubongoni/Project-6-Deploying-Super-Mario-on-AWS-EKS-using-Terraform.git

d. cd Deployment-of-super-Mario-on-Kubernetes-using-terraform/

e. cd EKS-TF

f. edit the backend.tf file by → vim backend.tf (change your bucket name)

Note →make sure to provide your bucket and region name in this file otherwise it doesn’t work and IAM role is also associated with your ec2 which helps ec2 to use other services such S3 bucket

NOW RUN →

1.terraform init

2. terraform validate
 
3. terraform plan
  
4. terraform apply

It takes your 5 to 10 min for completion

6. Below command is used to update the configuration of EKS

``` aws eks update-kubeconfig --name EKS_CLOUD --region us-east-1 ```

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

**Step 6 → Creation of deployment and service for EKS**

1.change the directory where deployment and service files are stored use the command → cd ..

2.create the deployment

``` kubectl apply -f deployment.yaml ```
3. Now create the service

``` kubectl apply -f service.yaml ```

4. run → kubectl get all

5. now Run the following command to get the load balancer ingress

This command tells all the details of your application


``` kubectl describe service mario-service ```

copy the load balancer ingress and paste it on browser and your game is running

Play and Enjoy but don’t forget to destroy everything that’s saves of aws bill and you aws account too


 **Load Balancer Ingress →**
It is a mechanism that helps distribute incoming internet traffic among multiple servers or services, ensuring efficient and reliable delivery of requests.

It’s like having a receptionist at a busy office building entrance who guides visitors to different floors or departments, preventing overcrowding at any one location. In the digital world, a Load Balancer Ingress helps maintain a smooth user experience, improves application performance, and ensures that no single server becomes overwhelmed with too much traffic.

-----------------------------------------------------------------------------------------------------------------------------------------------------------

**Step 7 → Destroy all the Infrastructure**

1 . Below commands delete your deployment and service

``` kubectl delete service mario-service ```

``` kubectl delete deployment mario-deployment ```

2. After service and deployment destruction let’s destroy the infrastructure by the following command it will delete your EKS cluster

cd EKS-TF
terraform destroy --auto-approve

after 3 -5 mins all things are destroyed

3. Now go to your EC2 and terminate your Instance

Done... **CONGRATULATIONS....**
