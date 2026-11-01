# Troubleshooting Runbook

## 1. Password Prompt / BECOME Errors
- **Symptom**: `Missing sudo password` or `become: yes` fails with authentication error.
- **Fix**: `./setup.sh` automatically passes `-K` / `--ask-become-pass`. If running `ansible-playbook` directly, always include `-K`.

## 2. APT Lock Contention
- **Symptom**: `Could not get lock /var/lib/dpkg/lock-frontend`.
- **Cause**: Unattended upgrades or automatic package managers running in background on fresh boot.
- **Fix**: Wait 60 seconds, or check with `sudo lsof /var/lib/dpkg/lock-frontend`.

## 3. Empty Asset Lookup (`No first item, sequence was empty`)
- **Symptom**: GitHub releases query returns empty asset array.
- **Cause**: GitHub API rate limits or mismatched codename search pattern.
- **Fix**: Ensure `ghostty_target_codename` resolves to `24.04` (Ubuntu/Mint) or `trixie` (Debian), and use safe list indexing with fallback URLs.
