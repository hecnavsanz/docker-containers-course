ARG ML_VERSION

FROM ml-venv:$ML_VERSION

ARG ML_VERSION
ENV ML_VERSION=${ML_VERSION}

RUN mkdir /home/core/app

WORKDIR /home/core/app

COPY pkg-ver.py pkg-ver.py

COPY entrypoint.sh entrypoint.sh

CMD ["/bin/bash", "entrypoint.sh"]
