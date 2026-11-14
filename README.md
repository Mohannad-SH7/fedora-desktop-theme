# Fedora GNOME Desktop Theme

Self-contained, user-level export of a Fedora GNOME desktop setup. The GTK
theme, red developer wallpaper, terminal palette, and Blur My Shell settings
are included in this repository; restore them with `./apply.sh`.

## Included settings and assets

- GNOME dark appearance with blue accent
- Nordic GTK theme and its upstream license
- Adwaita icons and Linux cursor theme
- Original red developer wallpaper (`wallpapers/red-developer.png`)
- Blur My Shell configuration, including blurred/translucent windows
- Nord palette for the default Ptyxis profile

The Windows Insider wallpaper currently used on the source desktop is not
redistributed here. This repository includes an original red wallpaper
instead.

## Requirements

- Fedora GNOME with `gsettings`, `dconf`, and `gnome-extensions`
- Blur My Shell extension installed and available
- Ptyxis terminal installed

The Nordic GTK theme is bundled under `themes/` and installed to your user
theme directory by the restore script. No package installation or
system-wide changes are performed.

## Restore

From the repository directory:

```sh
./apply.sh
```

The script copies the bundled GTK theme into `~/.themes`, applies the GNOME
appearance values, sets the bundled wallpaper, restores Blur My Shell's
preferences, and imports/selects the Nord Ptyxis palette.

## Files

- `apply.sh` — user-level restore script
- `settings/desktop.ini` — readable snapshot of GNOME and Ptyxis values
- `settings/blur-my-shell.dconf` — exported Blur My Shell preferences
- `palettes/Nord.palette` — Ptyxis palette definition
- `themes/Nordic-bluish-accent-standard-buttons/` — bundled Nordic theme
- `wallpapers/red-developer.svg` and `.png` — original wallpaper source and image

## Upstream theme

Nordic is distributed under GPL-3.0; its license is included with the theme.
The upstream project is [EliverLara/Nordic](https://github.com/EliverLara/Nordic).
