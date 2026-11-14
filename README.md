# Fedora GNOME Desktop Theme

User-level backup of this Fedora GNOME desktop configuration. It records the
dark GNOME appearance, Nordic GTK theme, Adwaita icons, Blur My Shell settings,
and Nord palette for Ptyxis.

## Requirements

- Fedora Workstation with GNOME, `gsettings`, and `dconf`
- Blur My Shell GNOME Shell extension
- Ptyxis terminal
- Nordic GTK theme installed at
  `~/.themes/Nordic-bluish-accent-standard-buttons`
- The red Windows Insider wallpaper available at
  `~/Downloads/windows-insider-4000x4000-27655.png`

The GTK theme is available from
[EliverLara/Nordic](https://github.com/EliverLara/Nordic/releases). Install it
for your user; this repository does not install packages or make system-wide
changes.

## Apply the settings

After meeting the requirements above, run:

```sh
./apply.sh
```

The script applies the GNOME settings, restores Blur My Shell's exported
preferences, imports the Nord Ptyxis palette, and selects it for the default
Ptyxis profile.

## Publish to GitHub

This folder is already a local Git repository. After installing and
authenticating GitHub CLI, create the public repository and push it with:

```sh
git commit -m "Add desktop theme backup"
gh repo create fedora-desktop-theme --public --source=. --push
```

## Wallpaper

The wallpaper setting points to the image in `~/Downloads`. The image is not
included here: it appears to be Windows Insider artwork, so this public
configuration repository does not redistribute it. Use a copy you are
authorized to use at the path above, or edit the wallpaper path in `apply.sh`.

## Exported files

- `settings/desktop.ini` — appearance values and wallpaper path
- `settings/blur-my-shell.dconf` — Blur My Shell preferences
- `palettes/Nord.palette` — custom Nord terminal palette
- `apply.sh` — user-level restore script
