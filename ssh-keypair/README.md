# 🔐 Terraform AWS SSH Key Pair Project

This project demonstrates how to generate an SSH key pair locally using Terraform and upload the public key to AWS as an EC2 Key Pair.

It follows a clean and modular Terraform structure suitable for beginners learning Infrastructure as Code (IaC).

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

- Generates a secure 4096-bit RSA key pair locally
- Uploads the public key to AWS as an EC2 Key Pair
- Saves the private key locally with secure file permissions (0600)
- Uses Terraform variables for flexibility
- Keeps environment configuration separate using `terraform.tfvars`

---

## 🛠 Technologies Used

- Terraform
- AWS Provider
- TLS Provider
- Local Provider

---

## ⚙️ Prerequisites

- Terraform installed
- AWS CLI configured (`aws configure`)
- AWS IAM credentials with EC2 permissions

---

## 🧾 Variables

Defined in `variables.tf`:

- `region` → AWS region
- `key_name` → Name of the SSH key pair

Values are provided in `terraform.tfvars`.

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

## 🔒 Security Notes

- Private key files (`*.pem`) are ignored using `.gitignore`
- File permission is set to `0600`
- Do NOT commit `.tfvars` files containing sensitive data in real projects
- Do NOT commit `terraform.tfstate` files

---

## 📌 Learning Outcome

This project helped me understand:

- Terraform providers and resources
- Variable management
- Secure key generation
- Local file handling
- AWS EC2 key pair integration
- Professional Terraform project structure

---

## 📬 Next Improvements (Planned)

- Launch EC2 instance using this key
- Create reusable Terraform modules
- Implement remote backend (S3 + DynamoDB)
- Add environment-based configurations (dev/prod)

---

👨‍💻 Created as part of my Terraform learning journey.