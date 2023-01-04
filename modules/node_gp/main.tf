resource "aws_eks_node_group" "non-prod" {
  
  cluster_name = var.eks_name

  for_each = { for k, v in var.nodedetail : k => v if true }
  
  node_role_arn = var.eks_cluster_arn

  subnet_ids = [
    var.private_subnet_1,
    var.private_subnet_2
  ]
  ami_type = try(each.value.ami_type)
  capacity_type = try(each.value.capacity_type)
  disk_size = try(each.value.disk_size)
  force_update_version = try(each.value.force_update_version)
  instance_types = try(each.value.instance_types)


  scaling_config {
    desired_size = try(each.value.desired_size)
    max_size = try(each.value.max_size)
    min_size = try(each.value.min_size)
    }

  labels = {
    role = "worker-nodes"
  }
}
