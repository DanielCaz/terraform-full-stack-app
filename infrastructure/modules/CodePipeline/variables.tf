variable "region" {
  type = string

  description = "The AWS region to deploy the CodePipeline pipeline"
}

variable "name" {
  type = string

  description = "The name of the CodePipeline pipeline"
}

variable "repository" {
  type = object({
    id     = string
    branch = string
  })
}

variable "codebuild_project" {
  type = string

  description = "The name of the CodeBuild project"
}
