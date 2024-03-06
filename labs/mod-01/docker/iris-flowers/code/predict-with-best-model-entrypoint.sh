#!/usr/bin/env bash

source /home/${OSUSER}/ml-${ML_VERSION}/bin/activate
mkdir -p /home/${OSUSER}/results/csv /home/${OSUSER}/results/images /home/${OSUSER}/results/models
python /home/${OSUSER}/code/evaluate-ml-models.py /home/${OSUSER}/data /home/${OSUSER}/results
