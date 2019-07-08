#!/bin/bash

if [ ! -f /etc/addok/addok.conf ]; then
  echo "Addok config file not found!"
  exit 1
fi

cp /etc/addok/addok.conf /etc/addok/addok.patched.conf
echo "SQLITE_DB_PATH = '/data/addok.db'" >> /etc/addok/addok.patched.conf

echo "LOG_DIR = '/logs'" >> /etc/addok/addok.patched.conf

if [ "$LOG_QUERIES" = "1" ]; then
  echo Will log queries
  echo "LOG_QUERIES = True" >> /etc/addok/addok.patched.conf
fi

if [ "$LOG_NOT_FOUND" = "1" ]; then
echo Will log Not Found
  echo "LOG_NOT_FOUND = True" >> /etc/addok/addok.patched.conf
fi

if [ ! -z "$SLOW_QUERIES" ]; then
  echo Will log slow queries
  echo "SLOW_QUERIES = ${SLOW_QUERIES}" >> /etc/addok/addok.patched.conf
fi

cat /etc/addok/addok.patched.conf

WORKERS=${WORKERS:-1}
WORKER_TIMEOUT=${WORKER_TIMEOUT:-30}
gunicorn --worker-tmp-dir /dev/shm -w $WORKERS --timeout $WORKER_TIMEOUT -b 0.0.0.0:7878 --access-logfile - --log-file - addok.http.wsgi
