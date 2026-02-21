#!/bin/sh
# Script referência para desativar notificações do snapd-desktop-integration
# Não executa automaticamente; rodar manualmente se desejar aplicar novamente.

# 1) Desativa a checagem de tema (snap)
snap set snapd-desktop-integration theme-status-check=false 2>/dev/null || true

# 2) Desativa notificações via dconf (GNOME)
dconf write /org/gnome/desktop/notifications/application/snapd-desktop-integration-snapd-desktop-integration/enable false 2>/dev/null || true

# 3) Para e mascara o serviço de usuário (impede reinício)
systemctl --user stop snap.snapd-desktop-integration.snapd-desktop-integration.service 2>/dev/null || true
systemctl --user disable --now snap.snapd-desktop-integration.snapd-desktop-integration.service 2>/dev/null || true
systemctl --user mask snap.snapd-desktop-integration.snapd-desktop-integration.service 2>/dev/null || true

# Reverter:
# dconf write /org/gnome/desktop/notifications/application/snapd-desktop-integration-snapd-desktop-integration/enable true
# systemctl --user unmask --now snap.snapd-desktop-integration.snapd-desktop-integration.service
