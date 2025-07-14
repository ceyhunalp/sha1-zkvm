#!/bin/bash

set -eou pipefail

if [ $# -lt 2 ]; then
	echo "Usage: $0 <size> <-c|-g>"
	exit 1
fi

size=$1
proof_mode=$2
input="../blobs/sha1-${size}.input"

cd program; cargo prove build
cd ../script
if [ "$proof_mode" == "-g" ]; then
	log_out="../logs/sha1-groth-${size}.log"
	RUST_LOG=error SP1_PROVER=cuda cargo run --release -- --prove --groth --input "$input" > "$log_out"
else
	log_out="../logs/sha1-compressed-${size}.log"
	RUST_LOG=error SP1_PROVER=cuda cargo run --release -- --prove --input "$input" > "$log_out"
fi
