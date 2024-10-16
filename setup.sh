#!/bin/bash

# Notion Electron App Setup Script
APP_NAME="Notion"
APP_DIR="$HOME/$APP_NAME-app"
DESKTOP_FILE="$HOME/.local/share/applications/$APP_NAME.desktop"
ICON_DIR="$HOME/.local/share/icons"
ICON_FILE="$ICON_DIR/$APP_NAME.png"
EXECUTABLE="$APP_DIR/Notion"
GITHUB_REPO="fiveraptor/notionapp"

# 1. Create application directory
echo "Creating application directory..."
if [ -d "$APP_DIR" ]; then
  echo "The directory $APP_DIR already exists. Removing the old directory."
  rm -rf "$APP_DIR"
fi
mkdir -p "$APP_DIR"

# 2. Fetch the latest release URL from GitHub
echo "Looking for the latest version of $APP_NAME..."
API_URL="https://api.github.com/repos/$GITHUB_REPO/releases/latest"
DOWNLOAD_URL=$(curl -s $API_URL | grep "browser_download_url" | grep "Notion-linux-x64.tar.gz" | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
  echo "Error: Could not retrieve the latest version."
  exit 1
fi

# 3. Download the app
echo "Downloading the latest version of $APP_NAME..."
wget $DOWNLOAD_URL -O NotionApp-linux-x64.tar.gz
tar -xzf NotionApp-linux-x64.tar.gz -C "$APP_DIR"
rm NotionApp-linux-x64.tar.gz

# 4. Create icon directory and copy icon
echo "Copying icon..."
mkdir -p "$ICON_DIR"
cp "$APP_DIR/resources/app/resources/notion-icon.png" "$ICON_FILE"

# 5. Create the .desktop file for menu entry
echo "Creating menu entry..."
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

# 6. Make the file executable
chmod +x "$DESKTOP_FILE"
chmod +x "$EXECUTABLE"

# 7. Finish the installation
echo "$APP_NAME has been successfully installed! You can now launch it from the application menu."
