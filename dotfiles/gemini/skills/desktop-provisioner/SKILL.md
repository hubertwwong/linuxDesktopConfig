---
name: desktop-provisioner
description: >-
  Use this skill when testing, provisioning, configuring, or troubleshooting Linux desktop
  environments (Debian, Ubuntu, Linux Mint) using linuxDesktopConfig playbooks and setup.sh.
---

# Desktop Provisioner Skill

Procedures for testing, provisioning, and maintaining Debian, Ubuntu, and Linux Mint environments via `linuxDesktopConfig`.

## Standard Workflow

### 1. Pre-Run Distro Verification
Before running playbooks on a new machine or when adding new distributions, execute the unit assertion test:
```bash
./setup.sh test
```

### 2. Execution Runbook
Run the appropriate target using `./setup.sh`:
- **Linux Mint (XFCE)**: `./setup.sh mint`
- **Auto-Detect All**: `./setup.sh all` (or `./setup.sh`)
- **Debian XRDP & Syncthing**: `./setup.sh deb`
- **Minimal CLI Only**: `./setup.sh min`

For non-destructive dry-runs, pass `--check`:
```bash
./setup.sh <target> --check
```

### 3. Post-Provisioning Health Verification
Run the verification script to confirm all software versions and service states:
```bash
./scripts/verify-env.sh
```

## Progressive References
Consult these reference guides only when specific debugging or upstream mapping details are required:
- [Distro Upstream & Keyring Matrix](./references/distro-matrix.md): Release codename mappings (e.g. `wilma` ➔ `noble`), Docker CE GPG keyring setup, and Ghostty release conventions.
- [Troubleshooting Runbook](./references/troubleshooting.md): Resolving common apt lock issues, sudo/become authentication, and asset resolution failures.
