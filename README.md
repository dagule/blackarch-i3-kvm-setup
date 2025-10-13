# 🐧 BlackArch Linux i3WM KVM Setup

<div align="center">

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![BlackArch](https://img.shields.io/badge/BlackArch-000000?style=for-the-badge&logo=linux&logoColor=white)
![i3wm](https://img.shields.io/badge/i3-Window_Manager-orange?style=for-the-badge)
![KVM](https://img.shields.io/badge/KVM-Virtualization-green?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)

**Complete automation suite for setting up BlackArch Linux with i3 tiling window manager and KVM virtualization**

*Perfect for penetration testers, security researchers, and power users*

[Quick Start](#-quick-start) • [Features](#-features) • [Installation](#-installation-guide) • [Documentation](#-documentation)

</div>

---

## 📖 Overview

This repository provides a **complete, automated setup** for transforming a fresh Arch Linux installation into a powerful **penetration testing workstation** with:

- 🕷️ **BlackArch Tools** - 2800+ security testing tools
- 🪟 **i3 Window Manager** - Lightweight, keyboard-driven tiling WM
- 💻 **KVM Virtualization** - Full QEMU/libvirt stack for running VMs
- 🎨 **Modern UI** - Rofi launcher, Polybar status bar, Picom compositor
- 📚 **Complete Documentation** - From Windows dual-boot to final setup

---

## ✨ Features

### 🔧 Core Components

- ✅ **Automated BlackArch Repository Setup**
- ✅ **i3 Window Manager** with optimized configuration
- ✅ **KVM/QEMU Virtualization** with Virt-Manager GUI
- ✅ **LightDM Display Manager** for graphical login
- ✅ **NetworkManager** with GUI applet
- ✅ **Essential Applications**: Terminal, browser, file manager
- ✅ **System Optimization** scripts included

### 🛠️ Security Tools (Optional)

- 🌐 **Web Testing**: Burp Suite, SQLMap, Nikto
- 🔍 **Reconnaissance**: Nmap, Wireshark, Masscan
- 🔓 **Exploitation**: Metasploit, ExploitDB
- 📡 **Wireless**: Aircrack-ng suite
- 🔐 **Password Cracking**: John the Ripper, Hashcat
- 🕸️ **Directory Enumeration**: Gobuster, ffuf

### 🎯 Optimized For

- 💻 **ASUS TUF F15** Gaming Laptops
- 💻 **ThinkPad** Series (T480, T490, X1)
- 💻 **Dell XPS** 13/15
- 💻 **Custom Desktop PCs**
- 🖥️ **16GB+ RAM** systems with virtualization support

---

## 🚀 Quick Start

### Prerequisites

- ✅ Arch Linux installed (or Windows for dual-boot)
- ✅ Internet connection
- ✅ 60GB+ free disk space
- ✅ Root/sudo access

### One-Command Installation

```bash
# Clone repository
git clone https://github.com/NETHRANAND-20449/blackarch-i3-kvm-setup.git

# Navigate to directory
cd blackarch-i3-kvm-setup

# Make scripts executable
chmod +x step3\ gui\ setup/blackarch_setup.sh
chmod +x step4\ gui\ troubleshoot/troubleshooting_script.sh

# Run main setup script
sudo ./step3\ gui\ setup/blackarch_setup.sh
```

**⏱️ Installation Time**: 20-60 minutes depending on internet speed and selected options.

---

## 📚 Documentation

This repository includes comprehensive guides for every step:

### 📁 Repository Structure

```
blackarch-i3-kvm-setup/
│
├── 📄 step1 readme/
│   └── Main documentation and project overview
│
├── 🐧 step2 installation guide/
│   └── arch_dualboot_guide.md
│       • Complete Arch Linux installation from scratch
│       • Windows dual-boot setup
│       • Partitioning guide with examples
│       • BIOS/UEFI configuration
│       • Post-installation basics
│
├── ⚙️ step3 gui setup/
│   └── blackarch_setup.sh
│       • Main automated setup script
│       • BlackArch repository installation
│       • i3 window manager configuration
│       • KVM/QEMU virtualization setup
│       • Essential tools installation
│
├── 🔧 step4 gui troubleshoot/
│   └── troubleshooting_script.sh
│       • Interactive troubleshooting menu
│       • System diagnostics
│       • i3 configuration checker
│       • KVM/virtualization diagnostics
│       • Automated common fixes
│       • Log viewer
│
├── 🎯 step5 optimization/
│   └── System optimization tips and scripts
│
├── 💪 step6 maximum hardware usage/
│   └── Performance tuning for your hardware
│
└── 📤 step7 arch git upload/
    ├── github_readme.md - Extended documentation
    └── github_upload_guide.md - Git workflow guide
```

---

## 📋 Installation Guide

### Step 1: Prepare Your System

**If you have Windows installed:**
1. Follow [`step2 installation guide/arch_dualboot_guide.md`](step2%20installation%20guide/arch_dualboot_guide.md)
2. This guide covers:
   - Shrinking Windows partition
   - Creating bootable USB
   - Installing Arch Linux alongside Windows
   - GRUB dual-boot setup

**If you have Arch Linux already:**
- Skip to Step 2

### Step 2: Run Main Setup Script

```bash
# Clone repository
git clone https://github.com/NETHRANAND-20449/blackarch-i3-kvm-setup.git
cd blackarch-i3-kvm-setup

# Make executable
chmod +x "step3 gui setup/blackarch_setup.sh"

# Run as root
sudo ./step3\ gui\ setup/blackarch_setup.sh
```

**During installation you'll be asked:**
```
Install full BlackArch tools (approx 20GB)? (y/N)
```
- **Yes**: Installs all 2800+ tools (~20GB)
- **No**: Installs essential categories only (~5GB)

### Step 3: Reboot and Login

```bash
sudo reboot
```

- System boots to **LightDM** login screen
- Enter your username and password
- **i3 window manager** starts automatically

### Step 4: First-Time i3 Setup

On first login, i3 will prompt:
1. Press `Enter` to generate config file
2. Press `Enter` to use **Win/Super** key as modifier

### Step 5: Verify Installation

```bash
# Check virtualization support
lscpu | grep Virtualization

# Launch Virt-Manager
virt-manager
```

---

## ⌨️ Keyboard Shortcuts

### Essential i3 Shortcuts

| Shortcut | Action |
|----------|--------|
| `Win + Enter` | Open terminal (Alacritty) |
| `Win + D` | Application launcher (Rofi) |
| `Win + Shift + Q` | Close window |
| `Win + Shift + E` | Exit i3 |
| `Win + Shift + R` | Reload i3 configuration |

### Window Management

| Shortcut | Action |
|----------|--------|
| `Win + H` | Split horizontal |
| `Win + V` | Split vertical |
| `Win + F` | Toggle fullscreen |
| `Win + 1-9` | Switch to workspace 1-9 |
| `Win + Shift + 1-9` | Move window to workspace |

### Custom Shortcuts

| Shortcut | Action |
|----------|--------|
| `Win + Ctrl + V` | Open Virt-Manager (VMs) |
| `Win + B` | Open Firefox browser |
| `Win + R` | Resize mode |

---

## 🔧 Troubleshooting

### Use the Troubleshooting Script

```bash
cd blackarch-i3-kvm-setup
chmod +x "step4 gui troubleshoot/troubleshooting_script.sh"
./step4\ gui\ troubleshoot/troubleshooting_script.sh
```

**The script provides:**
- 📊 System diagnostics (CPU, RAM, disk, network)
- 🪟 i3 configuration validation
- 💻 KVM/virtualization checks
- 🔧 Automated fixes for common issues
- 📝 Log viewer for debugging
- ⚡ Quick fix menu

### Common Issues

#### i3 Not Starting
```bash
i3 -C -c ~/.config/i3/config  # Check config
i3-config-wizard              # Regenerate config
```

#### No Internet
```bash
sudo systemctl restart NetworkManager
nmcli device wifi connect "SSID" password "PASSWORD"
```

#### Virt-Manager Permission Denied
```bash
sudo usermod -aG libvirt $USER
# Logout and login again
```

#### KVM Not Working
```bash
lscpu | grep Virtualization       # Check CPU support
sudo systemctl start libvirtd     # Start service
sudo virsh net-start default      # Start network
```

---

## 🎨 Customization

### Change Terminal
Edit `~/.config/i3/config`:
```bash
bindsym $mod+Return exec kitty    # Replace alacritty
```

### Add Custom Shortcuts
```bash
nano ~/.config/i3/config

# Add lines like:
bindsym $mod+Ctrl+b exec firefox
bindsym $mod+Ctrl+f exec thunar
bindsym $mod+Ctrl+w exec wireshark
```

### Install Additional Tools
```bash
# Web testing
sudo pacman -S burpsuite sqlmap nikto

# Development
sudo pacman -S code docker python-pip nodejs

# Productivity
sudo pacman -S libreoffice-fresh gimp vlc
```

---

## 📊 System Requirements

### Minimum Requirements

| Component | Specification |
|-----------|---------------|
| **CPU** | Dual-core 64-bit with VT-x/AMD-V |
| **RAM** | 8 GB |
| **Storage** | 60 GB free space |
| **Graphics** | Integrated graphics |
| **Boot** | UEFI mode |

### Recommended Requirements

| Component | Specification |
|-----------|---------------|
| **CPU** | Quad-core Intel i5/AMD Ryzen 5+ |
| **RAM** | 16 GB or more |
| **Storage** | 120 GB+ SSD |
| **Graphics** | Dedicated GPU (NVIDIA/AMD) |
| **Network** | WiFi 5/6 or Ethernet |

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### Ways to Contribute

- 🐛 **Report bugs** via [Issues](https://github.com/NETHRANAND-20449/blackarch-i3-kvm-setup/issues)
- 💡 **Suggest features** or improvements
- 📝 **Improve documentation**
- 🔧 **Submit pull requests**

### Development Setup

```bash
# Fork the repository
# Clone your fork
git clone https://github.com/YOUR_USERNAME/blackarch-i3-kvm-setup.git

# Create feature branch
git checkout -b feature/amazing-feature

# Make changes and commit
git commit -m "Add amazing feature"

# Push to your fork
git push origin feature/amazing-feature

# Open Pull Request
```

---

## ❓ FAQ

### Q: Can I use this on an existing Arch installation?

**A:** Yes! The script checks for existing packages and won't break your setup. Backup important configs first.

### Q: How much disk space do I need?

**A:** Minimum 60GB. Recommended 120GB+ if installing all BlackArch tools.

### Q: Will this work in a virtual machine?

**A:** Yes, but KVM performance will be limited. Enable nested virtualization in your hypervisor.

### Q: Can I uninstall everything later?

**A:** Yes. BlackArch is just a repository. Remove packages individually or reinstall Arch.

### Q: Does this work with NVIDIA GPUs?

**A:** Yes. The script installs appropriate drivers. You may need to configure Optimus for laptops.

### Q: How do I update BlackArch tools?

**A:** Run `sudo pacman -Syu` regularly to update all packages including BlackArch tools.

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [Arch Linux](https://archlinux.org/) - The foundation
- [BlackArch Linux](https://blackarch.org/) - Penetration testing distribution
- [i3 Window Manager](https://i3wm.org/) - Tiling window manager
- [KVM/QEMU](https://www.linux-kvm.org/) - Virtualization platform

---

## 📞 Support & Contact

- 🐛 **Issues**: [GitHub Issues](https://github.com/NETHRANAND-20449/blackarch-i3-kvm-setup/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/NETHRANAND-20449/blackarch-i3-kvm-setup/discussions)
- 📧 **Email**: [Your Email]
- 🌐 **Website**: [Your Website]

---

## 🗺️ Roadmap

- [ ] Add support for Wayland/Sway
- [ ] Create Ansible playbook version
- [ ] Add automated backup/restore
- [ ] Theme customization script
- [ ] Docker integration improvements
- [ ] Support for other window managers (bspwm, awesome)

---

## 📈 Project Stats

![GitHub stars](https://img.shields.io/github/stars/NETHRANAND-20449/blackarch-i3-kvm-setup?style=social)
![GitHub forks](https://img.shields.io/github/forks/NETHRANAND-20449/blackarch-i3-kvm-setup?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/NETHRANAND-20449/blackarch-i3-kvm-setup?style=social)

---

## 🎯 Quick Links

- 📖 [Arch Wiki - Installation Guide](https://wiki.archlinux.org/title/Installation_guide)
- 📖 [Arch Wiki - Dual Boot with Windows](https://wiki.archlinux.org/title/Dual_boot_with_Windows)
- 📖 [i3 User's Guide](https://i3wm.org/docs/userguide.html)
- 📖 [BlackArch Guide](https://blackarch.org/guide.html)
- 📖 [KVM Virtualization](https://wiki.archlinux.org/title/KVM)

---

<div align="center">

### ⭐ Star this repository if you found it helpful!

**Made with ❤️ for the security and open-source community**

---

**🎊 Happy Hacking! 🐧**

</div>
