# Global Agent Instructions

## Operating Environment
- Primary OS: Linux (Debian)
- Shell: Zsh (with Ghostty / Starship prompt)
- Language Runtimes: Python, Go, Node.js (managed via `mise`)

## Project Isolation & Workflow Guidelines
- **Per-Project Isolation:**
  - Each project directory is completely self-contained. Always resolve paths relative to the current project/workspace root (`./`), never the parent home directory.
  - When entering a project, read `./ai/ledger.md` or `./ai/plans/` to understand the active state.
- **Internal vs User Files:**
  - Agent-internal temporary data, scratchpad scripts, plans, and raw dumps belong in the project's local `./ai/` directory (e.g. `./ai/plans/`, `./ai/ledger.md`, `./ai/data/`).
  - Human-readable documentation, summaries, and user guides belong in the project's local `./docs/` directory.
- **Task & Plan Tracking:**
  - Track plans in `./ai/plans/` and status in `./ai/ledger.md` and `./ai/todo.md`.
  - Use the `town` CLI command (`town status`, `town sync`) to inspect or update project state.
- **Reproducibility:**
  - System dotfiles and OS provisioning playbooks belong in `syncthing/vagrant/ops/desktop-setup/linuxDesktopConfig` and are managed via Ansible.
