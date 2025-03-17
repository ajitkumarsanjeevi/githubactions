variable "instance_names" {
  type        = list(string)
  default     = ["instance-1"]
}

variable "ingress-rules" {
  type = list(number)
  default = [ 22,8080,80,443 ]
}

variable "worker_node_policies" {
  description = "List of policy ARNs to attach to the EKS worker node role"
  type        = list(string)
  default = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy, "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEC2FullAccess"]
}

