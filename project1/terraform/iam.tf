# IAM roles are largely handled by the EKS module, but we can add specific policies here if needed.
# For example, if the app needs to access S3, we would define IRSA (IAM Roles for Service Accounts) here.

data "aws_iam_policy" "ebs_csi_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.30.0"

  create_role                  = true
  role_name                    = "AmazonEKS_EBS_CSI_DriverRole"
  provider_url                 = module.eks.oidc_provider
  role_policy_arns             = [data.aws_iam_policy.ebs_csi_policy.arn]
  oidc_subjects_with_wildcards = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}
