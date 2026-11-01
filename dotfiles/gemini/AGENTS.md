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

## Skills & Progressive Discovery Protocol
- **Proactive Activation:** When user prompts match a specialized domain or workflow, check the catalog of available skills and activate the corresponding `SKILL.md`.
- **Progressive Disclosure:** 
  1. Inspect the main `SKILL.md` first to understand the procedure and steps.
  2. Do not ingest bulky reference files or auxiliary scripts up-front. Only read specific files under `references/` or execute utilities under `scripts/` when explicitly called for by a step.
  3. Keep the conversation context focused and token-efficient.
- **Reproducibility:**
  - System dotfiles and OS provisioning playbooks belong in `syncthing/vagrant/ops/desktop-setup/linuxDesktopConfig` and are managed via Ansible.
