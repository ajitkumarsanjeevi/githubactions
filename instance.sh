#!/bin/bash

# List of all AWS regions
regions=$(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)

# Loop through each region
for region in $regions; do
  if [[ "$region" == "ap-south-1" ]]; then
    echo "Fetching instance IDs for region: $region"
    
    # Fetch EC2 instance IDs for the current region (ap-south-1)
    instance_ids=$(aws ec2 describe-instances --region $region --query "Reservations[*].Instances[*].InstanceId" --output text)
    
    # Check if there are instance IDs and print them
    if [ -n "$instance_ids" ]; then
      echo "$instance_ids"
    else
      echo "No instances found in $region"
    fi
  fi
done
