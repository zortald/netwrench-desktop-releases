# NetWrench Desktop

Builds of NetWrench for Windows and macOS. Nothing to install: download and run.

- **Windows 10/11 x64:** `NetWrench.exe` from the [latest release](https://github.com/zortald/netwrench-desktop-releases/releases/latest). Unsigned for now: SmartScreen asks once — *More info → Run anyway*.
- **macOS 11+ (Apple silicon and Intel):** `NetWrench-macos.app.tar.gz`, unpack, move to Applications. Unsigned for now: open it with right-click → Open the first time.

The app updates itself from this page. Every release ships `latest.json` with each file's SHA-256, signed with the project's Ed25519 key; an update that does not match is refused.

Site: https://netwrench.app
