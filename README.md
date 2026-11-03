# NetWrench Desktop

Builds of NetWrench for Windows, macOS and Linux.

- **Windows 10/11 x64:** `NetWrench.exe` from the [latest release](https://github.com/zortald/netwrench-desktop-releases/releases/latest). Unsigned for now: SmartScreen asks once — *More info → Run anyway*.
- **macOS 11+ (Apple silicon):** `NetWrench-macos.app.tar.gz`, unpack, move to Applications. Unsigned for now: open it with right-click → Open the first time.
- **Linux (Debian/Ubuntu, x86_64 & ARM64):** install the `.deb` for your architecture — see [INSTALL-linux.md](INSTALL-linux.md). Quick: `arch=$(dpkg --print-architecture); curl -L -o netwrench.deb https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-$arch.deb && sudo apt install -y ./netwrench.deb`

The app updates itself from this page. Every release ships `latest.json` with each file's SHA-256, signed with the project's Ed25519 key; an update that does not match is refused.

Site: https://netwrench.app
