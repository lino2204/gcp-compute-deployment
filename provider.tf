provider "google" {
  project = var.project_id
  region  = "us-central1"
  credentials = jsonencode({
    "type": "external_account",
    "audience": "identitynamespace:${var.project_id}.svc.id.goog",
    "subject_token_type": "urn:ietf:params:oauth:token-type:jwt",
    "token_url": "https://sts.googleapis.com/v1/token",
    "credential_source": {
      "file": "/var/run/secrets/tokens/github-actions-token"
    }
  })
}
