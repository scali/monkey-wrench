-- Docs: https://docs.mage.ai/guides/sql-blocks

-- Create a sub dataset for US from global dataset
CREATE OR REPLACE TABLE `mw_dataset.gbif_us_dataset` AS
SELECT species, eventdate, individualcount, decimallatitude, decimallongitude, stateprovince
FROM `bigquery-public-data.gbif.occurrences`
WHERE countrycode = 'US' AND occurrencestatus = 'PRESENT'
  AND decimallatitude IS NOT NULL AND decimallongitude IS NOT NULL