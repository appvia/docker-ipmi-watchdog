#!/bin/bash

set -o errexit
set -o pipefail

# Configure timeout:
echo "watchdog-timeout = ${IPMI_WATCHDOG_TIMEOUT:-180}">/etc/watchdog.d/watchdog-timeout.conf

/usr/libexec/openipmi-helper start
/usr/sbin/watchdog --foreground --config-file /etc/watchdog.conf --verbose
