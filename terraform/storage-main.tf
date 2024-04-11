resource "google_storage_bucket" "monkey_wrench_bucket" {
  name                     = var.gcs_bucket_name
  location                 = var.location
  force_destroy            = true
  public_access_prevention = "enforced"

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "monkey_wrench_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}