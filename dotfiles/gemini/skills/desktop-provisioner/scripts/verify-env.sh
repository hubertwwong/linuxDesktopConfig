#!/usr/bin/env bash
# ==============================================================================
# verify-env.sh - Desktop Provisioning Health & Version Check
# ==============================================================================
set -e

echo "======================================================================"
echo " Checking Installed Desktop Software & Runtimes"
echo "======================================================================"

check_cmd() {
    local name="$1"
    local cmd="$2"
    if command -v "$name" &>/dev/null; then
        echo -n "✔ $name: "
        eval "$cmd"
    else
        echo "✖ $name: NOT INSTALLED"
    fi
}

check_cmd "ghostty" "ghostty --version | head -n 1"
check_cmd "code" "code --version | head -n 1"
check_cmd "google-chrome" "google-chrome --version"
check_cmd "docker" "docker --version"
check_cmd "docker-compose" "docker compose version"
check_cmd "mise" "mise --version | head -n 1"
check_cmd "tailscale" "tailscale --version | head -n 1"

echo "----------------------------------------------------------------------"
if command -v mise &>/dev/null; then
    echo "Active Mise Runtimes:"
    mise current || true
fi
echo "======================================================================"
