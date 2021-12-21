
# Kubernetes Access Policy for Load Balancer Controller service account
# 
resource "aws_iam_policy" "aws_loadbalancercontroller_policy" {
  name        = "AWSLoadBalancerControllerPolicy"
  path        = "/"
  description = "AWSLoadBalancerControllerPolicy for Kubernetes EKS Clusters"

  policy = file("${path.module}/iam/AWSLoadBalancerControllerIAMPolicy.json")

  #policy = file("${path.module}/iam/full.json")
}

# Kubernetes Access Policy for CSI Driver service account
# see https://raw.githubusercontent.com/kubernetes-sigs/aws-ebs-csi-driver/v1.0.0/docs/example-iam-policy.json
resource "aws_iam_policy" "aws_csi_driver_policy" {
  name        = "AmazonEKS_EBS_CSI_Driver_Policy"
  path        = "/"
  description = "AWSCSIDriverPolicy for CSI Driver in Kubernetes EKS Clusters"

  policy = file("${path.module}/iam/csi-iam-policy.json")

  #policy = file("${path.module}/iam/full.json")
}

# EKS extend worker policy for Cloudwatch insights
#resource "aws_iam_policy" "aws_cwinsights_policy" {
#  name        = "AmazonEKSCloudwatchInsightsPolicy"
#  path        = "/"
#  description = "AWS worker role extension policy for CW insights"
#
#  policy = file("${path.module}/iam/cwinsights.json")
#
#  #policy = file("${path.module}/iam/full.json")
#}