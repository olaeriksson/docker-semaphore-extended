FROM ansiblesemaphore/semaphore:v2.8.31

USER root
RUN apk add --no-cache -U rsync

USER 1001

CMD ["/usr/local/bin/semaphore-wrapper", "/usr/local/bin/semaphore", "--config", "/etc/semaphore/config.json", "service"]
