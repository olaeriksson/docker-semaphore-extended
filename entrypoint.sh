#!/bin/sh

set -e

# Start syslogd if target is configured
if ! [ -z "${SYSLOG_TARGET}" ]; then
	/sbin/syslogd -R ${SYSLOG_TARGET}
fi

# Start semaphore-wrapper from parent image, as semaphore user
su -p -c "/usr/local/bin/semaphore-wrapper /usr/local/bin/semaphore --config /etc/semaphore/config.json service" semaphore
