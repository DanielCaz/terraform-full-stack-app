resource "aws_codepipeline" "main" {
  name          = var.name
  role_arn      = aws_iam_role.main.arn
  pipeline_type = "V2"

  artifact_store {
    location = aws_s3_bucket.main.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.main.arn
        FullRepositoryId = var.repository.id
        BranchName       = var.repository.branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_project
      }
    }
  }
}

resource "aws_iam_role" "main" {
  name = "AWSCodePipelineServiceRole-${var.region}-${var.name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  inline_policy {
    name   = "AWSCodePipelinePolicy-${var.region}-${var.name}"
    policy = data.aws_iam_policy_document.main.json
  }
}

resource "aws_s3_bucket" "main" {
  bucket = "${var.name}-codepipeline-artifacts"
}

resource "aws_codestarconnections_connection" "main" {
  name          = "github-connection"
  provider_type = "GitHub"
}
