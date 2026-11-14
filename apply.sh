#!/usr/bin/env bash
set -euo pipefail

blur_extension="blur-my-shell@aunetx"
blur_schema_dir="$HOME/.local/share/gnome-shell/extensions/$blur_extension/schemas"
repo_dir="$(cd -- "$(dirname -- "$0")" && pwd)"
theme_source="$repo_dir/themes/Nordic-bluish-accent-standard-buttons"
theme_target="$HOME/.themes/Nordic-bluish-accent-standard-buttons"
wallpaper="$repo_dir/wallpapers/red-developer.png"

die() {
    printf 'Error: %s\n' "$*" >&2
    exit 1
}

command -v gsettings >/dev/null || die "gsettings is required"
command -v dconf >/dev/null || die "dconf is required"
command -v gnome-extensions >/dev/null || die "gnome-extensions is required"
command -v ptyxis >/dev/null || die "Ptyxis is required"
[[ -f "$theme_source/index.theme" ]] || die "Bundled Nordic GTK theme is missing"
[[ -f "$wallpaper" ]] || die "Wallpaper is missing: $wallpaper"
[[ -f "$blur_schema_dir/gschemas.compiled" ]] || die "Blur My Shell is not installed"
gnome-extensions list | grep -Fxq "$blur_extension" || die "Blur My Shell extension is unavailable"

mkdir -p "$HOME/.themes"
mkdir -p "$theme_target"
cp -a "$theme_source/." "$theme_target/"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color 'blue'
gsettings set org.gnome.desktop.interface gtk-theme 'Nordic-bluish-accent-standard-buttons'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Linux'

wallpaper_uri="file://$wallpaper"
gsettings set org.gnome.desktop.background picture-uri "$wallpaper_uri"
gsettings set org.gnome.desktop.background picture-uri-dark "$wallpaper_uri"
gsettings set org.gnome.desktop.background picture-options 'zoom'

gnome-extensions enable "$blur_extension"
dconf load /org/gnome/shell/extensions/blur-my-shell/ < "$repo_dir/settings/blur-my-shell.dconf"

ptyxis --import-palette "$repo_dir/palettes/Nord.palette"
profile_uuid="$(gsettings get org.gnome.Ptyxis default-profile-uuid | tr -d "'")"
[[ -n "$profile_uuid" ]] || die "Ptyxis has no default profile"
gsettings --schemadir /usr/share/glib-2.0/schemas \
    set "org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/$profile_uuid/" palette 'Nord'
