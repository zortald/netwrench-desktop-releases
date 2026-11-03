# NetWrench for Linux — Installation

NetWrench ships as a `.deb` package for Debian / Ubuntu and derivatives
(Linux Mint, Pop!_OS, elementary, Raspberry Pi OS, …), in two architectures:

| Architecture | For |
| --- | --- |
| **amd64** (x86_64) | Intel / AMD PCs and laptops |
| **arm64** (aarch64) | ARM machines — Raspberry Pi 4/5 (64-bit), ARM servers, Asahi Linux |

The links below always point at the **latest release** — no version to pick.

## Requirements

NetWrench uses **WebKitGTK 4.1**, so it needs a reasonably current distribution:

- **Ubuntu 22.04 LTS or newer**, **Linux Mint 21+**, **Debian 12+**, or equivalent
  (glibc ≥ 2.34, `libwebkit2gtk-4.1-0` available).
- **Ubuntu 20.04 / Mint 20 and older are not supported** — they ship only
  WebKitGTK 4.0, which Tauri 2 cannot use. Upgrade the OS to run NetWrench.


## Install — one command

```bash
curl -fsSL https://raw.githubusercontent.com/zortald/netwrench-desktop-releases/main/install.sh | bash
```

It detects the architecture, checks that the system is supported, waits for
automatic updates to release the package manager, downloads the latest release
and installs it with `apt` (dependencies included). It asks for your password
once, for `sudo`.

## Manual download (without the script)

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

Run the same command again — it always installs the latest release.

## Remove

```bash
curl -fsSL https://raw.githubusercontent.com/zortald/netwrench-desktop-releases/main/install.sh | bash -s -- --uninstall
```

or simply `sudo apt remove net-wrench`.

## Notes

- **Dependencies** are in the distro repositories and resolved automatically by
  `apt install ./<file>.deb`. If you use `dpkg -i`, run `sudo apt -f install` after.
- **Wi-Fi survey** on Linux is **experimental** (a new nl80211 backend, still being
  verified on hardware). If the Wi-Fi tab shows nothing, the other tools — speed
  test, iPerf3, LAN discovery, adapters, DHCP, router detection and login — all work.
- **Other distributions:** only `.deb` is published today. A native package or
  AppImage for Fedora/openSUSE/Arch is not yet provided.
- **Verifying a download:** each release lists SHA-256 sums in its notes; check
  with `sha256sum NetWrench-linux-<arch>.deb`.
