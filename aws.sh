
#!/bin/bash

# Variables

ROLE_NAME="s3fullaccess"

INSTANCE_PROFILE_NAME="myinstanceprofile"
 
s3_fullaccess() {   

echo "Creating IAM role with S3 full access..."

aws iam create-role \
    --role-name $ROLE_NAME \
    --assume-role-policy-document file://trust-policy.json

# Step 2: Attach S3 Full Access Policy
echo "Attaching AmazonS3FullAccess policy to the role..."

aws iam attach-role-policy \
    --role-name $ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

aws iam create-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME

# Add Role to Instance Profile
aws iam add-role-to-instance-profile \
    --instance-profile-name $INSTANCE_PROFILE_NAME \
    --role-name $ROLE_NAME


aws ec2 associate-iam-instance-profile \
    --instance-id $1 \
    --iam-instance-profile Name=$INSTANCE_PROFILE_NAME

}
s3_fullaccess "i-0130b7df38748b5a0"            
