FROM semaphoreui/semaphore:v2.8.90

# Settings
ENV ILOREST_VERSION=3.5.1.0-8


# Add packages
USER root
RUN apk add --no-cache -U bash rsync rclone samba-client rpm py3-lxml py3-dnspython

# Install ilorest manually
RUN \
	mkdir -p /tmp/ilorest && \
	wget -P /tmp/ilorest https://downloads.linux.hpe.com/SDR/repo/ilorest/current/ilorest-${ILOREST_VERSION}.x86_64.rpm && \
	cd /tmp/ilorest ; rpm2cpio ilorest-3.5.1.0-8.x86_64.rpm | cpio -idmv && \
	cp -p /tmp/ilorest/usr/sbin/ilorest /usr/sbin && \
	mkdir -p /usr/lib64 && \
	cp -p /tmp/ilorest/usr/lib64/ilorest_chif.so /usr/lib64/ && \
	cp -Rp /tmp/ilorest/etc/ilorest /etc/ && \
	rm -rf /tmp/ilorest

# Add entrypoint script
COPY entrypoint.sh /

# Go Go Go
CMD ["/bin/sh", "/entrypoint.sh"]
