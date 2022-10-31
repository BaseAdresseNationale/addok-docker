FROM python:3.10

RUN pip install cython addok==1.0.3 addok-fr==1.0.1 addok-france==1.1.3 addok-sqlite-store==1.0.1

COPY addok.conf /etc/addok/

ENV ADDOK_CONFIG_MODULE /etc/addok/addok.conf
ENV REDIS_HOST redis
ENV REDIS_PORT 6379
ENV REDIS_DB_INDEXES 0
ENV SQLITE_DB_PATH /data/addok.db

VOLUME ["/data"]

ENTRYPOINT ["addok"]
