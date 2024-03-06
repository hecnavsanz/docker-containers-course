# ML Train and Evaluate Models (train models and choose best model)

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
# copy code contents: modules, train data and model evaluation python files
COPY code /home/${OSUSER}/code
COPY data/iris-train.csv /home/${OSUSER}/data/iris-train.csv
SHELL ["/bin/bash", "-c"]
RUN source /home/${OSUSER}/ml-${ML_VERSION}/bin/activate; \
    mkdir -p /home/${OSUSER}/results/csv /home/${OSUSER}/results/images /home/${OSUSER}/results/models; \
    python /home/${OSUSER}/code/evaluate-ml-models.py /home/${OSUSER}/data /home/${OSUSER}/results

CMD ["/bin/bash"]
