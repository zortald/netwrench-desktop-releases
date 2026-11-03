# NetWrench for Linux — Installation

NetWrench ships as a `.deb` package for Debian / Ubuntu and derivatives
(Linux Mint, Pop!_OS, elementary, Raspberry Pi OS, …), in two architectures:

| Architecture | For |
| --- | --- |
| **amd64** (x86_64) | Intel / AMD PCs and laptops |
| **arm64** (aarch64) | ARM machines — Raspberry Pi 4/5 (64-bit), ARM servers, Asahi Linux |

The links below always point at the **latest release** — no version to pick.

## Quick install (detects your architecture)

```bash
arch=$(dpkg --print-architecture)   # amd64 or arm64
curl -L -o netwrench.deb \
  "https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-${arch}.deb"
sudo apt install -y ./netwrench.deb
```

`apt` pulls the dependencies (`libwebkit2gtk-4.1-0`, `libgtk-3-0`) itself.

## Manual download

Always-latest links:

- x86_64 (amd64): <https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-amd64.deb>
- ARM64 (aarch64): <https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-arm64.deb>

```bash
sudo apt install ./NetWrench-linux-amd64.deb     # or the arm64 file
```

Not sure which one? Run `dpkg --print-architecture` (`amd64` or `arm64`),
or `uname -m` (`x86_64` → amd64, `aarch64` → arm64).

## Run

From the application menu (**NetWrench**), or the terminal:

```bash
netwrench-desktop
```

## Update

Download and install the latest `.deb` the same way — `apt` replaces it in place:

```bash
arch=$(dpkg --print-architecture)
curl -L -o netwrench.deb \
  "https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-${arch}.deb"
sudo apt install -y ./netwrench.deb
```

## Remove

```bash
sudo apt remove net-wrench
```

## Notes

- **Dependencies** are in the distro repositories and resolved automatically by
  `apt install ./<file>.deb`. If you use `dpkg -i`, run `sudo apt -f install` after.
- **Wi-Fi survey** is not yet available on Linux (no nl80211 backend); every other
  tool — speed test, iPerf3, LAN discovery, adapters, DHCP, router detection and
  login — works.
- **Other distributions:** only `.deb` is published today. A native package or
  AppImage for Fedora/openSUSE/Arch is not yet provided.
- **Verifying a download:** each release lists SHA-256 sums in its notes; check
  with `sha256sum NetWrench-linux-<arch>.deb`.
