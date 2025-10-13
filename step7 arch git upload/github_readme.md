# BlackArch + i3WM + KVM Setup

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?logo=arch-linux&logoColor=fff)
![i3wm](https://img.shields.io/badge/i3-Window_Manager-orange)
![KVM](https://img.shields.io/badge/KVM-Virtualization-green)

**Automated setup script for BlackArch Linux with i3 tiling window manager and KVM virtualization**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Troubleshooting](#-troubleshooting) • [Customization](#-customization)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Post-Installation](#-post-installation)
- [Keyboard Shortcuts](#%EF%B8%8F-keyboard-shortcuts)
- [Troubleshooting](#-troubleshooting)
- [Customization](#-customization)
- [Additional Tools](#-additional-tools)
- [FAQ](#-faq)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🌟 Overview

This project provides an **automated installation script** that transforms a fresh Arch Linux installation into a fully-configured **penetration testing environment** with:

- 🕷️ **BlackArch** - Complete penetration testing toolkit
- 🪟 **i3 Window Manager** - Lightweight, keyboard-driven tiling WM
- 💻 **KVM/QEMU** - Hardware-accelerated virtualization
- 🎨 **Modern UI** - Rofi launcher, Polybar status bar, Picom compositor

Perfect for security researchers, penetration testers, and developers who need a powerful, minimalist setup optimized for productivity.

---

## ✨ Features

### Core Components

- ✅ **BlackArch Repository** - 2800+ security tools
- ✅ **i3 Window Manager** - Efficient tiling interface
- ✅ **KVM Virtualization** - Full QEMU/libvirt stack
- ✅ **LightDM** - Lightweight display manager
- ✅ **NetworkManager** - Network management
- ✅ **Alacritty** - GPU-accelerated terminal
- ✅ **Rofi** - Application launcher
- ✅ **Picom** - Compositor with transparency effects
- ✅ **Neovim** - Modern text editor

### Security Tools (Optional Install)

- 🔍 **Web Application Testing** - Burp Suite, SQLMap, Nikto
- 🌐 **Network Reconnaissance** - Nmap, Wireshark, tcpdump
- 🔓 **Exploitation** - Metasploit, ExploitDB
- 📡 **Wireless Testing** - Aircrack-ng suite
- 🔐 **Password Cracking** - John the Ripper, Hashcat
- 🕸️ **Directory Enumeration** - Gobuster, ffuf

---

## 📦 Requirements

### Hardware Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | Dual-core with VT-x/AMD-V | Quad-core or better |
| RAM | 8 GB | 16 GB or more |
| Storage | 60 GB | 120 GB+ SSD |
| Graphics | Integrated | Dedicated GPU |

### Software Requirements

- ✅ Fresh **Arch Linux** installation
- ✅ Internet connection
- ✅ Root/sudo access
- ✅ BIOS virtualization enabled (VT-x/AMD-V)

### Tested On

- 🖥️ ASUS TUF F15 Gaming Laptop
- 🖥️ ThinkPad T480 / T490
- 🖥️ Dell XPS 15
- 🖥️ Custom Desktop PCs

---

## 🚀 Installation

### Quick Install

```bash
# Download the script
git clone https://github.com/yourusername/blackarch-i3-setup.git
cd blackarch-i3-setup

# Make it executable
chmod +x blackarch_i3_setup.sh

# Run with sudo
sudo ./blackarch_i3_setup.sh
```

### What Gets Installed?

1. **Display Server**: Xorg + i3 window manager
2. **Applications**: Terminal, file manager, browser
3. **BlackArch**: Security testing tools repository
4. **Virtualization**: QEMU/KVM with Virt-Manager
5. **Utilities**: Network manager, volume control, compositor

### Installation Options

During installation, you'll be prompted:

```
Install full BlackArch tools (approx 20GB)? (y/N)
```

- **Yes**: Installs all 2800+ BlackArch tools (~20GB)
- **No**: Installs essential tool groups only (~5GB)
  - Web Application Testing
  - Reconnaissance
  - Exploitation
  - Wireless Testing

---

## 🔧 Post-Installation

### 1. Reboot Your System

```bash
sudo reboot
```

### 2. Login

- Select your username at LightDM
- Enter your password
- i3 will start automatically

### 3. First-Time i3 Setup

On first login, i3 will ask:
- Press `Enter` to generate config
- Press `Enter` to use Win/Super key as modifier

### 4. Add a Wallpaper (Optional)

```bash
# Download a wallpaper
wget -O ~/Pictures/wallpaper.jpg https://example.com/wallpaper.jpg

# Or use a local image
cp /path/to/your/image.jpg ~/Pictures/wallpaper.jpg

# Reload i3
Win + Shift + R
```

### 5. Verify Virtualization

```bash
# Check CPU support
lscpu | grep Virtualization

# Start a VM
virt-manager
```

---

## ⌨️ Keyboard Shortcuts

### Essential Shortcuts

| Shortcut | Action |
|----------|--------|
| `Win + Enter` | Open terminal (Alacritty) |
| `Win + D` | Application launcher (Rofi) |
| `Win + Shift + Q` | Close window |
| `Win + Shift + E` | Exit i3 |
| `Win + Shift + R` | Reload i3 configuration |
| `Win + Shift + C` | Restart i3 |

### Window Management

| Shortcut | Action |
|----------|--------|
| `Win + H` | Split horizontal |
| `Win + V` | Split vertical |
| `Win + F` | Toggle fullscreen |
| `Win + Shift + Space` | Toggle floating |
| `Win + J/K/L/;` | Focus windows |
| `Win + Shift + J/K/L/;` | Move windows |

### Workspaces

| Shortcut | Action |
|----------|--------|
| `Win + 1-9` | Switch to workspace 1-9 |
| `Win + Shift + 1-9` | Move window to workspace 1-9 |

### Custom Shortcuts

| Shortcut | Action |
|----------|--------|
| `Win + Ctrl + V` | Open Virt-Manager |
| `Win + B` | Open Firefox |
| `Win + R` | Resize mode |

### Resize Mode

Enter with `Win + R`, then:
- `J/K/L/;` or Arrow keys to resize
- `Enter` or `Esc` to exit

---

## 🔍 Troubleshooting

### Use the Troubleshooting Script

```bash
chmod +x troubleshoot.sh
./troubleshoot.sh
```

The script provides:
- 📊 System diagnostics
- 🪟 i3 configuration checks
- 💻 KVM/virtualization status
- 🔧 Automated fixes
- 📝 Log viewing

### Common Issues

#### i3 Not Starting

```bash
# Check configuration
i3 -C -c ~/.config/i3/config

# Regenerate config
i3-config-wizard
```

#### No Internet Connection

```bash
# Restart NetworkManager
sudo systemctl restart NetworkManager

# List WiFi networks
nmcli device wifi list

# Connect to network
nmcli device wifi connect "SSID" password "PASSWORD"
```

#### Virt-Manager Permission Denied

```bash
# Add user to libvirt group
sudo usermod -aG libvirt $USER

# Logout and login again
# Or start a new session
newgrp libvirt
```

#### KVM Not Working

```bash
# Check virtualization support
lscpu | grep Virtualization

# Check KVM modules
lsmod | grep kvm

# Start libvirt service
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

# Start default network
sudo virsh net-start default
sudo virsh net-autostart default
```

#### Display Issues

```bash
# Check available outputs
xrandr

# Set resolution
xrandr --output HDMI-1 --mode 1920x1080

# Reset to auto
xrandr --auto
```

#### Audio Not Working

```bash
# Install PulseAudio
sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol

# Start PulseAudio
pulseaudio --start

# Open mixer
pavucontrol
```

### View Logs

```bash
# Xorg logs
less ~/.local/share/xorg/Xorg.0.log

# LightDM logs
sudo journalctl -u lightdm

# i3 logs
less ~/.local/share/i3/i3log

# System logs
journalctl -b
```

---

## 🎨 Customization

### Change Terminal

Edit `~/.config/i3/config`:

```bash
# Replace alacritty with your preferred terminal
bindsym $mod+Return exec terminator
```

### Change App Launcher

```bash
# Replace rofi with dmenu
bindsym $mod+d exec dmenu_run
```

### Add Custom Shortcuts

```bash
# Open in ~/.config/i3/config
nano ~/.config/i3/config

# Add custom bindings
bindsym $mod+Ctrl+b exec firefox
bindsym $mod+Ctrl+f exec thunar
bindsym $mod+Ctrl+n exec wireshark

# Reload i3
Win + Shift + R
```

### Change Wallpaper

```bash
# Static wallpaper
feh --bg-fill ~/Pictures/wallpaper.jpg

# Random wallpaper from directory
feh --bg-fill --randomize ~/Pictures/wallpapers/*
```

### Install a Status Bar (Polybar)

```bash
# Install polybar
sudo pacman -S polybar

# Get a config
git clone --depth=1 https://github.com/polybar/polybar.git
cp polybar/doc/config.ini ~/.config/polybar/config.ini

# Edit i3 config to use polybar instead
nano ~/.config/i3/config
# Comment out the bar section
# Add: exec_always --no-startup-id polybar
```

### Themes and Colors

```bash
# Install lxappearance for GTK themes
sudo pacman -S lxappearance

# Install themes
sudo pacman -S arc-gtk-theme papirus-icon-theme

# Apply with lxappearance
lxappearance
```

---

## 🛠️ Additional Tools

### Install Development Tools

```bash
sudo pacman -S git vim code nodejs npm python python-pip go rust
```

### Install Docker

```bash
sudo pacman -S docker docker-compose
sudo systemctl enable docker
sudo usermod -aG docker $USER
```

### Install Penetration Testing Tools

```bash
# Web testing
sudo pacman -S burpsuite sqlmap nikto

# Network scanning
sudo pacman -S nmap wireshark-qt masscan

# Exploitation
sudo pacman -S metasploit exploitdb

# Password cracking
sudo pacman -S john hashcat

# Wireless testing
sudo pacman -S aircrack-ng
```

### Install Productivity Apps

```bash
sudo pacman -S \
    firefox thunderbird \
    libreoffice-fresh \
    gimp inkscape \
    vlc obs-studio \
    qbittorrent
```

---

## ❓ FAQ

### Q: Can I use this on an existing Arch installation?

**A:** Yes, but backup your data first. The script installs packages and modifies configurations.

### Q: How much disk space do I need?

**A:** Minimum 60GB. Recommended 120GB+ if installing all BlackArch tools.

### Q: Will this work on a virtual machine?

**A:** Yes, but nested virtualization must be enabled. KVM performance will be limited.

### Q: Can I use a different window manager?

**A:** Yes, but you'll need to modify the script. The i3-specific configuration won't apply.

### Q: How do I update BlackArch tools?

**A:** Run `sudo pacman -Syu` regularly to update all packages including BlackArch tools.

### Q: Is this beginner-friendly?

**A:** Basic Linux knowledge is recommended. i3 has a learning curve but is well-documented.

### Q: Can I dual-boot with Windows?

**A:** Yes, install Arch/BlackArch first, then Windows, then restore GRUB bootloader.

### Q: How do I uninstall?

**A:** BlackArch is a repository, not a distro. Remove packages individually or reinstall Arch.

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Guidelines

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Areas for Improvement

- [ ] Add more window manager options (bspwm, awesome)
- [ ] Create automated backup/restore functionality
- [ ] Add theme switching script
- [ ] Improve error handling
- [ ] Add support for other distributions

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [BlackArch Linux](https://blackarch.org/) - Penetration testing distribution
- [i3 Window Manager](https://i3wm.org/) - Tiling window manager
- [Arch Linux](https://archlinux.org/) - The foundation
- [KVM/QEMU](https://www.linux-kvm.org/) - Virtualization

---

## 📞 Support

- 📧 Email: your-email@example.com
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/blackarch-i3-setup/issues)
- 💬 Discord: [Join our server](https://discord.gg/yourserver)
- 📖 Wiki: [Project Wiki](https://github.com/yourusername/blackarch-i3-setup/wiki)

---

<div align="center">

**⭐ Star this repo if you found it helpful!**

Made with ❤️ by security enthusiasts

</div>