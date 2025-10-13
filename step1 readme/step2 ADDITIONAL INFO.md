ADDITIONAL INFO
Excellent summary — and you’re absolutely right:
for **BlackArch on your TUF F15**, **i3wm** is the *optimal* choice when you prioritize **maximum performance** for virtualization, multitasking, and pentesting workflows.

Let’s turn your overview into a **complete, ready-to-use setup plan** (so you can go from bare Arch to a polished i3wm + KVM/virt-manager environment quickly).

---

## ⚙️ Step-by-Step: BlackArch + i3wm + Virtualization Setup

### 🧩 1. Install Xorg + i3wm + Core Utilities

```bash
sudo pacman -Syu
sudo pacman -S xorg xorg-xinit i3-gaps i3status dmenu feh picom thunar lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
```

Optionally add **rofi** (better app launcher) and **polybar** (modern status bar):

```bash
sudo pacman -S rofi polybar
```

---

### 🧠 2. Add BlackArch Repository

```bash
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
```

Install only what you need:

```bash
sudo pacman -S blackarch-webapp blackarch-recon blackarch-exploitation
```

---

### 🖥️ 3. Install Virtualization Stack (for running VMs)

```bash
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo usermod -aG libvirt $USER
```

Then reboot:

```bash
sudo reboot
```

After login, launch Virt-Manager (you’ll configure your VMs there).

---

### 🎛️ 4. i3 Configuration Enhancements

After first login, i3 will generate a config at:

```
~/.config/i3/config
```

#### Add keybinding for Virt-Manager:

```bash
bindsym $mod+Control+v exec virt-manager
```

#### Launch compositor and wallpaper at startup:

```bash
exec --no-startup-id picom --experimental-backends
exec --no-startup-id feh --bg-fill ~/Pictures/wallpaper.jpg
```

#### Launch essential tools on startup:

```bash
exec --no-startup-id nm-applet
exec --no-startup-id volumeicon
```

---

### 🧰 5. Optional Power Tools for Workflow

| Tool                       | Purpose                           | Command                         |
| -------------------------- | --------------------------------- | ------------------------------- |
| **alacritty** or **kitty** | Fast GPU-based terminal           | `sudo pacman -S alacritty`      |
| **neovim**                 | Better editor for configs/scripts | `sudo pacman -S neovim`         |
| **htop / btop**            | Monitor resource usage            | `sudo pacman -S btop`           |
| **nmtui**                  | Manage Wi-Fi easily in terminal   | `sudo pacman -S networkmanager` |

---

### ⚡ 6. Performance Tips for Virtualization

* In BIOS, ensure **Intel VT-x** and **VT-d** (or AMD-V/IOMMU) are enabled.
* Use **virtio** drivers for disk & network in your VMs.
* Store VM disks on **ext4/Btrfs** partitions (avoid NTFS if dual-booting).
* Give each VM:

  * 4–8 GB RAM
  * 2–4 CPU cores
  * Enable nested virtualization if running other hypervisors inside.

---

### 🧠 7. Learn & Customize i3wm

* Official docs: [https://i3wm.org/docs/userguide.html](https://i3wm.org/docs/userguide.html)
* ArchWiki: [https://wiki.archlinux.org/title/I3](https://wiki.archlinux.org/title/I3)
* For aesthetic setups (“ricing”):

  * Check r/unixporn (search for “i3 rice”)
  * Try **pywal** for dynamic theming:

    ```bash
    sudo pacman -S pywal
    wal -i ~/Pictures/wallpaper.jpg
    ```

---

### ✅ Final Result

After reboot, you’ll have:

* **i3wm:** ultra-light, keyboard-driven workspace
* **Virt-Manager (KVM/QEMU):** smooth VM handling
* **BlackArch tools:** for pentesting and security research
* **Feh + Picom + Polybar:** for visuals and productivity

---

Would you like me to give you a **single all-in-one script** you can run to set up this entire i3 + BlackArch + KVM environment automatically (with safe prompts)?




