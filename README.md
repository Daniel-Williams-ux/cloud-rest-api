#  Production-Ready Cloud REST API on AWS

##  Project Summary

This project is a production-style cloud application designed and deployed on AWS using industry-standard practices.

It demonstrates the ability to:
- Design cloud architecture from first principles
- Deploy and manage backend services in the cloud
- Automate infrastructure and deployments
- Apply security and monitoring best practices

This is not a tutorial project. It reflects how real systems are built and operated.

---

##  What This Project Proves

- I can design and explain cloud systems end-to-end
- I understand AWS networking, compute, and security fundamentals
- I can automate infrastructure using Terraform
- I can implement CI/CD pipelines used in real teams
- I can deploy, monitor, and maintain a live system

---

##  Architecture Overview

### Request Flow

Client → Load Balancer → Application Server → Response

---

### Architecture Diagram
            ┌───────────────┐
            │    Client     │
            │ (Browser/API) │
            └──────┬────────┘
                   │ HTTP Request
                   ▼
        ┌────────────────────────┐
        │ Application Load       │
        │ Balancer (ALB)         │
        └────────┬───────────────┘
                 │
                 ▼
        ┌────────────────────────┐
        │   EC2 Instance         │
        │  Node.js REST API      │
        └────────┬───────────────┘
                 │
                 ▼
        ┌────────────────────────┐
        │   CloudWatch Logs      │
        │   & Monitoring         │
        └────────────────────────┘


---

## ⚙️ Tech Stack

- Cloud: AWS (EC2, ALB, VPC, IAM, CloudWatch)
- Backend: Node.js (Express)
- Infrastructure as Code: Terraform
- CI/CD: GitHub Actions
- Monitoring: CloudWatch

---

## 📁 Project Structure

├── terraform/ # Infrastructure as Code (VPC, EC2, ALB)
├── app/ # Node.js REST API
│ ├── routes/
│ ├── controllers/
│ └── server.js
├── .github/
│ └── workflows/ # CI/CD pipeline
├── docs/ # Architecture & documentation
└── README.md


---

##  Key Features

- Custom VPC with public subnets
- Secure IAM roles (no hardcoded credentials)
- Node.js API deployed on EC2
- Application Load Balancer with health checks
- Terraform-based infrastructure provisioning
- Automated CI/CD pipeline (GitHub Actions)
- CloudWatch logging and monitoring

---

## 🔐 Security Approach

- IAM roles instead of access keys
- Least privilege access model
- Security groups controlling traffic
- No secrets stored in code

---

## 🔄 CI/CD Pipeline

Every push triggers:

1. Code validation
2. Build process
3. Deployment to EC2
4. Live system update

---

##  Monitoring & Observability

- Logs streamed to CloudWatch
- Metrics tracked for system health
- Designed for alerting and failure detection

---

##  Key Engineering Decisions

### Why EC2?

- Full control over runtime environment
- Suitable for long-running services
- Clear demonstration of infrastructure knowledge

---

### Why Terraform?

- Infrastructure is version-controlled
- Reproducible environments
- Industry-standard DevOps tool

---

### Why ALB?

- Distributes incoming traffic efficiently
- Enables health checks
- Improves availability and reliability

---

##  Setup Instructions

### Clone Repository

git clone https://github.com/your-username/your-repo.git

cd your-repo


---

### Configure AWS


aws configure


---

### Deploy Infrastructure


cd terraform
terraform init
terraform apply


---

### Run Locally (Optional)


cd app
npm install
npm run dev


---

##  API Endpoint


http://<load-balancer-dns>/api


---

## 🧪 Health Check


GET /health


Response:


{
"status": "ok"
}


---

##  What I Learned

- Cloud architecture design
- Infrastructure as Code (Terraform)
- CI/CD pipeline implementation
- AWS networking and security
- Monitoring and observability
- System design explanation for interviews

---

##  Future Improvements

- Auto Scaling Group
- HTTPS (SSL via ACM)
- Database integration (RDS or DynamoDB)
- Docker containerization
- Migration to ECS or Kubernetes

---

##  Author

Daniel Williams  
Cloud Engineer | Backend Developer  

---

## 📌 Final Note

This project reflects real-world cloud engineering practices and demonstrates readiness for 
