# docker-semaphore-extended
This is an extended docker image for Ansible Semaphore.

It adds packages required by some roles from Ansible Galaxy and
extends the image with some new features.

Currently adding the following packages to the standard image:

	* bash
	* rpm
	* rsync
	* rclone
	* samba-client
	* ilorest
	* py3-lxml

The following enhancements are added:
	* Enable syslog to remote host

SYSLOG
Logging to a remote syslog server can be enabled by defining the
following ENV:

	SYSLOG_TARGET=address[:port]

This will start a syslogd daemon within the container that will
forward all syslog messages to the remote syslog service. This
can be used to, for example, log important progress from a playbook
using the community.general.syslogger module.
