#!/bin/bash

set pipefail -eou

mkdir -p sha1-zkvm/logs

./run-sha1-zkvm.sh 1k -c
./run-sha1-zkvm.sh 10k -c
./run-sha1-zkvm.sh 100k -c
./run-sha1-zkvm.sh 1m -c
./run-sha1-zkvm.sh 10m -c

./run-sha1-zkvm.sh 1k -g
./run-sha1-zkvm.sh 10k -g
./run-sha1-zkvm.sh 100k -g
./run-sha1-zkvm.sh 1m -g
./run-sha1-zkvm.sh 10m -g
