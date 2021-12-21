module "codecommit-eks-dev" {
  source  = "JamesWoolfenden/codecommit/aws"
  version = "0.3.10"
  # default_branch  = var.default_branch
  # defaults to main
  repository_name = var.eks_dev_repository_name
  #developer_group = var.developer_group
}

module "codecommit-eks-01-dev" {
  source  = "JamesWoolfenden/codecommit/aws"
  version = "0.3.10"
  default_branch  = var.default_branch
  # defaults to main
  repository_name = var.eks_dev_repository_01_name
  #developer_group = var.developer_group
}
