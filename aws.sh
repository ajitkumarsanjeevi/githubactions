#!/bin/bash

# Variables
ROLE_NAME="EC2-S3-FullAccess-Role"
POLICY_ARN="arn:aws:iam::aws:policy/AmazonS3FullAccess"
INSTANCE_ID="i-0ffe435eb270e3cd0"
INSTANCE_PROFILE_NAME="EC2-S3-FullAccess-Profile"  

# Trust policy JSON in a variable
TRUST_POLICY='{
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
    --assume-role-policy-document "$TRUST_POLICY"

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn $POLICY_ARN

# Step 3: Create an Instance Profile
echo "Creating instance profile for the role..."

aws iam create-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME

# Step 4: Add the Role to the Instance Profile
echo "Adding role to the instance profile..."

aws iam add-role-to-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME \
    --role-name $ROLE_NAME

# Step 5: Attach the IAM Instance Profile to the EC2 Instance
echo "Attaching IAM instance profile to EC2 instance $INSTANCE_ID..."

aws ec2 associate-iam-instance-profile \
    --instance-id $INSTANCE_ID \
    --iam-instance-profile Name=$INSTANCE_PROFILE_NAME

echo "IAM role successfully attached to EC2 instance."
