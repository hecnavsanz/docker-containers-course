FROM rockylinux:9 AS rockylinux

# change root password
RUN echo -n 'root:CoreNetworks_4ALL' | chpasswd

# update the system and setup systemd support
RUN dnf update -y; \
    dnf clean all; \
    dnf install systemd systemd-libs initscripts -y

WORKDIR /lib/systemd/system/sysinit.target.wants/

RUN ( for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done ); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    rm -f /usr/lib/tmpfiles.d/systemd-nologin.conf

# setup support for ssh, git and other os utilities and developer tools (python)
RUN mv /etc/localtime /etc/localtime.OLD; \
    ln -s /usr/share/zoneinfo/America/New_York /etc/localtime; \
    dnf install openssh-server openssh-clients git sudo hostname net-tools iputils which lsof unzip zip wget binutils vim man-db man-pages -y; \
    dnf install epel-release -y; \
    crb enable; \
    dnf install bat -y

# setup labs user and group
RUN groupadd core; \
    useradd --create-home -s /bin/bash -g core core; \
    echo -n 'core:CoreNetworks_4ALL' | chpasswd; \
    echo -e "\n# core aliases\nalias sudoj='sudo -u jenkins sh -c '\nalias sudojs='sudo -u jenkins-ssh sh -c '" >> /home/core/.bash_profile; \
    echo 'core ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/core; \
    chmod 440 /etc/sudoers.d/core; \
    mkdir -p /home/core/.ssh; \
    chmod 700 /home/core/.ssh; \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== core insecure public key" > /home/core/.ssh/authorized_keys; \
    chmod 600 /home/core/.ssh/authorized_keys; \
    sed -i -e 's/Defaults.*requiretty/#&/' /etc/sudoers; \
    sed -i -e 's/^#UsePAM/UsePAM/g' /etc/ssh/sshd_config; \
    chown -R core:core /home/core; \
    ln -s /usr/bin/batcat /usr/local/bin/bat; \
    rm -Rf /run/nologin

# initialize ssh
RUN systemctl enable sshd.service; \
    touch /etc/sysconfig/network

# change working dir for root
WORKDIR /root

CMD ["/usr/sbin/init"]