#!/bin/bash

# Notion Electron App Uninstaller
APP_NAME="Notion"
APP_DIR="$HOME/$APP_NAME-app"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"
ICON_FILE="$HOME/.local/share/icons/$APP_NAME.png"
CONFIG_DIR="$HOME/.config/$APP_NAME"

# 1. Remove the application directory
if [ -d "$APP_DIR" ]; then
  echo "Removing application directory $APP_DIR..."
  rm -rf "$APP_DIR"
else
  echo "The application directory $APP_DIR was not found."
fi

# 2. Remove the .desktop file (menu entry)
if [ -f "$DESKTOP_FILE" ]; then
  echo "Removing menu entry $DESKTOP_FILE..."
  rm "$DESKTOP_FILE"
else
  echo "The .desktop file $DESKTOP_FILE was not found."
fi

# 3. Remove the icon
if [ -f "$ICON_FILE" ]; then
  echo "Removing icon $ICON_FILE..."
  rm "$ICON_FILE"
else
  echo "The icon $ICON_FILE was not found."
fi

# 4. Remove the configuration folder
if [ -d "$CONFIG_DIR" ]; then
  echo "Removing configuration folder $CONFIG_DIR..."
  rm -rf "$CONFIG_DIR"
else
  echo "The configuration folder $CONFIG_DIR was not found."
fi

# 5. Complete the uninstallation
echo "$APP_NAME has been successfully uninstalled."
