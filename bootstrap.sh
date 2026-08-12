#!/usr/bin/env bash

set -e

echo "Bootstrapping development environment..."

echo "Installing fonts..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"${SCRIPT_DIR}/fonts/install-jet-brains-mono.sh"
