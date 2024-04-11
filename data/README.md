# Data

For the sake of the project, we suppose this data directory is a data source repository

## US National Parks bounds

We use is dataset primarly :

https://raw.githubusercontent.com/nationalparkservice/data/gh-pages/base_data/boundaries/parks/parks-bounds.geojson

and we transform it from `geojson` to `geojsonl` by doing :

```sh
cat parks-bounds.geojson | jq -c '.features[]' > parks-bounds.geojsonl
```

> [!NOTE]
> We could implement it in ``mage` with `Fiona` python library https://github.com/Toblerity/Fiona
> Not tested in the scope of this project
