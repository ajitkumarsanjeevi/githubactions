
#!/bin/bash

# Variables

ROLE_NAME="Eksworkernodepolicy" 


function  ekswokernodepolicy() {


echo "Creating IAM role with S3 full access..."

aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document file://trust-policy.json

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn $1

}

eksworkernodeplicy arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy

eksworkernodepolicy arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy

eksworkernodepoicy arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

