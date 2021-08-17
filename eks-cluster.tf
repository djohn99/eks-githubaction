provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  # load_config_file       = false
  # version                = "~> 1.11.1"
}

data "aws_availability_zones" "available" {
}

locals {
  cluster_name = "dave"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.0.3"

  cluster_name    = "${local.cluster_name}"
  cluster_version = "1.17"
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  node_groups = {
    first = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t3.medium"
    }

    second = {
      desired_capacity = 1
      max_capacity     = 10
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }

  write_kubeconfig   = true
  
}