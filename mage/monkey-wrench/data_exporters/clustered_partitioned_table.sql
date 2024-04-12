-- Docs: https://docs.mage.ai/guides/sql-blocks

-- Partition by eventdate
-- Cluster by stateprovince

CREATE OR REPLACE TABLE `mw_dataset.national_parks_occurences_partitioned_clustered`
PARTITION BY DATETIME_TRUNC(eventdate, year)
CLUSTER BY unit_name AS (
  SELECT * FROM `mw_dataset.national_parks_occurences`
);