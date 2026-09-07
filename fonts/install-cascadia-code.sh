#!/usr/bin/env bash

set -e

# --------------------------------------------------
# Configuration
# --------------------------------------------------

CASCADIA_CODE_VERSION="2407.24"

FONT_FILE_NAME="CascadiaCode"
FONT_FAMILY_NAME="Cascadia Code"

BASE_URL="https://github.com/microsoft/cascadia-code/releases/download/v${CASCADIA_CODE_VERSION}"
DOWNLOAD_URL="${BASE_URL}/${FONT_FILE_NAME}-${CASCADIA_CODE_VERSION}.zip"

TEMP_DIR="/tmp"
EXTRACT_DIR="${TEMP_DIR}/${FONT_FILE_NAME}"
INSTALL_DIR="${HOME}/.local/share/fonts"
ZIP_FILE="${TEMP_DIR}/${FONT_FILE_NAME}.zip"

# --------------------------------------------------
# Cleanup
# --------------------------------------------------

cleanup() {
    rm -rf "${ZIP_FILE}" "${EXTRACT_DIR}"
}

trap cleanup EXIT

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

if ! command -v fc-cache >/dev/null 2>&1; then
    echo "Error: fc-cache is not installed."
    exit 1
fi

# --------------------------------------------------
# Download
# --------------------------------------------------

if fc-list | grep -Fq "${FONT_FAMILY_NAME}"; then
    echo "${CASCADIA_CODE_VERSION}is already installed. Skipping."
    exit 0
fi

echo "Downloading ${FONT_FAMILY_NAME} ${CASCADIA_CODE_VERSION}..."

curl --fail --location \
    --output "${ZIP_FILE}" \
    "${DOWNLOAD_URL}"

# --------------------------------------------------
# Install Font 
# --------------------------------------------------
echo "Installing ${FONT_FAMILY_NAME}..."

mkdir -p "${INSTALL_DIR}"

rm -rf "${EXTRACT_DIR}"
mkdir -p "${EXTRACT_DIR}"

unzip -oq \
    "${ZIP_FILE}" \
    -d "${EXTRACT_DIR}"

find "${EXTRACT_DIR}" \
    -type f \
    -name "*.ttf" \
    -exec install -m 644 {} "${INSTALL_DIR}" \;

fc-cache -fv

echo "Successfully installed ${FONT_FAMILY_NAME} ${CASCADIA_CODE_VERSION}."
