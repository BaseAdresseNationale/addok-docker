#!/bin/bash

echo "> Réinitialisation de l'environnement docker"
docker-compose -f build-package/docker-compose-build.yml stop
docker-compose -f build-package/docker-compose-build.yml rm -f

echo "> Suppression des anciennes données"
sudo rm -Rf data/addok-data

echo "> Démarrage de Redis"
docker-compose -f build-package/docker-compose-build.yml up -d addok-importer-redis

echo "> Importation des données dans Redis"
gunzip -c data/*.ndjson.gz | docker-compose -f build-package/docker-compose-build.yml run addok-importer batch

echo "> Création des ngrams"
docker-compose -f build-package/docker-compose-build.yml run addok-importer ngrams

echo "> Écriture du dump de la base Redis et arrêt de l'instance"
docker-compose -f build-package/docker-compose-build.yml run addok-importer-redis-save

echo "> Démontage de l'environnement docker"
docker-compose -f build-package/docker-compose-build.yml stop
docker-compose -f build-package/docker-compose-build.yml rm -f

echo "> Copie de la configuration utilisée"
cp addok-importer/addok.conf dist/

echo "> Listing des fichiers produits"
ls -lh dist

echo "Terminé"
