#!/bin/bash

azs=$(aws ec2 describe-availability-zones --region ap-south-1 --query "AvailabilityZones[*].ZoneName" --output text)

for avaiability_zones in "$azs"

do

echo "$avaiability_zones"

done


