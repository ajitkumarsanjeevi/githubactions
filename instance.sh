#!/bin/bash
ids = $(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text) 

for instance id $ids

do

echo $"ids"

done
