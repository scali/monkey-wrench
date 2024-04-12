-- Docs: https://docs.mage.ai/guides/sql-blocks


CREATE OR REPLACE EXTERNAL TABLE `mw_dataset.us_national_parks`
OPTIONS (
  format = 'NEWLINE_DELIMITED_JSON',
  json_extension = 'GEOJSON',
  uris = ['gs://mw_bucket/parks-bounds.geojsonl']
);