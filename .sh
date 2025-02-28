#!/bin/bash
sudo apt update -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo awscliv2.zip
sudo ./aws/install
