# Ubuntu Dockerfile

# global arguments (command-line)
ARG UBUNTU_RELEASE

FROM ubuntu:${UBUNTU_RELEASE}
LABEL io.imagina.authors="imagina"
# local arguments (not cmd-line)
ARG OSUSER="imagina"
# local environment variables (visible inside the container)
ENV OSUSER=${OSUSER}
# install python with venv (3.10) and create imagina user
RUN apt-get update -y; \
    groupadd ${OSUSER}; \
    useradd --create-home -s /usr/bin/bash -g ${OSUSER} ${OSUSER}; \
    mkdir -p /home/${OSUSER}/data /home/${OSUSER}/results; \
    chown -R ${OSUSER}:${OSUSER} /home/${OSUSER}

CMD ["/bin/bash"]
