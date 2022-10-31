FROM etalab/addok as addok
# Copy redis-server and redis.config
COPY --from=etalab/addok-redis /usr/local/bin/redis-server /usr/local/bin/redis-server
COPY --from=etalab/addok-redis /usr/local/etc/redis/redis.conf /usr/local/etc/redis/redis.conf
RUN sed -i 's/dir .\//dir \/data\//g' /usr/local/etc/redis/redis.conf
# Install dependencies
RUN apt-get update && \
    apt-get install -y supervisor zip && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# Addok bootstrap
RUN mkdir -p /etc/addok
RUN mkdir -p /data
ENV REDIS_HOST localhost

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
