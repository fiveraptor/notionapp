#!/bin/bash

# Notion Electron App Setup Script
APP_NAME="Notion"
APP_DIR="$HOME/$APP_NAME-app"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"
ICON_DIR="$HOME/.local/share/icons"
ICON_FILE="$ICON_DIR/$APP_NAME.png"
EXECUTABLE="$APP_DIR/Notion"
REPO_URL="https://github.com/fiveraptor/notionapp/releases/download/v0.2/Notion-linux-x64.tar.gz"

# 1. App-Verzeichnis erstellen
echo "Erstelle Anwendungsverzeichnis..."
if [ -d "$APP_DIR" ]; then
  echo "Das Verzeichnis $APP_DIR existiert bereits. Lösche altes Verzeichnis."
  rm -rf "$APP_DIR"
fi
mkdir -p "$APP_DIR"

# 2. Download der App
echo "Lade Notion App herunter..."
wget $REPO_URL -O NotionApp-linux-x64.tar.gz
tar -xzf NotionApp-linux-x64.tar.gz -C "$APP_DIR"
rm NotionApp-linux-x64.tar.gz

# 3. Icon-Verzeichnis erstellen und Icon kopieren
echo "Kopiere Icon..."
mkdir -p "$ICON_DIR"
cp "$APP_DIR/resources/app/resources/notion-icon.png" "$ICON_FILE"

# 4. Erstellen der .desktop-Datei
echo "Erstelle Menüeintrag..."
cat <<EOL > "$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=Unofficial Notion App for Linux
Exec=$EXECUTABLE
Icon=$ICON_FILE
Terminal=false
Type=Application
Categories=Utility;
EOL

# 5. Datei ausführbar machen
chmod +x "$DESKTOP_FILE"
chmod +x "$EXECUTABLE"

# 6. Installation abschließen
echo "$APP_NAME wurde erfolgreich installiert! Du kannst es nun aus dem Anwendungsmenü starten."
