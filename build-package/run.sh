#!/bin/bash

echo "> Création du répertoire de travail"
mkdir -p dist

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

echo "> Préparation de l'archive"
zip -j dist/prebuilt-bundle.zip dist/addok.db dist/dump.rdb addok-importer/addok.conf

echo "> Nettoyage"
sudo rm -f dist/addok.db && sudo rm -f dist/dump.rdb

echo "Terminé"
