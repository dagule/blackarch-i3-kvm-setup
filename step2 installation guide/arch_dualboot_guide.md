# 🐧 Complete Arch Linux Dual Boot Installation Guide

<div align="center">

**From Windows to Arch Linux Dual Boot - Step by Step**

Perfect for ASUS TUF F15 and similar laptops

[Prerequisites](#-prerequisites) • [Preparation](#-preparation) • [Installation](#-installation) • [Post-Install](#-post-installation)

</div>

---

## 📋 Table of Contents

1. [Prerequisites](#-prerequisites)
2. [Pre-Installation Preparation](#-pre-installation-preparation)
3. [Creating Bootable USB](#-creating-bootable-usb)
4. [BIOS/UEFI Configuration](#-biosuefi-configuration)
5. [Arch Linux Installation](#-arch-linux-installation)
6. [Post-Installation Setup](#-post-installation-setup)
7. [Running BlackArch Scripts](#-running-blackarch-scripts)
8. [Troubleshooting](#-troubleshooting)

---

## ✅ Prerequisites

### Hardware Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | 64-bit processor | Intel Core i5/AMD Ryzen 5+ |
| RAM | 4 GB | 8 GB+ (16GB for VMs) |
| Storage | 60 GB free | 120 GB+ free |
| Boot Mode | UEFI | UEFI with Secure Boot disabled |
| USB Drive | 4 GB | 8 GB+ USB 3.0 |

### Software Requirements

- ✅ Windows 10/11 (already installed)
- ✅ 60GB+ free disk space
- ✅ Stable internet connection
- ✅ 8GB+ USB drive
- ✅ Backup of important data

### What You'll Need

- 🔌 USB drive (will be erased)
- 💾 Arch Linux ISO
- 🖥️ Rufus or balenaEtcher (for Windows)
- ⏱️ 1-2 hours of time
- ☕ Coffee (optional but recommended)

---

## 🛠️ Pre-Installation Preparation

### Step 1: Backup Your Data

⚠️ **CRITICAL**: Backup all important files before proceeding!

```powershell
# Recommended locations to backup:
- Documents
- Desktop
- Downloads
- Pictures
- Videos
- Browser bookmarks
- Application settings
```

### Step 2: Check Your Partition Layout

**On Windows:**

1. Press `Win + X` → Select **"Disk Management"**
2. Check your disk layout
3. Identify available free space or partition to shrink

### Step 3: Shrink Windows Partition

**Option A: Using Disk Management (Windows)**

1. Press `Win + X` → **"Disk Management"**
2. Right-click on C: drive → **"Shrink Volume"**
3. Enter shrink amount: **100000 MB** (≈100GB for Arch)
4. Click **"Shrink"**
5. You'll see "Unallocated Space" - Leave it as is

**Option B: Using Diskpart (Advanced)**

```powershell
# Open PowerShell as Administrator
diskpart
list disk
select disk 0  # Usually disk 0, verify first!
list partition
select partition 3  # Usually Windows partition, VERIFY!
shrink desired=100000  # Shrink 100GB
exit
```

### Step 4: Disable Fast Startup (Important!)

1. Open **Control Panel** → **Power Options**
2. Click **"Choose what the power buttons do"**
3. Click **"Change settings that are currently unavailable"**
4. **Uncheck** "Turn on fast startup (recommended)"
5. Click **"Save changes"**

### Step 5: Disable Secure Boot (Required for dual boot)

1. Restart PC → Press `F2` or `Del` (during boot) to enter BIOS
2. Navigate to **"Boot"** or **"Security"** tab
3. Find **"Secure Boot"** → Set to **Disabled**
4. Save and Exit (`F10`)

### Step 6: Download Arch Linux ISO

**On Windows:**

1. Visit [Arch Linux Downloads](https://archlinux.org/download/)
2. Download the latest ISO (≈800MB)
3. Choose a mirror close to your location
4. Verify checksum (optional but recommended)

```powershell
# Verify SHA256 in PowerShell
Get-FileHash archlinux-2024.XX.XX-x86_64.iso -Algorithm SHA256
# Compare with the one on the download page
```

---

## 💿 Creating Bootable USB

### Method 1: Using Rufus (Recommended for Windows)

1. **Download Rufus**: [rufus.ie](https://rufus.ie)
2. **Insert USB drive** (will be erased!)
3. **Open Rufus** as Administrator

4. **Configure Rufus:**
   ```
   Device: [Your USB Drive]
   Boot selection: [Select Arch Linux ISO]
   Partition scheme: GPT
   Target system: UEFI (non CSM)
   Volume label: ARCH_LINUX
   File system: FAT32
   Cluster size: 4096 bytes (default)
   ```

5. Click **"START"**
6. When prompted, select **"Write in ISO Image mode"**
7. Click **"OK"** → Wait for completion

### Method 2: Using balenaEtcher

1. **Download Etcher**: [balena.io/etcher](https://www.balena.io/etcher)
2. **Open Etcher**
3. Click **"Flash from file"** → Select Arch ISO
4. Click **"Select target"** → Choose USB drive
5. Click **"Flash!"** → Enter password if prompted

### Method 3: Using dd (Linux/Mac)

```bash
# Find USB device
lsblk

# Write ISO (replace sdX with your USB device)
sudo dd bs=4M if=archlinux-2024.XX.XX-x86_64.iso of=/dev/sdX status=progress oflag=sync

# Sync
sync
```

---

## ⚙️ BIOS/UEFI Configuration

### For ASUS TUF F15 Laptops

1. **Restart** and press `F2` repeatedly during boot
2. Navigate using arrow keys

### Recommended BIOS Settings

```
┌─────────────────────────────────────────┐
│ Boot Configuration                      │
├─────────────────────────────────────────┤
│ Fast Boot: [Disabled]                   │
│ Secure Boot: [Disabled]                 │
│ CSM Support: [Disabled]                 │
│ Boot Mode: [UEFI]                       │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ Security Configuration                   │
├─────────────────────────────────────────┤
│ Secure Boot State: [Disabled]           │
│ Secure Boot Control: [Disabled]         │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ Advanced Configuration                   │
├─────────────────────────────────────────┤
│ Intel VT-x: [Enabled]                   │
│ Intel VT-d: [Enabled]                   │
│ SATA Mode: [AHCI]                       │
└─────────────────────────────────────────┘
```

### Boot from USB

1. **Save settings** and exit (`F10`)
2. Press `F8` or `Esc` during boot for Boot Menu
3. Select your **USB drive** (usually starts with "UEFI:")
4. Press `Enter`

---

## 🚀 Arch Linux Installation

### Phase 1: Boot and Setup

#### 1. Boot Arch Linux Live Environment

You should see:
```
Arch Linux 202X.XX.XX (ttyX)
archiso login: root (automatic login)
root@archiso ~ #
```

#### 2. Verify Boot Mode (UEFI)

```bash
ls /sys/firmware/efi/efivars
# If directory exists and contains files → UEFI mode ✓
# If error → Legacy BIOS mode ✗ (reinstall USB correctly)
```

#### 3. Connect to Internet

**Option A: Ethernet (Automatic)**
```bash
# Test connection
ping -c 3 archlinux.org
```

**Option B: WiFi (Most Common)**
```bash
# Start iwctl
iwctl

# Inside iwctl:
device list                          # List WiFi devices (usually wlan0)
station wlan0 scan                   # Scan for networks
station wlan0 get-networks           # Show available networks
station wlan0 connect "Your-WiFi-Name"  # Connect (enter password when prompted)
exit

# Test connection
ping -c 3 archlinux.org
```

#### 4. Update System Clock

```bash
timedatectl set-ntp true
timedatectl status
```

### Phase 2: Disk Partitioning

#### 5. Identify Disks

```bash
lsblk
# Look for your main disk (usually nvme0n1 or sda)
# Example output:
# nvme0n1           238.5G
# ├─nvme0n1p1       100M   EFI System (Windows)
# ├─nvme0n1p2       16M    Microsoft reserved
# ├─nvme0n1p3       138G   Windows (C:)
# └─free space      100G   <- We'll use this!
```

#### 6. Partition the Disk

**⚠️ IMPORTANT**: We'll create partitions in the FREE SPACE only!

```bash
# Start cfdisk (easier than fdisk)
cfdisk /dev/nvme0n1
# Or for SATA drives:
cfdisk /dev/sda
```

**In cfdisk interface:**

1. **Navigate to FREE SPACE** (using arrow keys)
2. Select **[ New ]**

**Create these partitions:**

```
┌────────────────────────────────────────────────┐
│ Partition Layout for Dual Boot                 │
├──────────┬─────────┬──────────┬────────────────┤
│ Partition│ Size    │ Type     │ Mount Point    │
├──────────┼─────────┼──────────┼────────────────┤
│ nvme0n1p1│ 100M    │ EFI      │ (Windows EFI)  │
│ nvme0n1p3│ 138G    │ NTFS     │ (Windows C:)   │
│ nvme0n1p4│ 30G     │ Linux    │ / (root)       │
│ nvme0n1p5│ 2G      │ Linux    │ [SWAP]         │
│ nvme0n1p6│ 68G     │ Linux    │ /home          │
└──────────┴─────────┴──────────┴────────────────┘
```

**Step-by-step in cfdisk:**

1. **Root Partition** (30GB):
   - Select [ New ] → Type: `30G` → Press Enter
   - Type: Keep as "Linux filesystem"

2. **Swap Partition** (2GB for 16GB RAM):
   - Select FREE SPACE → [ New ] → Type: `2G`
   - Select partition → [ Type ] → Select "Linux swap"

3. **Home Partition** (Remaining space):
   - Select FREE SPACE → [ New ] → Press Enter (use all remaining)
   - Type: Keep as "Linux filesystem"

4. **Write changes**: Select **[ Write ]** → Type: `yes` → Press Enter
5. **Quit**: Select **[ Quit ]**

#### 7. Verify Partitions

```bash
lsblk
# Should show:
# nvme0n1p4    30G   (Arch root)
# nvme0n1p5    2G    (Arch swap)
# nvme0n1p6    68G   (Arch home)
```

### Phase 3: Format Partitions

```bash
# Format root partition (ext4)
mkfs.ext4 /dev/nvme0n1p4

# Format home partition (ext4)
mkfs.ext4 /dev/nvme0n1p6

# Setup swap
mkswap /dev/nvme0n1p5
swapon /dev/nvme0n1p5

# DON'T format nvme0n1p1 (Windows EFI partition!)
```

### Phase 4: Mount Partitions

```bash
# Mount root partition
mount /dev/nvme0n1p4 /mnt

# Create and mount home
mkdir /mnt/home
mount /dev/nvme0n1p6 /mnt/home

# Mount EFI partition (shared with Windows)
mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi

# Verify mounts
lsblk
```

### Phase 5: Install Base System

#### 8. Select Fastest Mirrors (Optional but Recommended)

```bash
# Backup original mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

# Install reflector
pacman -Sy reflector

# Get fastest mirrors
reflector --country India,US --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

#### 9. Install Essential Packages

```bash
# Install base system
pacstrap /mnt base base-devel linux linux-firmware linux-headers

# Install essential tools
pacstrap /mnt \
    networkmanager \
    grub \
    efibootmgr \
    os-prober \
    dosfstools \
    mtools \
    nano \
    vim \
    git \
    sudo \
    wget \
    curl

# This will take 5-15 minutes depending on internet speed
```

### Phase 6: Configure System

#### 10. Generate fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab

# Verify fstab
cat /mnt/etc/fstab
```

#### 11. Chroot into New System

```bash
arch-chroot /mnt
```

**You're now inside your new Arch installation!**

#### 12. Set Timezone

```bash
# List available timezones
ls /usr/share/zoneinfo/

# Set timezone (example: India)
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

# Generate /etc/adjtime
hwclock --systohc
```

#### 13. Set Locale

```bash
# Edit locale.gen
nano /etc/locale.gen

# Uncomment these lines (remove # at start):
en_US.UTF-8 UTF-8
en_IN UTF-8  # Optional for India

# Save: Ctrl+O, Enter, Ctrl+X

# Generate locales
locale-gen

# Set system locale
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

#### 14. Set Hostname

```bash
# Choose a name for your computer
echo "arch-laptop" > /etc/hostname

# Configure hosts file
nano /etc/hosts

# Add these lines:
127.0.0.1   localhost
::1         localhost
127.0.1.1   arch-laptop.localdomain arch-laptop

# Save and exit
```

#### 15. Set Root Password

```bash
passwd
# Enter a strong password
# Confirm password
```

#### 16. Create User Account

```bash
# Create user (replace 'yourusername' with your desired username)
useradd -m -G wheel,storage,power,audio,video -s /bin/bash yourusername

# Set user password
passwd yourusername

# Give sudo privileges
EDITOR=nano visudo

# Uncomment this line (remove # at start):
%wheel ALL=(ALL:ALL) ALL

# Save: Ctrl+O, Enter, Ctrl+X
```

### Phase 7: Bootloader Setup (GRUB)

#### 17. Install GRUB

```bash
# Install GRUB to EFI partition
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

# Important: Enable os-prober for Windows detection
nano /etc/default/grub

# Find and uncomment (or add) this line:
GRUB_DISABLE_OS_PROBER=false

# Optional: Adjust timeout
GRUB_TIMEOUT=10

# Save and exit

# Mount Windows partition for os-prober
mkdir -p /mnt/windows
mount /dev/nvme0n1p3 /mnt/windows

# Generate GRUB config
grub-mkconfig -o /boot/grub/grub.cfg

# You should see: "Found Windows Boot Manager..."
```

#### 18. Enable NetworkManager

```bash
systemctl enable NetworkManager
```

### Phase 8: Final Steps

#### 19. Exit and Reboot

```bash
# Exit chroot
exit

# Unmount all partitions
umount -R /mnt

# Reboot
reboot
```

#### 20. Remove USB Drive

- Remove the USB drive during reboot
- System will boot to GRUB menu

---

## 🎉 Post-Installation Setup

### First Boot

1. **GRUB Menu** appears:
   ```
   ┌────────────────────────────────┐
   │  Arch Linux                    │
   │  Advanced options for Arch     │
   │  Windows Boot Manager          │
   │  UEFI Firmware Settings        │
   └────────────────────────────────┘
   ```

2. Select **"Arch Linux"** and press Enter

3. **Login** with your username and password

### Essential Post-Install Commands

```bash
# Connect to WiFi
nmcli device wifi list
nmcli device wifi connect "Your-WiFi" password "your-password"

# Update system
sudo pacman -Syu

# Install X11 display server (required for GUI)
sudo pacman -S xorg xorg-server

# Install additional firmware
sudo pacman -S linux-firmware intel-ucode  # For Intel CPU
# OR
sudo pacman -S linux-firmware amd-ucode    # For AMD CPU

# Reboot
sudo reboot
```

---

## 🎨 Running BlackArch Scripts

### Now You're Ready!

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/blackarch-i3-kvm-setup.git
cd blackarch-i3-kvm-setup

# Make scripts executable
chmod +x blackarch_i3_setup.sh
chmod +x troubleshoot.sh

# Run main setup script
sudo ./blackarch_i3_setup.sh

# Wait 20-60 minutes for installation
# Reboot when complete
sudo reboot
```

### After BlackArch Script Completes

1. System reboots to **LightDM login screen**
2. Enter your **username** and **password**
3. **i3 window manager** starts automatically
4. Press `Win + Enter` for terminal
5. Start exploring!

---

## 🔧 Troubleshooting

### GRUB Issues

#### Windows Not Detected in GRUB

```bash
# Boot into Arch Linux
sudo mount /dev/nvme0n1p3 /mnt
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```

#### Booting Directly to Windows (GRUB Skipped)

```bash
# Boot from USB again
mount /dev/nvme0n1p4 /mnt
mount /dev/nvme0n1p1 /mnt/boot/efi
arch-chroot /mnt
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
```

### Network Issues

```bash
# Check network interface
ip link

# Start NetworkManager
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# Connect to WiFi
nmtui  # Text-based UI
```

### Graphics Issues

```bash
# Install proper GPU drivers

# For Intel Graphics
sudo pacman -S mesa intel-media-driver

# For NVIDIA Graphics
sudo pacman -S nvidia nvidia-utils

# For AMD Graphics
sudo pacman -S mesa xf86-video-amdgpu
```

### Boot Issues

#### System Won't Boot After Installation

1. **Boot from USB again**
2. **Mount partitions**:
   ```bash
   mount /dev/nvme0n1p4 /mnt
   mount /dev/nvme0n1p1 /mnt/boot/efi
   arch-chroot /mnt
   ```
3. **Reinstall GRUB**:
   ```bash
   grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
   grub-mkconfig -o /boot/grub/grub.cfg
   ```

---

## 📊 Partition Layout Reference

### Recommended Layouts by Total Free Space

#### 60GB Free Space (Minimum)
```
Root (/)     : 25 GB
Swap         : 2 GB
Home (/home) : 33 GB
```

#### 100GB Free Space (Recommended)
```
Root (/)     : 30 GB
Swap         : 2 GB
Home (/home) : 68 GB
```

#### 200GB+ Free Space (Ideal)
```
Root (/)     : 50 GB
Swap         : 4 GB
Home (/home) : 146 GB
```

### Swap Size Recommendations

| RAM  | Swap Size | With Hibernation |
|------|-----------|------------------|
| 4 GB | 2 GB      | 6 GB             |
| 8 GB | 2 GB      | 10 GB            |
| 16 GB| 2 GB      | 18 GB            |
| 32 GB| 4 GB      | 36 GB            |

---

## ✅ Pre-Flight Checklist

Before starting installation:

- [ ] Backed up all important data
- [ ] Shrunk Windows partition (100GB+ free)
- [ ] Downloaded Arch Linux ISO
- [ ] Created bootable USB drive
- [ ] Disabled Fast Startup in Windows
- [ ] Disabled Secure Boot in BIOS
- [ ] Enabled Virtualization (VT-x/AMD-V) in BIOS
- [ ] Stable internet connection available
- [ ] USB keyboard/mouse if using laptop touchpad fails

---

## 🎯 Quick Command Reference

```bash
# WiFi Connection
nmcli device wifi connect "SSID" password "PASSWORD"

# Update System
sudo pacman -Syu

# Install Package
sudo pacman -S package-name

# Search Package
pacman -Ss package-name

# Remove Package
sudo pacman -Rns package-name

# Clean Package Cache
sudo pacman -Sc

# Fix Broken System
sudo pacman -Syyu
```

---

## 📚 Additional Resources

- [Arch Wiki - Installation Guide](https://wiki.archlinux.org/title/Installation_guide)
- [Arch Wiki - Dual Boot with Windows](https://wiki.archlinux.org/title/Dual_boot_with_Windows)
- [Arch Wiki - GRUB](https://wiki.archlinux.org/title/GRUB)
- [BlackArch Linux](https://blackarch.org)
- [i3 Window Manager](https://i3wm.org)

---

## ⚠️ Important Warnings

1. **Never** format or delete Windows partitions
2. **Always** backup important data before partitioning
3. **Verify** partition numbers before formatting
4. **Don't** interrupt the installation process
5. **Keep** your Windows installation media handy
6. **Test** each step before proceeding to the next

---

<div align="center">

**🎊 Congratulations on setting up your Arch + Windows dual boot system!**

**Now proceed with the BlackArch setup scripts.**

</div>