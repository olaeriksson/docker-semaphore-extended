FROM ansiblesemaphore/semaphore:v2.8.53

USER root
RUN apk add --no-cache -U bash rsync rclone samba-client

USER 1001

CMD ["/usr/local/bin/semaphore-wrapper", "/usr/local/bin/semaphore", "--config", "/etc/semaphore/config.json", "service"]
