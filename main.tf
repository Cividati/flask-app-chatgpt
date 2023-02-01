provider "google" {
  version = "2.22.0"
}

module "cloud_run" {
  source = "terraform-google-modules/cloudrun/google"
  version = "3.1.0"
  name = "your-app-name"
  region = "us-central1"
  environment = "production"
  create_secret = true
  secret_name = "your-secret-name"
  image = "your-gcr-image"
  env_vars = {
    ENV_01 = "${google_secret_manager_secret.your-secret-name.replication.0.secret_payload.data.value}"
    ENV_02 = "${google_secret_manager_secret.your-secret-name.replication.1.secret_payload.data.value}"
    ENV_03 = "${google_secret_manager_secret.your-secret-name.replication.2.secret_payload.data.value}"
  }
}

resource "google_secret_manager_secret" "your-secret-name" {
  name     = "your-secret-name"
  replication {
    automatic = true
  }
  secret_file = "${path.module}/secrets"
}
