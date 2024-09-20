# Terraform Full Stack App

This project is a full-stack application that leverages Terraform for infrastructure as code and a React frontend built with TypeScript and Vite. The infrastructure includes AWS services such as CodeBuild, CodePipeline, and S3 for continuous integration and deployment.

## Project Structure

- **frontend/**: Contains the React frontend application.
- **infrastructure/**: Contains Terraform configuration files.

## Getting Started

### Frontend

1. Navigate to the `frontend` directory:

```sh
cd frontend
```

2. Install dependencies:

```sh
bun install
```

3. Start the development server:

```sh
bun run dev
```

### Infrastructure

1. Navigate to the `infrastructure` directory:

```sh
cd infrastructure
```

2. Create `terraform.tfvars` file with the following content:

```hcl
region       = <AWS region>
project_name = <Project name>
```

3. Initialize Terraform:

```sh
terraform init
```

4. Apply the Terraform configuration:

```sh
terraform apply
```
