data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "iam:PassRole",
    ]

    resources = ["*"]

    effect = "Allow"

    condition {
      test     = "StringEqualsIfExists"
      variable = "iam:PassedToService"

      values = [
        "cloudformation.amazonaws.com",
        "elasticbeanstalk.amazonaws.com",
        "ec2.amazonaws.com",
        "ecs-tasks.amazonaws.com",
      ]
    }
  }

  statement {
    actions = [
      "codecommit:CancelUploadArchive",
      "codecommit:GetBranch",
      "codecommit:GetCommit",
      "codecommit:GetRepository",
      "codecommit:GetUploadArchiveStatus",
      "codecommit:UploadArchive",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "codedeploy:CreateDeployment",
      "codedeploy:GetApplication",
      "codedeploy:GetApplicationRevision",
      "codedeploy:GetDeployment",
      "codedeploy:GetDeploymentConfig",
      "codedeploy:RegisterApplicationRevision",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "codestar-connections:UseConnection",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "elasticbeanstalk:*",
      "ec2:*",
      "elasticloadbalancing:*",
      "autoscaling:*",
      "cloudwatch:*",
      "s3:*",
      "sns:*",
      "cloudformation:*",
      "rds:*",
      "sqs:*",
      "ecs:*",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "lambda:InvokeFunction",
      "lambda:ListFunctions",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectVersionAcl",
    ]

    resources = [
      "arn:aws:s3:::codepipeline-*",
      "arn:aws:s3:::elasticbeanstalk-*",
      "arn:aws:s3:::elasticbeanstalk-*/*",
    ]

    effect = "Allow"
  }

  statement {
    actions = [
      "s3:GetBucketAcl",
      "s3:GetBucketPolicy",
      "s3:ListAllMyBuckets",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::codepipeline-*",
      "arn:aws:s3:::elasticbeanstalk-*",
    ]

    effect = "Allow"
  }

  statement {
    actions = [
      "sns:Subscribe",
      "sns:GetTopicAttributes",
      "sns:Publish",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "cloudformation:DescribeChangeSet",
      "cloudformation:DescribeStackResources",
      "cloudformation:DescribeStacks",
      "cloudformation:GetTemplate",
      "cloudformation:ListStackResources",
      "cloudformation:UpdateStack",
      "cloudformation:CreateChangeSet",
      "cloudformation:DeleteChangeSet",
      "cloudformation:ExecuteChangeSet",
      "cloudformation:CreateStack",
      "cloudformation:DeleteStack",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "cloudformation:ValidateTemplate",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "cloudformation:CreateStack",
      "cloudformation:DeleteStack",
      "cloudformation:DescribeStacks",
      "cloudformation:UpdateStack",
      "cloudformation:CreateChangeSet",
      "cloudformation:DeleteChangeSet",
      "cloudformation:DescribeChangeSet",
      "cloudformation:ExecuteChangeSet",
      "cloudformation:SetStackPolicy",
      "cloudformation:ValidateTemplate",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
      "codebuild:BatchGetBuildBatches",
      "codebuild:StartBuildBatch",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "devicefarm:ListProjects",
      "devicefarm:ListDevicePools",
      "devicefarm:GetRun",
      "devicefarm:GetUpload",
      "devicefarm:CreateUpload",
      "devicefarm:ScheduleRun",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "servicecatalog:ListProvisioningArtifacts",
      "servicecatalog:CreateProvisioningArtifact",
      "servicecatalog:DescribeProvisioningArtifact",
      "servicecatalog:DeleteProvisioningArtifact",
      "servicecatalog:UpdateProduct",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "cloudformation:ValidateTemplate",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "ecr:DescribeImages",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "states:DescribeExecution",
      "states:DescribeStateMachine",
      "states:StartExecution",
    ]

    resources = ["*"]

    effect = "Allow"
  }

  statement {
    actions = [
      "appconfig:StartDeployment",
      "appconfig:StopDeployment",
      "appconfig:GetDeployment",
    ]

    resources = ["*"]

    effect = "Allow"
  }
}
