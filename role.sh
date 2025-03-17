Cluster_role_Name="eks_role"
Worker_role_Name="eks_worker_role"

aws iam create-role \
    --role-name $Cluster_role_Name \
    --assume-role-policy-document file://ekscluster-trust-policy.json

aws iam attach-role-policy \
    --role-name $Cluster_role_Name \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy 

eks_worker_node (){
aws iam create-role \
    --role-name $Worker_role_Name \
    --assume-role-policy-document file://eksworker-trust-policy.json

aws iam attach-role-policy \
    --role-name $Worker_role_Name \
    --policy-arn "$1"  
}

eks_worker_node "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
eks_woker_node  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
eks_woker_node  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"  
