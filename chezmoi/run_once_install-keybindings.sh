#!/bin/bash
# Restaura atalhos de teclado personalizados
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$SCRIPT_DIR/keybindings-media-keys.dconf"
dconf load /org/gnome/desktop/wm/keybindings/ < "$SCRIPT_DIR/keybindings-wm.dconf"
