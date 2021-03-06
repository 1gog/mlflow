#!/usr/bin/env bash

set -e

FWDIR="$(cd "`dirname $0`"; pwd)"
cd "$FWDIR"

pycodestyle --max-line-length=100 --exclude mlflow/protos,mlflow/server/js,mlflow/alembic -- mlflow tests
pylint --msg-template="{path} ({line},{column}): [{msg_id} {symbol}] {msg}" --rcfile="$FWDIR/pylintrc" -- mlflow tests

rstcheck README.rst
