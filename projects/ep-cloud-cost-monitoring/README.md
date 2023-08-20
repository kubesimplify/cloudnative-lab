# Episode - Cloud Cost Monitoring using Komiser

## Aim
Provisioning an AWS Cloud infrastructure using Terraform to manage a simple Django application. Additionally, set up cloud costs monitoring using [Komiser](https://docs.komiser.io/)

## Cloud Cost Monitoring
### What is it?
Refers to the practice of tracking and analyzing the expenses incurred in using cloud resources and services. It involves monitoring, analyzing, and optimizing cloud usage to ensure efficient cost management and budget control.

### Why is it important?
- Cost optimization: helps identify areas of excessive spending and enables businesses to optimize their cloud resources, resulting in cost savings and improved operational efficiency.
- Budget control: organizations can gain better control over their expenses and ensure that they stay within budgetary limits, preventing unexpected financial burdens.
- Resource allocation: provides insights into resource utilization patterns, allowing businesses to allocate resources effectively and scale up or down as needed, ensuring optimal resource allocation and cost efficiency.
- Decision-making: helps organizations make informed decisions regarding cloud resource usage, service selection, and overall cloud strategy. It enables them to align their cloud investments with business goals and make cost-effective decisions that drive growth and innovation.

### Using Komiser for Cloud Cost Monitoring
Komiser's goal is to help you spend less time switching between confusing cloud provider consoles and have a clear view of what you manage in the cloud. To have quick access to what is important to you. Through this transparency, you can **uncover hidden costs**, **gain helpful insight** and start **taking control of your infrastructure**.

## Technologies being used
- Django
- AWS
- Terraform
- Ansible
- Komiser (Open source tool)

## AWS Services being used
- EC2 (Elastic Compute Cloud)
- VPC (Virtual Private Cloud)
- IAM (Identity & Access Management)
- ELB (Elastic Load Balancer)
- Route 53 (DNS Service - Optional)
- S3 Bucket

## Project Diagram

![](../../static/projects/cloud-cost-monitoring.png)

## Project Breakdown/Milestones

- **Milestone 1**
    - [X] Project Idea Discussion
    - [X] Run the [Django app](https://github.com/shreys7/django-todo) locally
    - [X] Build dockerfile & docker compose
    - [X] Create IAM EC2 policy
    - [X] Create an EC2 instance
    - [X] Create security group for EC2 instance
    - [X] Provision the instance + SSH
- **Milestone 2**
    - [X] Initial EC2 configuration using script
    - [X] Provision elastic load balancer
    - [X] Deploy containerised app on EC2 - **Ansible Playbook**
    - [X] Access the deployed app
    - [X] Additional: Implement Terraform State Lock (s3 + DynamoDB)
- **Milestone 3**
    - [ ] Implementing Komiser to monitor AWS resources
## Resources

- [Tailwarden Blog](https://www.tailwarden.com/blog/monitoring-cloud-costs-and-usage-of-a-next-js-application-with-komiser)
- [Tutorial: Deploy & monitor Next.js app with Komiser](https://www.youtube.com/watch?v=q7m_-iEjc6U)
- [Komiser Documentation](https://docs.komiser.io/docs/intro)
- [How to deploy Komiser to AWS with Terraform](https://www.youtube.com/watch?v=Hmerp_HMEf8)
- [AWS Policy Generator](https://awspolicygen.s3.amazonaws.com/policygen.html)
