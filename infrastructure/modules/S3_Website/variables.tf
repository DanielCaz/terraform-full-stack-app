variable "name" {
  type = string

  description = "The name of the S3 bucket"
}

variable "index_document" {
  type = string

  description = "The index document of the S3 bucket"

  default = "index.html"
}
