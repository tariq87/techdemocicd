provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.24"
  subnets         = ["subnet-abcde012", "subnet-bcde012a"]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  node_groups = {
    eks_nodes = {
      desired_capacity = 3
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.large"
      key_name      = var.key_name
    }
  }
}

