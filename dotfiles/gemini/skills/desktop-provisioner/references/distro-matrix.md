# Distribution Upstream & Keyring Matrix

This document maps downstream Linux distributions to upstream repositories for Docker CE, Ghostty, and Tailscale.

## Linux Mint Mappings

| Linux Mint Release | Codename | Upstream Ubuntu LTS | Docker CE Codename | Ghostty Asset Target |
| :--- | :--- | :--- | :--- | :--- |
| Mint 22.x | `wilma` | Ubuntu 24.04 (`noble`) | `noble` | `24.04` |
| Mint 21.3 / 21.x | `virginia` / `victoria` / `vera` / `vanessa` | Ubuntu 22.04 (`jammy`) | `jammy` | `24.04` |
| Mint 20.x | `una` / `uma` / `ulyssa` / `ulyana` | Ubuntu 20.04 (`focal`) | `focal` | `24.04` |
| LMDE 6 | `faye` | Debian 12 (`bookworm`) | `bookworm` | `trixie` |
| LMDE 5 | `elsie` | Debian 11 (`bullseye`) | `bullseye` | `trixie` |

## Ghostty Asset Conventions
- GitHub repository: `mkasberg/ghostty-ubuntu`
- Ubuntu assets are version-numbered (e.g. `_amd64_24.04.deb`).
- Debian assets use codenames (e.g. `_amd64_trixie.deb`, `_amd64_forky.deb`).

## Keyrings Architecture
All third-party APT repositories (Docker CE, Mise, Tailscale, VSCode) must place GPG keys under `/etc/apt/keyrings/` with `.asc` or `.gpg` armor and reference them via `[signed-by=...]` in sources list files.
