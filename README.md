# Cougar (_Puma concolor_) occurences tracker

A data pipeline that use `dbt`, `mage`, `Terraform` and `GCP`

## Overview

### Purpose

The aim of this project is to build a dashboard to track the occurrences (i.e. human sightings) of Cougar (_Puma concolor_) over several years and over the Southwestern states of the United States.

### Process

The data is ingested through a batch job on a monthly basis orchestrated through `Mage`. The main dataset is based on a copy of a public dataset of `BigQuery`. Once everything is set up, data is transformed via `dbt` into a clean timeseries table which is then used to create the dashboard.

> [!NOTE]
> The main dataset may be enriched by other informations that will be first ingested into a data lake (`GCS`), and loaded to `BigQuery`

### Dataset

- Main dataset: [GBIF Species Occurrences](https://console.cloud.google.com/marketplace/product/bigquery-public-data/gbif-occurrence) (BigQuery Public Data), more than 2 billions of records
- Additional dataset: List of the southern state of United State, used as a `seed` in `dbt`
- Additional dataset: ⭕


## Technical Description

### Tools and technologies

- Cloud - Google Cloud Platform
- IaaC - Terraform
- Containerization - Docker
- Orchestration - Mage
- Transformation - dbt
- Data Lake - Google Cloud Storage
- Data Warehouse - BigQuery
- Data Visualization - Apache Superset (Preset)

### Architecture


## Run this project from scratch

### Requirements

> [!NOTE] 
> You need to have Google Cloud SDK and Terraform installed on your local machine

Run those commands to be sure everything needed is running

```sh
gcloud --version
terraform --version
```

Connect to Google Cloud by doing :

```sh
gcloud init
```

### Setup a virtual machine on GCP with IaaC tools

1. Create a service account on GCP (_Google Cloud Platform_) with `gcloud`

```sh
gcloud iam service-accounts create monkey-wrench-runner --display-name="MW Service Account"
```

2. Give the service account proper permissions

```sh
gcloud projects add-iam-policy-binding monkey-wrench-418607 \
--member="serviceAccount:monkey-wrench-runner@monkey-wrench-418607.iam.gserviceaccount.com" \
--role='roles/storage.admin'

gcloud projects add-iam-policy-binding monkey-wrench-418607 \
--member="serviceAccount:monkey-wrench-runner@monkey-wrench-418607.iam.gserviceaccount.com" \
--role='roles/compute.admin'

gcloud projects add-iam-policy-binding monkey-wrench-418607 \
--member="serviceAccount:monkey-wrench-runner@monkey-wrench-418607.iam.gserviceaccount.com" \
--role='roles/bigquery.admin'
```

3. Download the credential file (JSON format)

```sh
gcloud iam service-accounts keys create ./gcp/keys/mw-creds.json --iam-account monkey-wrench-runner@monkey-wrench-418607.iam.gserviceaccount.com
```

4. create a file `secret.tfvars` to store the VM root password

> [!WARNING]
> do not commit this file !

```sh
echo 'vm_root_password = "<secret password here>" > ./terraform/secret.tfvars
```

5. Launch the creation of VM through `terraform`

```sh
terraform -chdir=terraform plan -var-file="secret.tfvars"
terraform -chdir=terraform apply -var-file="secret.tfvars"
```

6. Once created, connect to the VM with `gcloud`

```sh
gcloud compute ssh --zone "europe-north1-a" "monkey-wrench-vm" --project "monkey-wrench-418607"
```

`gcloud` will take care of creating the SSH key pair


9xxx.

Suspend the VM 
```sh
gcloud compute instances suspend monkey-wrench-vm
```

Resume (make it alive) VM :

```sh
gcloud compute instances resume monkey-wrench-vm
```

2. Create a project on GCP

2. Create GCP credentials with all the permissions needed, and copy the credentials `json` files in the directory `gcp\keys` and named the credentials `creds.json`. Those credentials will be used afterward by all the application that need to interact with GCP

3. Run terraform :
```sh
terraform -chdir=terraform fmt
terraform -chdir=terraform plan -var-file="secret.tfvars"
terraform -chdir=terraform apply -var-file="secret.tfvars"
```

terraform -chdir=terraform/staging fmt


ad_ip_address = "35.228.145.177"
