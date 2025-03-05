FROM ghcr.io/livebook-dev/livebook

ENV LIVEBOOK_LOG_LEVEL="error"

ENV LIVEBOOK_PORT=8080
EXPOSE 8080

ENV LIVEBOOK_DATA_PATH="/data"
ENV LIVEBOOK_HOME="/data"
USER root
RUN mkdir -p /data
RUN chmod 777 /data

COPY apps /apps
ENV LIVEBOOK_APPS_PATH="/apps"
ENV LIVEBOOK_APPS_PATH_WARMUP="manual"
RUN /app/bin/warmup_apps

# LIVEBOOK_PASSWORD