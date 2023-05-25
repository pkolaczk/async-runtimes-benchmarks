#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

ghcid \
  --command="stack ghci --ghci-options='+RTS -N'" \
  --test=main \
  --restart coroutines.cabal \
  --restart stack.yaml \
  --restart stack.yaml.lock
