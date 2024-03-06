# ML Predict using Best Model (use best model and predict on test data)

# global arguments (command-line)
ARG ML_IMAGE_TAG

FROM iris-flowers-ml-venv:${ML_IMAGE_TAG}
# local arguments (not cmd-line)
ARG OSUSER="imagina"
# local arguments (cmd-line)
ARG ML_IMAGE_TAG
# local environment variables (visible inside the container)
ENV ML_VERSION=${ML_IMAGE_TAG}
# from here as normal user
USER ${OSUSER}
# create python venv and install ml packages
RUN mkdir -p /home/${OSUSER}/ml-${ML_VERSION}
# copy code contents: test data and prediction python files
COPY code /home/${OSUSER}/code
COPY data/iris-test.csv /home/${OSUSER}/data/iris-test.csv
SHELL ["/bin/bash", "-c"]
RUN source /home/${OSUSER}/ml-${ML_VERSION}/bin/activate; \
    mkdir -p /home/${OSUSER}/results/csv /home/${OSUSER}/results/images /home/${OSUSER}/results/models; \
    python /home/${OSUSER}/code/evaluate-ml-models.py /home/${OSUSER}/data /home/${OSUSER}/results

CMD ["/bin/bash"]

CMD ["/bin/bash"]
