#!/bin/bash
ids = $(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text) 

for instance in "$ids'

do

echo "$instance"

done
