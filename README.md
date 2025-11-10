## Terraform Repositories for SRE Interview Task
This repo contains Terraform IAAC for deploying and managing AWS resources accross multiple regions. To implement a good gitoops practices, this repo will also integrated with terraform parse services which act as a service that can raises Merge Requests (MRs) when new infra is requested from user using http payload from frontend.

**Repo structure**
```txt
DAFA-TRIPLA-IAAC/
├── .github/workflows/terraform.yml
├── ap-southeast-1/ # Singapore region
│   ├── s3.tf 
│   ├── eks.tf 
│   └── backend.tf
├── ap-northeast-3/ # Japan region
│   ├── main.tf
│   └── backend.tf
└── README.md
```

**CI/CD Workflow Overview**
The github actions workflow automates *Terraform validation, planning, and apply* processes for each of the region. TF changes can only be applied once the PR is reviewed and merged to main which refers to github.ref that have been set in the workflows. (TODO : Add CODEOWNERS for each resource file)

**AWS CLI Command**
```shell
# List VPC
aws ec2 describe-vpcs --region ap-southeast-1

# List all Subnets
aws ec2 describe-subnets --region ap-southeast-1

# Add EKS Kube Config
aws eks update-kubeconfig --region ap-southeast-1 --name dafa-tripla-eks
```