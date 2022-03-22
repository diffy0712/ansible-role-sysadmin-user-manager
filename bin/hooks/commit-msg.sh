#!/usr/bin/bash
make lint
head -1 "$1" | tee | commitlint