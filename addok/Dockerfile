FROM python:3.10

RUN pip install cython addok==1.0.3 addok-fr==1.0.1 addok-france==1.1.3 addok-csv==1.0.1 addok-sqlite-store==1.0.1 gunicorn==20.1.0

ENV ADDOK_CONFIG_MODULE /etc/addok/addok.patched.conf
ENV REDIS_HOST redis
ENV REDIS_PORT 6379
ENV REDIS_DB_INDEXES 0
ENV SQLITE_DB_PATH /data/addok.db

COPY docker-entrypoint.sh /bin

VOLUME ["/data"]
EXPOSE 7878

CMD docker-entrypoint.sh
