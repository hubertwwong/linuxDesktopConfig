#!/usr/bin/env bash
# ==============================================================================
# linuxDesktopConfig - Streamlined Provisioning & Test Runner
# ==============================================================================
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

# 1. Install prerequisites if missing
if ! command -v ansible-playbook &>/dev/null; then
    echo "==> Ansible not found. Installing git and ansible..."
    sudo apt update && sudo apt install -y git ansible
fi

# 2. Parse target and arguments
TARGET=""
EXTRA_ARGS=()

for arg in "$@"; do
    case "$arg" in
        all|mint|deb|min|test)
            if [ -z "$TARGET" ]; then
                TARGET="$arg"
            else
                EXTRA_ARGS+=("$arg")
            fi
            ;;
        *)
            EXTRA_ARGS+=("$arg")
            ;;
    esac
done

TARGET="${TARGET:-all}"

# 3. Handle 'test' target
if [ "$TARGET" = "test" ]; then
    echo "==> Running distribution variable assertions (test/test_distro_vars.yaml)..."
    ansible-playbook test/test_distro_vars.yaml "${EXTRA_ARGS[@]}"
    exit 0
fi

# 4. Resolve provisioning playbook
PLAYBOOK="prod/initialSetup/site-${TARGET}.yaml"
if [ ! -f "$PLAYBOOK" ]; then
    echo "Error: Playbook '$PLAYBOOK' not found."
    echo "Usage: ./setup.sh [all|mint|deb|min|test] [ansible-playbook options...]"
    exit 1
fi

echo "======================================================================"
echo " Starting Provisioning: $TARGET ($PLAYBOOK)"
echo " Password prompt (-K / --ask-become-pass) enabled for sudo tasks."
echo "======================================================================"

# 5. Run playbook with -K for sudo password prompt
ansible-playbook -K -v "$PLAYBOOK" "${EXTRA_ARGS[@]}"
