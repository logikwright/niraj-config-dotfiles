#!/usr/bin/env bash

set -e

# --------------------------------------------------
# Configuration
# --------------------------------------------------

JETBRAINS_MONO_VERSION="2.304"
FONT_NAME="JetBrainsMono"

BASE_URL="https://download.jetbrains.com/fonts"
DOWNLOAD_URL=$"${BASE_URL}/JetBrainsMono-${JETBRAINS_MONO_VERSION}.zip"

TEMP_DIR="/tmp"
EXTRACT_DIR="${TEMP_DIR}/${FONT_NAME}"
INSTALL_DIR="${HOME}/.local/share/fonts"
ZIP_FILE="${TEMP_DIR}/${FONT_NAME}.zip"

# --------------------------------------------------
# Dependency Checks
# --------------------------------------------------

if ! command -v curl >/dev/null 2>&1; then
    echo "Error: curl is not installed."
    exit 1
fi

if ! command -v unzip >/dev/null 2>&1; then
    echo "Error: unzip is not installed."
    exit 1
fi

# --------------------------------------------------
# Download
# --------------------------------------------------

echo "Downloading ${FONT_NAME} ${JETBRAINS_MONO_VERSION}..."

curl -L \
    --output "${ZIP_FILE}" \
    "${DOWNLOAD_URL}"


# --------------------------------------------------
# Verify Download
# --------------------------------------------------

if [[ ! -f "${ZIP_FILE}"]]; then
    echo "Error: Failed to download ${FONT_NAME}."
    exit 1
fi

# --------------------------------------------------
# Install Font 
# --------------------------------------------------
echo "Installing ${FONT_NAME}..."

mkdir -p "${INSTALL_DIR}"
mkdir -p "${EXTRACT_DIR}"

unzip -o \
    "${ZIP_FILE}" \
    -d "${EXTRACT_DIR}"

find "${EXTRACT_DIR}" \
    -type f \
    -name "*.ttf" \
    -exec install {} "${INSTALL_DIR}" \;

fc-cache -fv
