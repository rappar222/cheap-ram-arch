#!/usr/bin/env bash
set -euo pipefail

# Build script for cheap-ram-arch ISO

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="${SCRIPT_DIR}/profile"
OUT_DIR="${SCRIPT_DIR}/out"
WORK_DIR="${SCRIPT_DIR}/work"

if [[ $EUID -ne 0 ]]; then
    echo "==> This script must be run as root (or with sudo) to mount loop filesystems and assemble the ISO."
    echo "    Usage: sudo ./build.sh"
    exit 1
fi

if ! command -v mkarchiso &>/dev/null; then
    echo "==> Error: mkarchiso not found. Install it with: pacman -S archiso"
    exit 1
fi

echo "==> Preparing output and working directories..."
mkdir -p "${OUT_DIR}"
rm -rf "${WORK_DIR}"

echo "==> Starting mkarchiso build..."
mkarchiso -v -w "${WORK_DIR}" -o "${OUT_DIR}" "${PROFILE_DIR}"

echo "==> Generating checksums..."
cd "${OUT_DIR}"
sha256sum cheap-ram-arch-*.iso > sha256sums.txt

echo "==> ISO build completed successfully!"
ls -lh "${OUT_DIR}"
