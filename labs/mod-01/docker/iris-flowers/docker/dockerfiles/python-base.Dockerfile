# Python Dockerfile

# global arguments (command-line)
ARG OS_IMAGE_TAG

FROM iris-flowers-ubuntu:${OS_IMAGE_TAG}
LABEL io.imagina.authors="imagina"
# local arguments (cmd-line)
ARG PYTHON_VERSION
# local environment variables (visible inside the container)
ENV PYTHON_VERSION=${PYTHON_VERSION}
ENV DEBIAN_FRONTEND=noninteractive
# install python with venv package
RUN apt-get update -y; \
    apt-get install python${PYTHON_VERSION}  python${PYTHON_VERSION}-venv -y; \
    update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 1

CMD ["/bin/bash"]
