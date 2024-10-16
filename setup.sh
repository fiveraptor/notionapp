#!/bin/bash

# Notion Electron App Setup Script
APP_NAME="Notion"
APP_DIR="$HOME/$APP_NAME-app"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"
ICON_DIR="$HOME/.local/share/icons"
ICON_FILE="$ICON_DIR/$APP_NAME.png"
EXECUTABLE="$APP_DIR/Notion"
GITHUB_REPO="fiveraptor/notionapp"

# 1. App-Verzeichnis erstellen
echo "Erstelle Anwendungsverzeichnis..."
if [ -d "$APP_DIR" ]; then
  echo "Das Verzeichnis $APP_DIR existiert bereits. Lösche altes Verzeichnis."
  rm -rf "$APP_DIR"
fi
mkdir -p "$APP_DIR"

# 2. Neueste Release-URL von GitHub abrufen
echo "Suche nach der neuesten Version von $APP_NAME..."
API_URL="https://api.github.com/repos/$GITHUB_REPO/releases/latest"
DOWNLOAD_URL=$(curl -s $API_URL | grep "browser_download_url" | grep "Notion-linux-x64.tar.gz" | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
  echo "Fehler: Konnte die neueste Version nicht abrufen."
  exit 1
fi

# 3. Download der App
echo "Lade die neueste Version von $APP_NAME herunter..."
wget $DOWNLOAD_URL -O NotionApp-linux-x64.tar.gz
tar -xzf NotionApp-linux-x64.tar.gz -C "$APP_DIR"
rm NotionApp-linux-x64.tar.gz

# 4. Icon-Verzeichnis erstellen und Icon kopieren
echo "Kopiere Icon..."
mkdir -p "$ICON_DIR"
cp "$APP_DIR/resources/app/resources/notion-icon.png" "$ICON_FILE"

# 5. Erstellen der .desktop-Datei
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

# 6. Datei ausführbar machen
chmod +x "$DESKTOP_FILE"
chmod +x "$EXECUTABLE"

# 7. Installation abschließen
echo "$APP_NAME wurde erfolgreich installiert! Du kannst es nun aus dem Anwendungsmenü starten."
