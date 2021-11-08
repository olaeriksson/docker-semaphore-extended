FROM ansiblesemaphore/semaphore:v2.8.18

USER root
RUN apk add --no-cache -U rsync

USER 1001
