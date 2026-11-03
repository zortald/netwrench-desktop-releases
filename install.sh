#!/usr/bin/env bash
# NetWrench Desktop installer for Debian / Ubuntu and derivatives (amd64, arm64).
#
#   Install or update:  curl -fsSL https://raw.githubusercontent.com/zortald/netwrench-desktop-releases/main/install.sh | bash
#   Remove:             curl -fsSL https://raw.githubusercontent.com/zortald/netwrench-desktop-releases/main/install.sh | bash -s -- --uninstall
#
# Always installs the latest release. Needs Ubuntu 22.04+, Linux Mint 21+ or Debian 12+.
set -euo pipefail

REPO="zortald/netwrench-desktop-releases"
PKG="net-wrench"

say()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
fail() { printf '\033[1;31mError:\033[0m %s\n' "$*" >&2; exit 1; }

main() {
  local sudo=""
  if [ "$(id -u)" -ne 0 ]; then
    command -v sudo >/dev/null || fail "run as root or install sudo"
    sudo="sudo"
  fi
  # Wait (up to 10 min) for another package manager — e.g. automatic updates — instead of failing.
  local apt=(apt-get -o DPkg::Lock::Timeout=600)

  if [ "${1:-}" = "--uninstall" ]; then
    say "Removing NetWrench"
    $sudo "${apt[@]}" remove -y "$PKG"
    say "Removed"
    return
  fi

  command -v dpkg >/dev/null && command -v apt-get >/dev/null \
    || fail "this installer is for Debian/Ubuntu and derivatives (dpkg + apt)"

  local arch
  arch="$(dpkg --print-architecture)"
  case "$arch" in
    amd64|arm64) ;;
    *) fail "unsupported architecture: $arch (builds exist for amd64 and arm64)" ;;
  esac

  local os="this system"
  [ -r /etc/os-release ] && os="$(. /etc/os-release && echo "${PRETTY_NAME:-$os}")"
  local need="NetWrench needs Ubuntu 22.04+, Linux Mint 21+ or Debian 12+ (found: $os)"

  local glibc
  glibc="$(getconf GNU_LIBC_VERSION 2>/dev/null | awk '{print $2}')"
  if [ -n "$glibc" ] && [ "$(printf '%s\n' 2.34 "$glibc" | sort -V | head -n1)" != "2.34" ]; then
    fail "glibc $glibc is too old. $need"
  fi

  candidate() { apt-cache policy libwebkit2gtk-4.1-0 2>/dev/null | awk '/Candidate:/ {print $2}'; }
  local webkit
  webkit="$(candidate)"
  if [ -z "$webkit" ] || [ "$webkit" = "(none)" ]; then
    say "Refreshing package lists"
    $sudo "${apt[@]}" update -qq
    webkit="$(candidate)"
  fi
  if [ -z "$webkit" ] || [ "$webkit" = "(none)" ]; then
    fail "libwebkit2gtk-4.1-0 is not available. $need"
  fi

  local url="https://github.com/$REPO/releases/latest/download/NetWrench-linux-$arch.deb"
  local tmp
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  chmod 755 "$tmp"   # apt's sandbox user must be able to read the package
  local deb="$tmp/netwrench.deb"

  say "Downloading the latest NetWrench ($arch)"
  if command -v curl >/dev/null; then
    curl -fL --progress-bar -o "$deb" "$url"
  elif command -v wget >/dev/null; then
    wget -q --show-progress -O "$deb" "$url"
  else
    fail "need curl or wget"
  fi
  chmod 644 "$deb"

  say "Installing"
  $sudo "${apt[@]}" install -y "$deb"

  local ver
  ver="$(dpkg-query -W -f='${Version}' "$PKG" 2>/dev/null || true)"
  say "NetWrench ${ver:-} installed. Start it from the application menu or run: netwrench-desktop"
}

# Everything is inside main(), so a piped script is read whole before it runs.
main "$@"
