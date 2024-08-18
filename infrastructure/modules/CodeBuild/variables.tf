variable "region" {
  type = string

  description = "The AWS region to deploy the CodeBuild project"
}

variable "name" {
  type = string

  description = "The name of the CodeBuild project"
}

variable "buildspec_path" {
  type = string

  description = "The path to the buildspec file"
}

variable "codepipeline_artifact_bucket" {
  type = string

  description = "The name of the S3 bucket where the pipeline artifacts are stored"
}
