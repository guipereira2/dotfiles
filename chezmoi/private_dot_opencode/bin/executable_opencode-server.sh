#!/bin/bash
# Inicia opencode server (4096) + proxy (4095)
cd /home/gui

# Inicia proxy em background se ainda não estiver rodando
if ! lsof -ti:4095 >/dev/null 2>&1; then
    nohup /home/gui/miniconda3/bin/python3 /home/gui/.opencode/bin/opencode-proxy.py 4095 >> /tmp/opencode-proxy.log 2>&1 &
    sleep 1
fi

exec /home/gui/.opencode/bin/opencode serve --port 4096 "$@"
