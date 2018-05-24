# docker ipmi watchdog

Allows a hardware watchdog to be enabled and configured on CoreOS or anywhere
where rkt or docker can run.

## Pre-requisites

The kernal modules will need to be loaded:
`/usr/sbin/modprobe ipmi_devintf ipmi_si ipmi_msghandler`
`/usr/sbin/modprobe ipmi_watchdog`

## Usage

See `watchdog.service` for an example service file for CoreOS.

### Variables

`IPMI_WATCHDOG_TIMEOUT` - value for timeout in seconds.

## Options

Watchdog parameters can be provided as parameters to container: see [man watchdog](https://linux.die.net/man/8/watchdog).
