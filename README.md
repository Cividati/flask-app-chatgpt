# Flask App on Google Cloud Run

This repository contains a Flask application that displays three environment variables and its deployment to Google Cloud Run using Docker and Terraform.

## Prerequisites
- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://www.terraform.io/downloads.html)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Running the App locally

1. Clone the repository:
```bash
git clone https://github.com/Cividati/flask-app-chatgpt.git
```

2. Build the Docker image:
```bash
docker build -t flask-app-chatgpt .
```

3. Run the Docker container:
```bash
docker run -p 5000:5000 flask-app-chatgpt
```

4. Open your web browser and go to `http://localhost:5000` to view the app.

## Deploying to Google Cloud Run

1. Authenticate to Google Cloud:
```bash
gcloud auth login
```

2. Set the project:
```bash
gcloud config set project <PROJECT_ID>
```
Replace <PROJECT_ID> with the ID of your Google Cloud project.

3. Initialize Terraform:
```bash
terraform init
```

4. Apply the Terraform script:
```bash
terraform apply
```
This will create a new Google Cloud Run service and store the environment variables as secrets in Google Cloud Secret Manager.

5. Open your web browser and go to the URL of the service to view the app.

## Cleaning Up

Run the following command to delete the Google Cloud Run service and the secrets in Google Cloud Secret Manager:
```bash
terraform destroy
```

