#!/bin/bash
set -e

# Remove o arquivo de PID do servidor se existir
rm -f /myapp/tmp/pids/server.pid

# Executa o comando passado (ex: rails server)
exec "$@"
