variable "credentials" {
  description = "My own credentials"
  default     = "../gcp/keys/mw-creds.json"
}

variable "project" {
  type    = string
  default = "monkey-wrench-418607"
}

variable "location" {
  description = "project location"
  default     = "US"
  # default = "europe-north1"
  # default = "west-europe"
}

variable "region" {
  description = "project region"
  default     = "us-west1"
  # default = "europe-north1"
  # default = "west-europe"
}