module "codebuild_frontend" {
  source = "./modules/CodeBuild"

  name                         = "${var.project_name}-frontend"
  region                       = var.region
  buildspec_path               = "./infrastructure/templates/buildspec.yml"
  codepipeline_artifact_bucket = module.codepipeline.bucket_name

  environment_variables = {
    BUCKET_NAME = module.s3_bucket.bucket_name
  }

  additional_permissions = [
    {
      effect = "Allow"
      actions = [
        "s3:DeleteObject",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
      ]
      resources = [
        "arn:aws:s3:::${module.s3_bucket.bucket_name}/*"
      ]
    }
  ]
}

module "codepipeline" {
  source = "./modules/CodePipeline"

  name              = "${var.project_name}-pipeline"
  codebuild_project = module.codebuild_frontend.name
  region            = var.region
  repository = {
    id     = "DanielCaz/terraform-full-stack-app"
    branch = "main"
  }
}

module "s3_bucket" {
  source = "./modules/S3_Website"

  name = "${var.project_name}-website-bucket"
}
