#!/bin/bash

chmod a+x /inference/1.getFB40/bin/HCopy

cd  /inference/1.getFB40/ && chmod a+x run.sh && ./run.sh

# use ./models/model9.model,modify in /inference/2.inferenceLSTM/inference.py
cd /inference/2.inferenceLSTM/ && chmod a+x  run.sh && ./run.sh
