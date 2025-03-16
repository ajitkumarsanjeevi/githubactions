variable "instance_names" {
  type        = list(string)
  default     = ["instance-1"]
}

variable "ingress-rules" {
  type = list(number)
  default = [ 22,8080,80,443 ]
}

variable "egress-rules" {
  type = list(number)
  default = [ 22,8080,80,443,25 ]  
}

ariable "ec2_configs" {
  type = map(any)
  default = {
    instance1 = {
      instance_type = "t2.micro"
      ami_id        = "ami-0abcdef1234567890"           
      key_name      = "splunk"
      tags = {
        Name = "Instance1"
      }
