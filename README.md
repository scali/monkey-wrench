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

1. Create a google cloud platform account on GCP

2. Create GCP credentials with all the permissions needed, and copy the credentials `json` files in the directory `gcp\keys` and named the credentials `creds.json`. Those credentials will be used afterward by all the application that need to interact with GCP



