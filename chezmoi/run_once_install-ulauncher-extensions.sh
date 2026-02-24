#!/bin/bash
# Instala extensões do Ulauncher

ULAUNCHER_EXT_DIR="$HOME/.local/share/ulauncher/extensions"
mkdir -p "$ULAUNCHER_EXT_DIR"

declare -A EXTENSIONS=(
  ["com.github.iboyperson.ulauncher-system"]="https://github.com/iboyperson/ulauncher-system"
)

for name in "${!EXTENSIONS[@]}"; do
  url="${EXTENSIONS[$name]}"
  dest="$ULAUNCHER_EXT_DIR/$name"
  if [ ! -d "$dest" ]; then
    echo "Clonando $name..."
    git clone "$url" "$dest" 2>/dev/null || true
  fi
done

echo "Extensões Ulauncher configuradas."
