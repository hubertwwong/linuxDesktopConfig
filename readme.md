# linuxDesktopConfig

An Ansible-based configuration system for provisioning Debian, Ubuntu, and Linux Mint desktop environments.

## Supported Distributions

The playbook automatically detects the operating system distribution and dynamically applies distribution-specific variables from `prod/vars/distros/`:
- **Debian** (12+ Bookworm, Trixie): Standard GNOME Shell or minimal.
- **Ubuntu** (20.04 Focal, 22.04 Jammy, 24.04 Noble): Standard GNOME desktop.
- **Linux Mint** (Mint 20, 21, 22, LMDE): Optimized for Linux Mint **XFCE Edition** with automatic upstream LTS mapping (`wilma` ➔ `noble`, `virginia`/`victoria`/`vera`/`vanessa` ➔ `jammy`).

---

## Features & Installed Software

1. **VSCode**: Installed natively via Microsoft's official APT repositories (replaces snap installations).
2. **Google Chrome**: Handled via official Google APT package repository.
3. **Docker CE**: Dynamically detects the underlying distribution and codename (mapping Linux Mint to upstream Ubuntu LTS), deploying Docker CE and Docker Compose with armored keyring GPG keys.
4. **Mise Polyglot Runtime Manager**: Manages language runtimes and CLI tools globally under `~/.config/mise/config.toml`:
   * **Node.js** (LTS)
   * **Go** (Latest stable)
   * **Python** (Latest stable)
   * **kubectl** (Latest stable)
   * **helm** (Latest stable)
5. **Ghostty Terminal**: Dynamically resolves and downloads the proper `.deb` release package for the distro's upstream codename, sets it as default `x-terminal-emulator`, and provisions custom `Gruvbox Dark` styling.
6. **Desktop Environment Customizations**:
   * **XFCE (Linux Mint XFCE)**: Configures `xfconf-query` power management, screensaver locks, and session lock settings.
   * **GNOME (Debian / Ubuntu)**: Configures 12h clock format and screensaver lock settings.
7. **Dotfiles & Bash Aliases**: Deploys dynamic prompt support and CLI aliases for Kubernetes (`k`), Minikube (`mk`), and Docker.
8. **Town CLI & AI Agent Workspace**: Deploys the portable `town` multi-agent coordination tool and global agent definitions.
9. **Tailscale**: Configures the official Tailscale repository with armored keyring verification, installs the `tailscale` package, and enables/starts the `tailscaled` service.

---

## Pre-requisites

Ensure `git` and `ansible` are installed on the host before running any playbooks:
```bash
sudo apt update && sudo apt install -y git ansible
```

---

## Running the Playbooks

### 1. Complete Provisioning (Auto-Detected)
To run the complete setup with automatic distro and desktop detection, invoke `site-all.yaml`. Provide your Git name and email to configure Git settings:

```bash
ansible-playbook -v prod/initialSetup/site-all.yaml --extra-vars "git_name='Your Name' git_email='your.email@example.com'"
```

### 2. Linux Mint (XFCE Edition)
To explicitly target Linux Mint XFCE:

```bash
ansible-playbook -v prod/initialSetup/site-mint.yaml --extra-vars "git_name='Your Name' git_email='your.email@example.com'"
```

### 3. Minimal / Headless Setup
If you only need a minimal development environment (without GUI desktop tweaks):

```bash
ansible-playbook -v prod/initialSetup/site-min.yaml
```

### 4. Debian Remote Desktop (XRDP & Syncthing)
To provision a Debian system with remote desktop (XRDP) and Syncthing:

```bash
ansible-playbook -v prod/initialSetup/site-deb.yaml
```

*Note: Since the default user on these installations typically has passwordless sudo access, passing `--ask-become-pass` is not required.*

---

## Per-Distro Variable Architecture

Distribution-specific definitions reside in `prod/vars/distros/`:
- `prod/vars/distros/LinuxMint.yml`: Maps Mint releases (`wilma`, `virginia`, etc.) to upstream Ubuntu releases for Docker CE and Ghostty, and sets `desktop_environment: "xfce"`.
- `prod/vars/distros/Debian.yml`: Configures Debian repos and GNOME desktop environment.
- `prod/vars/distros/Ubuntu.yml`: Configures Ubuntu repos and GNOME desktop environment.
- `prod/vars/distros/default.yml`: Generic fallback configurations.
