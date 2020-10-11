#!/usr/local/bin/bash

set -e

source ~/.nvm/nvm.sh && npm install && npm run dev &

tail -f /dev/null
