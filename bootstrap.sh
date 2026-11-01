#!/usr/bin/env bash
# ==============================================================================
# linuxDesktopConfig - One-Liner Bootstrap Installer
# ==============================================================================
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/hubertwwong/linuxDesktopConfig/master/bootstrap.sh | bash -s -- mint
# ==============================================================================
set -e

REPO_URL="https://github.com/hubertwwong/linuxDesktopConfig.git"
INSTALL_DIR="${INSTALL_DIR:-$HOME/projects/linuxDesktopConfig}"

echo "======================================================================"
echo " Bootstrapping linuxDesktopConfig"
echo " Destination: $INSTALL_DIR"
echo "======================================================================"

# 1. Install prerequisites (git, curl) if missing
MISSING_PKGS=()
command -v git &>/dev/null || MISSING_PKGS+=("git")
command -v curl &>/dev/null || MISSING_PKGS+=("curl")

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    echo "==> Installing prerequisites: ${MISSING_PKGS[*]}..."
    sudo apt update && sudo apt install -y "${MISSING_PKGS[@]}"
fi

# 2. Clone or update repository into organized directory
if [ -d "$INSTALL_DIR/.git" ]; then
    echo "==> Repository exists in $INSTALL_DIR, pulling latest changes..."
    git -C "$INSTALL_DIR" pull --ff-only
else
    mkdir -p "$(dirname "$INSTALL_DIR")"
    echo "==> Cloning $REPO_URL into $INSTALL_DIR..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# 3. Hand off to setup.sh in the cloned repository
cd "$INSTALL_DIR"
exec ./setup.sh "$@"
