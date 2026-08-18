#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Bootstrapping development environment..."

echo "Installing fonts..."

"${SCRIPT_DIR}/fonts/install-jet-brains-mono.sh"

echo "Installing user scripts..."

mkdir -p "$HOME/.local/bin"
ln -sf "$SCRIPT_DIR/bin/vim-copy" "$HOME/.local/bin/vim-copy"
