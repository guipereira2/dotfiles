#!/bin/bash
# Instala TPM e plugins do tmux

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
  echo "Instalando TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Instala plugins via TPM
if [ -f "$TPM_DIR/bin/install_plugins" ]; then
  "$TPM_DIR/bin/install_plugins"
fi

echo "Plugins tmux configurados."
