# ⚡ Cheap-RAM-Arch Linux

> An Arch Linux distribution and live environment tuned to use as little RAM as technically possible.

---

## 🎯 Key Memory Optimizations

1. **Kernel Boot Parameters**:
   - `audit=0`: Shuts down the kernel audit daemon, saving kernel memory overhead.
   - `transparent_hugepage=never`: Prevents allocating 2MB hugepages for small programs, mitigating internal memory fragmentation on low-RAM devices.
   - `copytoram=n`: Streams system image directly from boot media instead of cloning the entire rootfs into RAM.
   - `quiet loglevel=3`: Minimizes console log buffer consumption.

2. **Dynamic Compressed RAM (`zram-generator`)**:
   - Automatically provisions an in-RAM compressed swap device using `lz4` compression.
   - Delivers an effective 2x–3x memory expansion under workload pressure.

3. **Kernel Memory Subsystem (`sysctl`)**:
   - `vm.vfs_cache_pressure = 150`: Encourages the kernel to reclaim VFS cache (dentry/inode) aggressively instead of hoarding RAM.
   - `vm.swappiness = 80`: Favors offloading cold memory pages into compressed zram.
   - `vm.dirty_background_ratio = 5` and `vm.dirty_ratio = 10`: Writes dirty memory pages to disk early to prevent dirty page accumulation.

4. **Stripped Services & Daemons**:
   - Removed `cloud-init`, hypervisor daemons (`open-vm-tools`, `hyperv`, `virtualbox-guest-utils`).
   - `systemd-journald`: Storage set to `volatile` and memory buffer capped at `4MB`.
   - Single VT: Logind restricted to `tty1` only (`NAutoVTs=1`), avoiding 5 unused `agetty` instances.
   - Network stack: Lightweight `iwd` + `systemd-networkd` / `dhcpcd` instead of heavy desktop network managers.

---

## 🚀 Building the ISO

### Option 1: GitHub Actions (Automated Cloud Build)
This repository includes a GitHub Actions workflow (`.github/workflows/build-iso.yml`) that builds the bootable ISO in an Arch Linux container with privileged loopback support:
- Go to the **Actions** tab on GitHub.
- Run the **Build Cheap-RAM-Arch ISO** workflow.
- Download the resulting ISO from the run artifacts or releases.

### Option 2: Local Build

Requirements:
- An Arch Linux host (or Arch chroot)
- `archiso` package installed (`pacman -S archiso`)
- Root privileges (needed by `mkarchiso` to mount loop filesystems)

Run:
```bash
sudo ./build.sh
```

The resulting image and SHA256 checksum will be located in the `out/` directory:
```bash
out/cheap-ram-arch-*-x86_64.iso
out/sha256sums.txt
```

---

## 🧪 Testing with QEMU

Test the built ISO with as little as 256MB or 512MB RAM:

```bash
qemu-system-x86_64 \
  -m 512M \
  -enable-kvm \
  -cdrom out/cheap-ram-arch-*.iso \
  -boot d
```

Upon boot, the system automatically logs in on `tty1` and prints live memory consumption statistics via `free -h`.
