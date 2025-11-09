## Terraform Repositories for SRE Interview Task
This repo contains Terraform IAAC for deploying and managing AWS resources accross multiple regions. To implement a good gitoops practices, this repo will also integrated with terraform parse services which act as a service that can raises Merge Requests (MRs) when new infra is requested from user using http payload from frontend.
```
Repo structure

DAFA-TRIPLA-IAAC/
├── ap-southeast-1/ # Singapore region
│   ├── s3.tf 
│   ├── eks.tf 
│   └── backend.tf
├── ap-northeast-3/ # Japan region
│   ├── main.tf
│   └── backend.tf
└── README.md
```

List all VPC
aws ec2 describe-vpcs --region ap-southeast-1

List all Subnets
aws ec2 describe-subnets --region ap-southeast-1