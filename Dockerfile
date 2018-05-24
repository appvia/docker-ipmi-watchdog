FROM fedora:28
RUN dnf upgrade -y -q && dnf clean all
RUN dnf install -y OpenIPMI ipmitool watchdog && dnf clean all
RUN dnf install -y procps
RUN sed -i 's/IPMI_WATCHDOG=no/IPMI_WATCHDOG=yes/g' /etc/sysconfig/ipmi

# This interface is now included in the kernel and will fail if not disabled
RUN sed -i "s/IPMI_SI=yes/IPMI_SI=no/g" /etc/sysconfig/ipmi

ADD . /
ENTRYPOINT ["/entrypoint.sh"]
