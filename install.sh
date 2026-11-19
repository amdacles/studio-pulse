#!/bin/bash
# Studio Pulse installer, version 2.3.2
#
# What it does, step by step:
#   1. checks that this is a Mac with Apple silicon and macOS 13 or newer;
#   2. downloads Studio Pulse from its official GitHub release;
#   3. checks the download's SHA-256 fingerprint: it must match the one written below, or nothing is installed;
#   4. puts "Studio Pulse.app" in your Applications folder (replacing an older Studio Pulse) and opens it.
# It asks for no password and changes nothing else on your Mac. Apart from that one download from GitHub, it contacts nothing.
# To uninstall later: Studio Pulse › Settings › About › Uninstall Studio Pulse…
set -euo pipefail

VERSION="2.3.2"
REPO="amdacles/studio-pulse"
ZIP="Studio-Pulse-${VERSION}.zip"
URL="https://github.com/${REPO}/releases/download/v${VERSION}/${ZIP}"
SHA256="d501180dd6b3f8d1636e2106de610b8c59ba5a4e9435be4a7b5ff857d141f922"
APP="Studio Pulse.app"

say()  { printf '%s\n' "$*"; }
stop() { printf '\nStudio Pulse was not installed: %s\n' "$*" >&2; exit 1; }

[ "$(uname -s)" = "Darwin" ] || stop "it is a Mac app."
[ "$(uname -m)" = "arm64" ]  || stop "it needs a Mac with Apple silicon (M1 or newer)."
major="$(sw_vers -productVersion | cut -d. -f1)"
[ "$major" -ge 13 ] || stop "it needs macOS 13 or newer (this Mac has $(sw_vers -productVersion))."
if pgrep -u "$(id -u)" -x StudioPulse >/dev/null 2>&1; then     # this Mac user's own copy only
  stop "Studio Pulse is open. Quit it first (its menu-bar icon › Quit), then run this command again."
fi

DEST="/Applications"
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

say "Downloading Studio Pulse ${VERSION}…"
curl -fL --proto-redir '=https' --progress-bar "$URL" -o "$tmp/$ZIP" \
  || stop "the download failed. Check your internet connection and try again."

got="$(shasum -a 256 "$tmp/$ZIP" 2>/dev/null | cut -d' ' -f1 || true)"
[ -n "$got" ] || got="$(openssl dgst -sha256 -r "$tmp/$ZIP" | cut -d' ' -f1)"
[ "$got" = "$SHA256" ] || stop "the download doesn't match its fingerprint (SHA-256). Nothing was changed."
say "Fingerprint checked: it matches."

ditto -x -k "$tmp/$ZIP" "$tmp/unzipped"
[ -d "$tmp/unzipped/$APP" ] || stop "the download doesn't contain the app. Nothing was changed."
codesign --verify --deep --strict "$tmp/unzipped/$APP" 2>/dev/null \
  || stop "the app's seal is broken. Nothing was changed."

if [ -d "$DEST/$APP" ]; then
  say "Replacing the older Studio Pulse…"
  rm -rf "$DEST/$APP"
fi
ditto "$tmp/unzipped/$APP" "$DEST/$APP"
say "Installed in $DEST."
open "$DEST/$APP"

say ""
say "Done. Look for the pulse icon in your menu bar."
say "First time? Click \"Connect to Claude Code\" in the panel."
say "Codex too: Settings › Connections › Codex › Connect, then trust its hooks once inside Codex."
