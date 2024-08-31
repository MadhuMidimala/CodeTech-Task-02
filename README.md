# CodeTech-Task-02

NAME: MADHU MIDIMALA
COMPANY: CODTECH IT SOLUTIONS
INTERN ID: CT08DS5998
DOMAIN: DEVOPS
DURATION: 4-WEEKS
MENTOR: Neela Santhosh Kumar

# Infrastructure as Code with Terraform

This repository demonstrates how to use Terraform to automate the provisioning and management of cloud infrastructure. Specifically, we'll be provisioning AWS EC2 instances using Terraform configuration files.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- An AWS account with IAM credentials that have permissions to create resources
- AWS CLI configured on your local machine (optional but recommended)

## Getting Started

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-repo/terraform-aws-ec2.git
cd terraform-aws-ec2
```

### 2. Configure AWS Credentials

Terraform will need your AWS credentials to provision resources. You can provide these in a few different ways:

1. **Environment Variables**:

    ```bash
    export AWS_ACCESS_KEY_ID="your-access-key-id"
    export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
    ```

2. **AWS CLI Configuration** (if you've set up the AWS CLI):

    Terraform will automatically use the credentials configured with `aws configure`.

3. **Using a Terraform Provider File**:

    You can directly configure credentials in the `provider` block of the Terraform configuration, but this is not recommended for security reasons.

### 3. Define the Infrastructure

Open the `main.tf` file to define the infrastructure. Here’s a basic example to provision an EC2 instance:

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
```

### 4. Initialize Terraform

Before running any Terraform commands, initialize your working directory:

```bash
terraform init
```

### 5. Plan and Apply the Configuration

To see what resources will be created, you can run:

```bash
terraform plan
```

If the plan looks good, apply the configuration to create the resources:

```bash
terraform apply
```

### 6. Verify the Infrastructure

Once the apply command completes, Terraform will output the public IP address of the newly created EC2 instance (or any other outputs you define). You can SSH into the instance using:

```bash
ssh -i /path/to/your/key.pem ec2-user@<public-ip-address>
```

### 7. Destroy the Infrastructure

When you're done with the resources and want to clean up, use the `destroy` command to remove all resources created by Terraform:

```bash
terraform destroy
```

### 8. Outputs and Variables

You can customize your Terraform configurations using variables and outputs. For instance, to parameterize the AMI ID or instance type, create a `variables.tf` file:

```hcl
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}
```

And update `main.tf` accordingly:

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-EC2"
  }
}
```

### 9. Troubleshooting

- **Error: AWS credentials not found**: Ensure that your AWS credentials are correctly configured in the environment variables or AWS CLI.
- **Instance not created**: Double-check the AMI ID and instance type. The AMI might not be available in your specified region.

## Best Practices

- **Version Control**: Keep your Terraform configuration files in version control (e.g., Git).
- **State Management**: Use remote state storage for collaborative environments.
- **Modularize**: Break down your Terraform configuration into reusable modules.

## Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Conclusion

This project provides a starting point for managing your cloud infrastructure using Terraform. You can extend it to provision more complex resources like VPCs, RDS instances, and load balancers.
```

---

### Explanation

1. **Prerequisites**: Ensures that users have all necessary tools and credentials.
2. **Getting Started**: Guides users through cloning the repository and setting up AWS credentials.
3. **Defining Infrastructure**: Demonstrates a simple Terraform configuration for creating an EC2 instance.
4. **Plan and Apply**: Explains how to review and apply the configuration.
5. **Destroy Infrastructure**: Describes how to clean up resources when they are no longer needed.
6. **Outputs and Variables**: Provides an introduction to using variables and outputs for more flexible and reusable configurations.
7. **Troubleshooting**: Offers solutions for common issues.
8. **Best Practices**: Suggests practices for better Terraform usage.

