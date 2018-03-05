FROM fedora:27
RUN dnf upgrade -y -q && dnf clean all
RUN dnf install -y OpenIPMI ipmitool watchdog && dnf clean all
RUN dnf install -y procps
RUN sed -i 's/IPMI_WATCHDOG=no/IPMI_WATCHDOG=yes/g' /etc/sysconfig/ipmi
ADD . /
ENTRYPOINT ["/entrypoint.sh"]
