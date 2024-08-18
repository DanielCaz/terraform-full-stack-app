data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${var.name}",
      "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${var.name}:*"
    ]

    effect = "Allow"
  }

  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation"
    ]

    resources = [
      "arn:aws:s3:::${var.codepipeline_artifact_bucket}/*"
    ]

    effect = "Allow"
  }

  statement {
    actions = [
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
      "codebuild:BatchPutCodeCoverages"
    ]

    resources = [
      "arn:aws:codebuild:${var.region}:${data.aws_caller_identity.current.account_id}:report-group/${var.name}-*"
    ]

    effect = "Allow"
  }
}

data "aws_iam_policy_document" "additional" {
  count = length(var.additional_permissions) > 0 ? 1 : 0

  dynamic "statement" {
    for_each = var.additional_permissions
    content {
      effect    = statement.value.effect
      actions   = statement.value.actions
      resources = statement.value.resources
    }
  }
}
