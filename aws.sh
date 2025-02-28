#!/bin/bash

# Variables
ROLE_NAME="EC2-S3-FullAccess-Role"
POLICY_ARN="arn:aws:iam::aws:policy/AmazonS3FullAccess"
INSTANCE_ID="ami-02ddb77f8f93ca4ca" 

# Step 1: Create IAM Role
echo "Creating IAM role with S3 full access..."

aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document file://trust-policy.json

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn $POLICY_ARN

# Step 3: Create a trust policy file (for EC2 service)
cat <<EOF > trust-policy.json
{
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
}
EOF

# Step 4: Attach the IAM Role to the EC2 Instance
echo "Attaching IAM role to EC2 instance $INSTANCE_ID..."

aws ec2 associate-iam-instance-profile \
    --instance-id $INSTANCE_ID \
    --iam-instance-profile Name=$ROLE_NAME

echo "IAM role attached successfully."
