# Global Agent Instructions

## Operating Environment
- Primary OS: Linux
- Shell: Bash / Zsh (with Ghostty terminal)
- Language Runtimes: Python, Go, Node.js (managed via `mise`)

## Project Guidelines
- **Per-Project Isolation:**
  - Each project directory is completely self-contained. Always resolve paths relative to the current workspace root (`./`).
- **Internal vs User Files:**
  - Agent-internal temporary data, scratchpad scripts, and raw dumps belong in `./ai/`.
  - Human-readable documentation, summaries, and guides belong in `./docs/`.
- **Skills-First Extensibility:**
  - Standard Antigravity Skills (`skills/<name>/SKILL.md`) should be used for modular workflows, runbooks, and domain procedures.
- **Reproducibility:**
  - System dotfiles and OS provisioning playbooks belong in `syncthing/vagrant/ops/desktop-setup/linuxDesktopConfig` and are managed via Ansible.
