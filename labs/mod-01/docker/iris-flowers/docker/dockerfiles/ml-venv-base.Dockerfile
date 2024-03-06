# Python Virtual Environment with ML Packages Dockerfile

# global arguments (command-line)
ARG PYTHON_IMAGE_TAG

FROM iris-flowers-python:${PYTHON_IMAGE_TAG}
# local arguments (not cmd-line)
ARG OSUSER="imagina"
# local arguments (cmd-line)
ARG ML_VERSION
# local environment variables (visible inside the container)
ENV ML_VERSION=${ML_VERSION}
## from here as normal user
USER ${OSUSER}
# create python venv and install ml packages
RUN mkdir -p /home/${OSUSER}/ml-${ML_VERSION}
COPY code/requirements/requirements-${ML_VERSION}.txt /home/${OSUSER}/ml-${ML_VERSION}/requirements.txt
COPY code/ml-pkg-ver.py /home/${OSUSER}/ml-${ML_VERSION}/ml-pkg-ver.py
SHELL ["/bin/bash", "-c"]
RUN python -m venv --prompt ML-${ML_VERSION} /home/${OSUSER}/ml-${ML_VERSION}; \
    source /home/${OSUSER}/ml-${ML_VERSION}/bin/activate; \
    pip install -r /home/${OSUSER}/ml-${ML_VERSION}/requirements.txt --no-cache-dir; \
    python /home/${OSUSER}/ml-${ML_VERSION}/ml-pkg-ver.py

CMD ["/bin/bash"]
