#!/bin/bash

# Variables
ROLE_NAME="EC2-S3-FullAccess-Role"
POLICY_ARN="arn:aws:iam::aws:policy/AmazonS3FullAccess"
INSTANCE_ID="i-077636a4f920985df" 

# Step 3: Create a trust policy file (for EC2 service)
TRUST-POLICY='{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}'


# Step 1: Create IAM Role
echo "Creating IAM role with S3 full access..."

aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document "$TRUST-POLICY"

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn $POLICY_ARN




# Step 4: Attach the IAM Role to the EC2 Instance
echo "Attaching IAM role to EC2 instance $INSTANCE_ID..."

aws ec2 associate-iam-instance-profile \
    --instance-id $INSTANCE_ID \
    --iam-instance-profile Name=$ROLE_NAME

echo "IAM role attached successfully."
