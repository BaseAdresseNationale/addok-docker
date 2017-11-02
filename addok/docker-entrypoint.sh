#!/bin/sh

if [ ! -f /etc/addok/addok.conf ]; then
  echo "Addok config file not found!"
  exit 1
fi

cp /etc/addok/addok.conf /etc/addok/addok.patched.conf
echo "SQLITE_DB_PATH = '/data/addok.db'" >> /etc/addok/addok.patched.conf

gunicorn -b 0.0.0.0:7878 addok.http.wsgi
