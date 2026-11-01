# linuxDesktopConfig

An automated, Ansible-based desktop provisioning system for Debian, Ubuntu, and Linux Mint environments.

---

## Quickstart (One-Liner)

On a fresh VM or machine, run this single command to clone the repo into `~/projects/linuxDesktopConfig` (avoiding `$HOME` clutter), install dependencies, and start provisioning:

```bash
# Provision Linux Mint (XFCE Edition):
curl -fsSL https://raw.githubusercontent.com/hubertwwong/linuxDesktopConfig/master/bootstrap.sh | bash -s -- mint

# Or auto-detect any supported distribution (Debian / Ubuntu / Mint):
curl -fsSL https://raw.githubusercontent.com/hubertwwong/linuxDesktopConfig/master/bootstrap.sh | bash
```

---

## Usage (Cloned Repository)

If you already have the repository cloned, use the `./setup.sh` runner. It automatically installs prerequisites (`git`, `ansible`), prompts for your sudo password (`-K`), and defaults your Git identity from existing config.

```bash
cd ~/projects/linuxDesktopConfig

# Run distro assertion tests (dry verification)
./setup.sh test

# Provision target environments
./setup.sh mint    # Linux Mint XFCE
./setup.sh all     # Auto-detect distribution & desktop
./setup.sh min     # Minimal / headless (CLI tools only)
./setup.sh deb     # Debian with XRDP remote desktop & Syncthing
```

> [!TIP]
> You can pass standard Ansible flags directly through `./setup.sh`, e.g. `./setup.sh mint --check` for a dry run, or `-vv` for extra verbosity.

---

## Supported Distributions

The system automatically detects your OS distribution and applies matching configurations from [`prod/vars/distros/`](./prod/vars/distros/):

| Distribution | Supported Versions | Desktop Environment | Upstream Base |
| :--- | :--- | :--- | :--- |
| **Linux Mint** | Mint 20, 21, 22, LMDE | XFCE Edition | Ubuntu LTS (`wilma` ➔ `noble`, `virginia` ➔ `jammy`) / Debian |
| **Debian** | 12 (Bookworm), 13 (Trixie) | GNOME or Minimal | Debian Native |
| **Ubuntu** | 20.04 (Focal), 22.04 (Jammy), 24.04 (Noble) | GNOME Desktop | Ubuntu Native |

---

## Included Software & Tools

- **Desktop Runtimes & Development**:
  - **VSCode**: Installed via official Microsoft APT repository (native .deb, no Snap).
  - **Mise Polyglot Manager**: Global installations of latest Node.js, Go, Python, `kubectl`, and `helm`.
  - **Docker CE & Compose**: Dynamic distro repository integration with armored keyring verification.
  - **Ghostty Terminal**: Native `.deb` package auto-matched to upstream distro version with `Gruvbox Dark` styling.
  - **Google Chrome**: Official Google APT package repository.
- **Networking & Services**:
  - **Tailscale**: Official Tailscale repository, package installation, and systemd service setup.
- **System & Shell Customizations**:
  - **Dotfiles**: Prompt enhancements and CLI shortcuts (`k`, `mk`, docker aliases).
  - **Desktop Customizations**: Power management, screensaver timeout, and lock-screen behavior (`xfconf-query` for XFCE, `gsettings` for GNOME).
  - **Antigravity Customizations & Skills**: Configures global AGY rules, MCP config, and skills directory (`~/.gemini/config/skills/`) for on-demand progressive disclosure.

---

## Repository Structure

```text
├── bootstrap.sh                 # One-liner remote installer
├── setup.sh                     # Local runner script (handles sudo prompt & args)
├── ansible.cfg                  # Ansible configuration (inventory & output formatting)
├── hosts                        # Localhost inventory definition
├── prod/
│   ├── initialSetup/
│   │   ├── site-all.yaml        # Complete auto-detected desktop playbook
│   │   ├── site-mint.yaml       # Linux Mint XFCE playbook
│   │   ├── site-deb.yaml        # Debian remote desktop playbook
│   │   ├── site-min.yaml        # Minimal headless playbook
│   │   └── roles/               # Modular Ansible roles
│   └── vars/distros/            # Distribution-specific variable overrides
└── test/
    └── test_distro_vars.yaml    # Unit assertions for distro upstream mappings
```
