#!/usr/bin/env bash

USE_PRE_INDEXED_DATA_URL=https://adresse.data.gouv.fr/data/ban/adresses/latest/addok/addok-france-bundle.zip

if [[ -z $PRE_INDEXED_DATA_URL ]]; then
    echo "PRE_INDEXED_DATA_URL environment variable is not set. ${USE_PRE_INDEXED_DATA_URL} will be used as pre-indexed data."
else
  echo "PRE_INDEXED_DATA_URL environment variable set. ${PRE_INDEXED_DATA_URL} will be used as pre-indexed data."
  USE_PRE_INDEXED_DATA_URL=$PRE_INDEXED_DATA_URL
fi

echo "Downloading pre-indexed data from ${USE_PRE_INDEXED_DATA_URL}"
wget -q $USE_PRE_INDEXED_DATA_URL -O /tmp/addok-pre-indexed-data.zip
echo "Unzipping pre-indexed data"
unzip -d /tmp/addok-pre-indexed-data /tmp/addok-pre-indexed-data.zip
echo "Moving pre-indexed data to the right place"
mv /tmp/addok-pre-indexed-data/addok.conf /etc/addok/addok.conf
mv /tmp/addok-pre-indexed-data/addok.db /data/addok.db
mv /tmp/addok-pre-indexed-data/dump.rdb /data/dump.rdb

/usr/bin/supervisord