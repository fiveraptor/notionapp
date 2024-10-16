#!/bin/bash

# Notion Electron App Uninstaller
APP_NAME="Notion"
APP_DIR="$HOME/$APP_NAME-app"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"
ICON_FILE="$HOME/.local/share/icons/$APP_NAME.png"
CONFIG_DIR="$HOME/.config/$APP_NAME"

# 1. Entfernen des Anwendungsverzeichnisses
if [ -d "$APP_DIR" ]; then
  echo "Entferne Anwendungsverzeichnis $APP_DIR..."
  rm -rf "$APP_DIR"
else
  echo "Das Anwendungsverzeichnis $APP_DIR wurde nicht gefunden."
fi

# 2. Entfernen der .desktop-Datei
if [ -f "$DESKTOP_FILE" ]; then
  echo "Entferne Menüeintrag $DESKTOP_FILE..."
  rm "$DESKTOP_FILE"
else
  echo "Die .desktop-Datei $DESKTOP_FILE wurde nicht gefunden."
fi

# 3. Entfernen des Icons
if [ -f "$ICON_FILE" ]; then
  echo "Entferne Icon $ICON_FILE..."
  rm "$ICON_FILE"
else
  echo "Das Icon $ICON_FILE wurde nicht gefunden."
fi

# 4. Entfernen des Konfigurationsordners
if [ -d "$CONFIG_DIR" ]; then
  echo "Entferne Konfigurationsordner $CONFIG_DIR..."
  rm -rf "$CONFIG_DIR"
else
  echo "Der Konfigurationsordner $CONFIG_DIR wurde nicht gefunden."
fi

# 5. Abschluss der Deinstallation
echo "$APP_NAME wurde erfolgreich deinstalliert."
