const { app, BrowserWindow, nativeImage } = require('electron');
const path = require('path');

function createWindow() {
  const win = new BrowserWindow({
    width: 1500,
    height: 900,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    },
    icon: path.join(__dirname, 'resources', 'notion-icon.png') // Fenster-Icon
  });

  win.loadURL('https://www.notion.so');
}

app.whenReady().then(() => {
  createWindow();

  // Spezielles Dock-Icon setzen (für GNOME, KDE, Cinnamon, macOS)
  const dockIcon = nativeImage.createFromPath(path.join(__dirname, 'resources', 'notion-icon.png'));
  if (app.dock) {
    app.dock.setIcon(dockIcon);
  }

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
