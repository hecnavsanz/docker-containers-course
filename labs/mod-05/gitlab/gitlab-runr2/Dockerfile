FROM ubuntu:22.04 AS ubuntulinux

ENV container=docker
ENV LC_ALL=C
ENV DEBIAN_FRONTEND=noninteractive

# change root password
RUN echo -n 'root:S1mpl3-S3c4r3' | chpasswd

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
    apt-get install openssh-server openssh-client git-all sudo net-tools iproute2 iputils-ping lsof unzip wget vim dialog apt-utils jq bat curl -y

# setup labs user and group
RUN groupadd pipe2; \
    useradd --create-home -s /bin/bash -g pipe2 pipe2; \
    echo -n 'pipe2:S1mpl3-S3c4r3' | chpasswd; \
    echo 'pipe2 ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/pipe2; \
    chmod 440 /etc/sudoers.d/pipe2; \
    mkdir -p /home/pipe2/.ssh; \
    chmod 700 /home/pipe2/.ssh; \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== pipe2 insecure public key" > /home/pipe2/.ssh/authorized_keys; \
    chmod 600 /home/pipe2/.ssh/authorized_keys; \
    sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers; \
    sed -i -e 's/\(UsePAM \)yes/\1 no/' /etc/ssh/sshd_config; \
    mkdir -p /home/pipe2/.local/bin; \
    ln -s /usr/bin/batcat /usr/local/bin/bat; \
    chown -R pipe2:pipe2 /home/pipe2; \
    rm -Rf /run/nologin

# initialize ssh
RUN systemctl enable ssh.service

# change working dir for root
WORKDIR /root

CMD ["/lib/systemd/systemd"]