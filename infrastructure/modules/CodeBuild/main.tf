resource "aws_codebuild_project" "main" {
  name         = var.name
  description  = "CodeBuild project for ${var.name}"
  service_role = aws_iam_role.main.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.key
        value = environment_variable.value
      }
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = var.buildspec_path
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }
}

resource "aws_iam_role" "main" {
  name = "codebuild-${var.region}-${var.name}-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  inline_policy {
    name   = "codebuild-${var.region}-${var.name}"
    policy = data.aws_iam_policy_document.main.json
  }

  dynamic "inline_policy" {
    for_each = data.aws_iam_policy_document.additional
    content {
      name   = "codebuild-${var.region}-${var.name}-additional-permissions"
      policy = inline_policy.value.json
    }
  }
}
