#!/bin/bash
# Instala extensões do GNOME Shell via gerenciador de extensões

EXTENSIONS=(
  "rounded-window-corners@fxgn"
  "user-theme@gnome-shell-extensions.gcampax.github.com"
  "hidetopbar@mathieu.bidon.ca"
  "just-perfection-desktop@just-perfection"
  "overviewbackground@github.com.orbitcorrection"
  "transparent-top-bar@ftpix.com"
  "tophat@fflewddur.github.io"
  "openbar@neuromorph"
)

if command -v gnome-extensions &> /dev/null; then
  for ext in "${EXTENSIONS[@]}"; do
    if [ ! -d "$HOME/.local/share/gnome-shell/extensions/$ext" ]; then
      echo "Instalando $ext..."
      busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s "$ext" 2>/dev/null || true
    fi
  done
  echo "Extensões GNOME configuradas."
else
  echo "gnome-extensions não encontrado, pulando."
fi
