# Project Setup

Below are the steps to setup and run the project:

### Testing the Django App 

> **Huge shoutout to [Shrey Shah](https://github.com/shreys7/django-todo) for contributing the Django Application!**

1. Clone the repo:
    ```bash
    git clone https://github.com/kubesimplify/cloudnative-lab.git
    ```
2. Head over to the project's directory:
    ```bash
    cd projects/ep-cloud-cost-monitoring/project_files
    ```
3. Create the python database migrations:
    ```bash
    python manage.py makemigrations
    ```
4. Apply the migrations through the following command:
    ```bash
    python manage.py migrate
    ```
5. Create an ADMIN user:
    ```bash
    python manage.py createsuperuser
    ```
6. Start the Django server:
    ```bashz
    python manage.py runserver
    ```

**You can now access the app at: **`http://127.0.0.1:8000/todos`** 🎉**

### Provisioning the Infrastructure Using Terraform

1. Configure the Terraform Provider:

    ```bash
    provider "aws" {
      region = var.aws_region
      profile = var.aws_profile
    }
    ```
2. Add your default VPC ID:

    ```bash
    variable "vpc_id" {
      description = "The VPC ID"
      type        = string
      default     = "default_vpc_id"
    }
    ```
3. Add the path to public SSH key:
    ```bash
    variable "public_key_path" {
      description = "Path to the public SSH key"
      type        = string
      default     = "/path/to/public_ssh_key"
    }
    ```
    > You may need to create new SSH keys for authenticating your EC2 instance. Use the `ssh-keygen` command to create new public and private keys!

4. (Optional) Change the Tag Value:
    ```bash
    variable "tag_name" {
      description = "The tag name to use for resources"
      type        = string
      default     = "komiser-django-app"
    }
    ```
    > Using this tag value, we can easily filter out cloud resources related to our app in Komiser!

5. Use the following command to provision the resources on AWS:
    ```bash
    terraform apply
    ```
6. Following are the list of the main resources that will be created:
    - New IAM user (credentials given as an output)
    - EC2 Instance (Elastic IP given as an output)
    - Elastic Load Balancer (URL given as an output)

### Deploy the App on our Remote EC2 Instance - Using Ansible

Head over to the "ansible" directory and make the following changes in the Inventory file:

1. Change the `ansible_host` value with the IP address of your EC2 instance:

    ```bash
    ansible_host: 100.25.18.132
    ```
2. Provide the location of the private SSH key file:
    ```bash
    ansible_ssh_private_key_file: "/path/to/ssh/key/file"
    ```
3. To check a successful remote connection, ping the EC2 instance through ansible, using the following command:
    ```bash
    ansible virtualmachines -m ping -i inventory.yaml
    ```
4. Run the following command to deploy the app using the ansible playbook:
    ```bash
    ansible-playbook -i inventory.yaml playbook.yaml
    ```

If everything goes well, you'll be able to access the ToDo list at the **Elastic Load Balancer DNS URL**!

### Monitor the resources using Komiser

1. Make sure to have the latest version of [Komiser CLI](https://docs.komiser.io/getting-started/installation) installed.
2. Head over to the "komiser-config" directory and make the following changes in `config.toml`:

    ```bash
    [[aws]]
    path="/path/to/credentials/file"
    profile="AWS_profile_name"
    ```
3. Start a new Komiser server using the following command:
    ```bash
    komiser start --config config.toml
    ```
4. You'll now be able to access the Komiser Dashboard at: **`http://127.0.0.1:3000`**
5. Head over to the inventory section and here, you'll be able to filter out the resources by creating a new filter, based on the following values:
    - **Tag Key:** `Name`
    - **Tag Value:** `komiser-django-app` (Tag value we used with our cloud resources)

![](https://hackmd.io/_uploads/BkS9r_3za.png)

**Congratulation, you have successfully setup cost monitoring of your cloud resources, using Komiser 🎉**