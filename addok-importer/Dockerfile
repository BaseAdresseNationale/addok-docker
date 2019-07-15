FROM python:3.6

RUN pip install cython addok==1.0.2 addok-fr==1.0.1 addok-france==1.1.0 addok-sqlite-store==1.0.0

COPY addok.conf /etc/addok/
RUN echo "SQLITE_DB_PATH = '/data/addok.db'" >> /etc/addok/addok.conf

ENV ADDOK_CONFIG_MODULE /etc/addok/addok.conf
ENV REDIS_HOST redis
ENV REDIS_PORT=6379
ENV REDIS_DB_INDEXES=0

VOLUME ["/data"]

ENTRYPOINT ["addok"]
