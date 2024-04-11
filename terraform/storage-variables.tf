variable "gcs_bucket_name" {
  description = "bucket name"
  default     = "mw_bucket"
}

variable "bq_dataset_name" {
  description = "dataset name"
  default     = "mw_dataset"
}

variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"

}