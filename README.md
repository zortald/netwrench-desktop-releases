<h1 align="center">NetWrench Desktop</h1>

<p align="center">
  A network engineer's toolkit for Windows, macOS and Linux:<br>
  router detection and sign-in, WAN MAC, Wi-Fi survey, speed test, iPerf3, LAN tools.
</p>

<p align="center">
  <a href="https://github.com/zortald/netwrench-desktop-releases/releases/latest"><img alt="Latest release" src="https://img.shields.io/github/v/release/zortald/netwrench-desktop-releases?label=latest&style=flat-square"></a>
  <img alt="Platforms" src="https://img.shields.io/badge/Windows%20%C2%B7%20macOS%20%C2%B7%20Linux-x64%20%26%20ARM-4c8bf5?style=flat-square">
  <a href="https://netwrench.app"><img alt="Site" src="https://img.shields.io/badge/site-netwrench.app-2ea44f?style=flat-square"></a>
</p>

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=app.netwrench"><img alt="Get it on Google Play" height="64" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"></a><br>
  <sub>NetWrench for Android: the same toolkit on the phone.</sub>
</p>

---

## Download

| Platform | File | Requirements |
| --- | --- | --- |
| **Windows** | [`NetWrench.exe`](https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench.exe) | Windows 10/11, x64. One portable file, nothing to install. |
| **macOS** | [`NetWrench-macos.app.tar.gz`](https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-macos.app.tar.gz) | macOS 11+, Apple silicon. Unpack, move to Applications. |
| **Linux** | [`amd64.deb`](https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-amd64.deb) · [`arm64.deb`](https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-linux-arm64.deb) | Debian 12+, Ubuntu 22.04+, Mint 21+. |

On Linux one command picks the right package and installs it:

```bash
curl -fsSL https://raw.githubusercontent.com/zortald/netwrench-desktop-releases/main/install.sh | bash
```

Manual install and removal: [INSTALL-linux.md](INSTALL-linux.md).

**First launch.** The builds are not notarised yet. Windows SmartScreen asks once: *More info → Run anyway*. On macOS, open the app the first time with right-click → *Open*.

## What it does

- **Router.** Finds every router the machine can reach: the gateway of each interface, the hops on the way to the ISP, other routers on the subnet (management-port sweep and MikroTik MNDP), an ONT on a cable at its factory address. Signs in to **MikroTik** and **Huawei ONTs** and reads the WAN MAC from the device itself, the WAN method and address, the PON state and the Wi-Fi networks, with the access points CAPsMAN manages. On Huawei ONTs, changes the Wi-Fi name, security and key in one request. Saved sign-ins belong to the device; passwords stay in the system keychain.
- **Link.** The current connection: signal, noise, SNR, both link rates, MCS, Wi-Fi generation. Nearby networks grouped by access point, with real AP names where the network announces them, and channel load per band. Wired adapters.
- **Speed.** Internet speed test over Cloudflare: download, upload, latency, jitter, latency under load, a plain verdict and a history.
- **iPerf3.** Client and server that talk to standard iperf3: TCP and UDP, reverse, bidirectional, parallel streams.
- **Network.** LAN scan with vendors and host names, ping, traceroute, DHCP server check, subnet calculator, MAC vendor lookup, Wake-on-LAN.
- **Adapters.** Address, gateway and DNS of every adapter; switch between DHCP and a static address, and back.

Every value comes from a real measurement or from the device itself. What the system does not expose is shown as unavailable, never estimated.

## Updates

The app checks this page and updates itself (Settings → *Check*). Every release ships `latest.json` with each file's size and SHA-256, signed with the project's Ed25519 key, and an update that does not match is refused. What changed in each version is on its [release page](https://github.com/zortald/netwrench-desktop-releases/releases).

---

<details>
<summary><b>По-русски</b></summary>

**NetWrench Desktop** — инструмент сетевого инженера для Windows, macOS и Linux: поиск роутеров и вход в них, WAN MAC, обзор Wi-Fi, тест скорости, iPerf3, инструменты для LAN. Версия для телефона — [NetWrench в Google Play](https://play.google.com/store/apps/details?id=app.netwrench).

**Скачать:** [Windows](https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench.exe) · [macOS](https://github.com/zortald/netwrench-desktop-releases/releases/latest/download/NetWrench-macos.app.tar.gz) · Linux одной командой:

```bash
curl -fsSL https://raw.githubusercontent.com/zortald/netwrench-desktop-releases/main/install.sh | bash
```

Сборки пока не нотаризованы. Windows SmartScreen спросит один раз: *Подробнее → Выполнить в любом случае*. На macOS при первом запуске — правый клик → *Открыть*.

Приложение обновляется само (Настройки → *Проверить*), обновление подписано ключом проекта. Что нового в каждой версии — на [странице релиза](https://github.com/zortald/netwrench-desktop-releases/releases).

</details>

<p align="center"><a href="https://netwrench.app">netwrench.app</a></p>
