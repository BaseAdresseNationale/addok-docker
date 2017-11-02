FROM python:3.6

RUN pip install cython addok==1.0.2 addok-fr==1.0.1 addok-france==1.1.0 addok-csv==1.0.1 addok-sqlite-store==1.0.0 gunicorn

ENV ADDOK_CONFIG_MODULE /etc/addok/addok.patched.conf
ENV REDIS_HOST redis
ENV REDIS_PORT=6379
ENV REDIS_DB_INDEXES=0

COPY docker-entrypoint.sh /bin

VOLUME ["/data"]
EXPOSE 7878

CMD docker-entrypoint.sh
