#!/bin/bash
# Desativa notificações do desktop integration do snap
gsettings set org.gnome.desktop.notifications.application:/org/gnome/desktop/notifications/application/snap-store/ enable false 2>/dev/null || true
