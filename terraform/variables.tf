variable "credentials" {
  description = "My own credentials"
  default     = "../gcp/keys/mw-creds.json"
}

variable "region" {
  type    = string
  default = "europe-north1"
  # default = "west-europe"
}
variable "project" {
  type    = string
  default = "monkey-wrench-418607"
}

variable "location" {
  description = "project location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "dataset name"
  default     = "mw_dataset"

}

variable "gcs_bucket_name" {
  description = "bucket name"
  default     = "mw_bucket"

}

variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"

}