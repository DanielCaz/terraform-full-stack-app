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

variable "environment_variables" {
  type = map(string)

  description = "The environment variables to pass to the CodeBuild project"

  default = {}
}

variable "additional_permissions" {
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))

  description = "Additional permissions to attach to the CodeBuild project"

  default = []
}
