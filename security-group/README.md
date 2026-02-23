# 🔐 Terraform AWS Security Group with Dynamic Ingress Rules

This project demonstrates how to create a configurable AWS Security Group using Terraform with dynamic ingress rules, variable validation, and conditional logic.

The configuration is designed to be flexible, reusable, and aligned with professional Infrastructure as Code (IaC) practices.

---

## 📁 Project Structure

```
.
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── README.md
└── .gitignore
```

---

## 🚀 What This Project Does

- Fetches the default AWS VPC using a data source
- Creates a Security Group inside that VPC
- Dynamically enables or disables:
  - SSH access (port 22)
  - HTTP access (port 80)
- Uses boolean flags to control ingress rule creation
- Implements variable validation for better input safety
- Uses map variables for flexible port configuration
- Allows customizable CIDR blocks

---

## 🛠 Technologies Used

- Terraform
- AWS Provider
- AWS EC2 Security Groups
- Dynamic Blocks
- Input Validation
- Conditional Expressions

---

## ⚙️ Variables

Defined in `variables.tf`:

| Variable | Description |
|----------|------------|
| `region` | AWS region |
| `sg_name` | Security group name |
| `sg_description` | Security group description |
| `allowed_ssh_cidr` | CIDR blocks allowed for SSH |
| `allowed_http_cidr` | CIDR blocks allowed for HTTP |
| `port` | Map containing SSH and HTTP ports |
| `protocol` | Network protocol (default: tcp) |
| `enable_ssh` | Enable/disable SSH ingress rule |
| `enable_http` | Enable/disable HTTP ingress rule |

Example in `terraform.tfvars`:

```
region   = "us-east-1"
sg_name  = "terraform-sg"
allowed_ssh_cidr  = ["0.0.0.0/0"]
allowed_http_cidr = ["0.0.0.0/0"]
```

---

## 🧠 Key Concepts Demonstrated

### ✅ Dynamic Blocks
Used to conditionally create ingress rules based on boolean variables.

Example logic:
```
for_each = var.enable_ssh ? [1] : []
```

This allows enabling or disabling specific rules without duplicating resources.

---

### ✅ Map Variables
Ports are defined using a map:

```
port = {
  ssh  = 22
  http = 80
}
```

This improves flexibility and readability.

---

### ✅ Variable Validation
Input validation ensures required variables are not empty.

Example:
```
validation {
  condition     = length(var.sg_name) > 0
  error_message = "The sg_name variable must not be empty."
}
```

---

## ▶️ How to Run

Initialize Terraform:

```
terraform init
```

Validate configuration:

```
terraform validate
```

Preview changes:

```
terraform plan
```

Apply configuration:

```
terraform apply
```

Destroy resources:

```
terraform destroy
```

---

## 🔒 Security Considerations

- Avoid using `0.0.0.0/0` for SSH in production.
- Restrict SSH access to specific IP ranges.
- Use tags in production environments.
- Prefer custom VPCs instead of default VPC in real-world deployments.

---

## 📌 Learning Outcomes

This project helped me understand:

- AWS Security Groups
- Terraform dynamic blocks
- Conditional resource creation
- Variable validation
- Map and list variable types
- Infrastructure modular thinking

---

## 🚀 Future Enhancements

- Add resource tagging
- Make VPC ID configurable instead of using default VPC
- Convert into reusable Terraform module
- Launch EC2 instance using this security group
- Implement remote backend (S3 + DynamoDB)

---

👨‍💻 Built as part of my Terraform learning journey.