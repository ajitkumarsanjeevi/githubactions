
#!/bin/bash

# Variables

ROLE_NAME="Eksworkernodepolicy" 


ekswokernodepolicy()  {
aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document file://trust-policy.json

# Step 2: Attach S3 Full Access Policy
aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn $1

}

eksworkernodepolicy arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy

eksworkernodepolicy arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy

eksworkernodepolicy arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

