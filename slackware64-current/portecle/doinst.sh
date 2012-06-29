if [ -x "$(which update-desktop-database)" ]; then
  update-desktop-database -q usr/share/applications > /dev/null 2>&1
fi

if [ -x "$(which update-mime-database)" ]; then
  update-mime-database usr/share/mime > /dev/null 2>&1
fi

if [ -x "$(which gtk-update-icon-cache)" ]; then
  gtk-update-icon-cache  -f -q usr/share/icons/hicolor > /dev/null 2>&1
fi

