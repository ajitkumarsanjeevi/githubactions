#!/bin/bash

# Define the region and availability zone
region="ap-south-1"
availability_zone="ap-south-1a"

# Fetch EC2 instance IDs in the specified availability zone
echo "Fetching instance IDs in availability zone: $availability_zone in region: $region"

instance_ids=$(aws ec2 describe-instances \
  --region $region \
  --query "Reservations[*].Instances[?Placement.AvailabilityZone=='$availability_zone'].InstanceId" \
  --output text)

# Check if instance IDs were found
if [ -n "$instance_ids" ]; then
  echo "Instance IDs in $availability_zone:"
  echo "$instance_ids"
else
  echo "No instances found in $availability_zone."
fi

