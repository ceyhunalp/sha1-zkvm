#!/bin/bash

set pipefail -eou

mkdir -p sha1-zkvm/logs

./run-sha1-zkvm.sh 1k -c
./run-sha1-zkvm.sh 10k -c
./run-sha1-zkvm.sh 100k -c
./run-sha1-zkvm.sh 1m -c
./run-sha1-zkvm.sh 10m -c
