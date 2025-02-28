variable "instance_names" {
  type        = list(string)
  default     = ["instance-1", "instance-2"]
}

variable "ingress-rules" {
  type = list(number)
  default = [ 22,8080,80,443 ]
}

variable "egress-rules" {
  type = list(number)
  default = [ 22,8080,80,443,25 ]  
}
