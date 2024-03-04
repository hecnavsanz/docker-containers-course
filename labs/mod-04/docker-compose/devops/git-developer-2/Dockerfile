FROM ubuntu:22.04 AS ubuntulinux

ENV container=docker
ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

# change root password
RUN echo -n 'root:CoreNetworks_4ALL' | chpasswd

# update the system and setup systemd
RUN apt-get update -y; \
    apt-get install -y systemd systemd-sysv; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*; \
    cd /lib/systemd/system/sysinit.target.wants/; \
    rm $(ls | grep -v systemd-tmpfiles-setup); \
    rm -f /lib/systemd/system/multi-user.target.wants/* \
          /etc/systemd/system/*.wants/* \
          /lib/systemd/system/local-fs.target.wants/* \
          /lib/systemd/system/sockets.target.wants/*udev* \
          /lib/systemd/system/sockets.target.wants/*initctl* \
          /lib/systemd/system/basic.target.wants/* \
          /lib/systemd/system/anaconda.target.wants/* \
          /lib/systemd/system/plymouth* \
          /lib/systemd/system/systemd-update-utmp*; \
    sed -i 's/exit.*/exit 0/g' /usr/sbin/policy-rc.d

# setup support for ssh, git and other tools
RUN echo "America/New_York" > /etc/timezone; \
    apt-get update -y; \
    yes | unminimize; \
    apt-get install openssh-server openssh-client sshpass git sudo net-tools iproute2 iputils-ping lsof unzip zip wget curl vim dialog apt-utils jq bat man man-db manpages pip python3.10-venv bat -y; \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1; \
    pip install virtualenv

# setup labs user and group
RUN groupadd core; \
    useradd --create-home -s /bin/bash -g core core; \
    echo -n 'core:CoreNetworks_4ALL' | chpasswd; \
    echo 'core ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/core; \
    chmod 440 /etc/sudoers.d/core; \
    mkdir -p /home/core/.ssh; \
    chmod 700 /home/core/.ssh; \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== core insecure public key" > /home/core/.ssh/authorized_keys; \
    chmod 600 /home/core/.ssh/authorized_keys; \
    sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers; \
    sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config; \
    mkdir -p /home/core/.local/bin; \
    ln -s /usr/bin/batcat /usr/local/bin/bat; \
    chown -R core:core /home/core; \
    rm -Rf /run/nologin

# initialize ssh
RUN systemctl enable ssh.service

# change working dir for root
WORKDIR /root

CMD ["/lib/systemd/systemd"]