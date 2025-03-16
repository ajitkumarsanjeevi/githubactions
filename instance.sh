#!/bin/bash
ids = $(aws ec2 describe-instances --region ap-south-1 --query "Reservations[*].Instances[*].InstanceId" --output text) 

for instance in "$ids"

do

echo "$instance"

done
