region     = "us-east-1"
vpc_id               = "vpc-04523bdfdb8a58a65"
cidr_block           = "10.0.0.0/16"
az              = ["us-east-1a", "us-east-1b"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = [ "10.0.3.0/24", "10.0.4.0/24"]
eks_version = 1.24
env = "non-prod"

##Node group detail

nodedetail = {
    first = {
        desired_size = 2
        max_size     = 2
        min_size = 1
        ami_type = "AL2_x86_64"
        capacity_type =  "ON_DEMAND"
        disk_size = 20
        force_update_version = "false"
        instance_types = ["t2.medium"]
    }
    second = {
        desired_size = 1
        max_size     = 2
        min_size = 1
        ami_type = "AL2_x86_64"
        capacity_type =  "ON_DEMAND"
        disk_size = 20
        force_update_version = "false"
        instance_types = ["t2.micro"]
    }
}