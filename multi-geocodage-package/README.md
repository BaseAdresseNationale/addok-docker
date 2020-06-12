# Addok-docker pour plusieurs sources de géocodage

1. Récupérer les sources 

- Pour BANO 
```
wget http://bano.openstreetmap.fr/data/full.sjson.gz
```

- Pour POI
```
wget https://www.data.gouv.fr/fr/datasets/r/46eff5e9-a409-4217-abcf-62c25630cd14
```

NB : la même méthode peut être utilisée pour d'autres sources de géocodage

2. Lancer le script run.sh dans le dossier build-package de ce repo avec les données nouvellement récupérées

NB : les fichiers sont au format json et pas ndjson comme la BAN, il faudra faire la modification au sein du script run.sh

3. Mettre vos données BAN, BANO, POI dans des répertoires spécifiques

```
mkdir addok-data-ban
mkdir addok-data-bano
mkdir addok-data-poi
mv PATH/TO/BUNDLE-BAN/DATA addok-data-ban
mv PATH/TO/BUNDLE-BANO/DATA addok-data-bano
mv PATH/TO/BUNDLE-POI/DATA addok-data-poi
```

Les bundles doivent contenir trois fichiers : addok.conf ; addok.db ; dump.rdb

4. Lancer docker-compose

```
docker-compose -f multi-geocodage-package/docker-compose-ban-bano-poi.yml up -d
```

NB : Vous pouvez mettre à l'échelle vos services en modifiant la plage de ports dans le fichier .yml et utiliser la commande docker-compose --scale

```
docker-compose -f docker-compose-ban-bano-poi.yml up --scale addok-ban=6 --scale addok-redis-ban=6 --scale addok-bano=3 --scale addok-redis-bano=3 --scale addok-poi=2 --scale addok-redis-poi=2 -d
```
