

SELECT a.*, b.UNIT_CODE, b.UNIT_NAME
FROM `mw_dataset.gbif_us_dataset` a, `mw_dataset.us_national_parks` b 
WHERE ST_CONTAINS(b.geometry, ST_GEOGPOINT(a.decimallongitude, a.decimallatitude))