#!/bin/bash
# ================================================================
#  BlackArch + i3WM + KVM Setup Script (for Arch Linux)
#  Optimized for ASUS TUF F15 (16GB RAM, virtualization ready)
# ================================================================

# --- 0. Root Privilege Check ---
if [[ $EUID -ne 0 ]]; then
  echo "❌ Please run this script as root (use: sudo ./blackarch_i3_setup.sh)"
  exit 1
fi

# Store the actual user (not root)
ACTUAL_USER="${SUDO_USER:-$USER}"
USER_HOME=$(getent passwd "$ACTUAL_USER" | cut -d: -f6)

if [[ -z "$ACTUAL_USER" ]] || [[ "$ACTUAL_USER" == "root" ]]; then
  echo "❌ Could not determine non-root user. Please run with sudo from a regular user account."
  exit 1
fi

echo "🔍 Running as root for user: $ACTUAL_USER"
echo "⚙️  Updating system..."
pacman -Syu --noconfirm

# --- 1. Install Xorg + i3 + Essentials ---
echo "📦 Installing i3 window manager and essentials..."
pacman -S --noconfirm xorg xorg-xinit i3-wm i3status dmenu feh picom thunar \
    rofi polybar lightdm lightdm-gtk-greeter alacritty neovim networkmanager \
    network-manager-applet volumeicon btop firefox

# Enable services
systemctl enable lightdm
systemctl enable NetworkManager

# --- 2. Add BlackArch Repository ---
echo "🕷️  Adding BlackArch repository..."
cd /tmp || exit 1
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh
pacman -Syu --noconfirm

# Install core BlackArch tool groups (optional prompt)
echo ""
echo "Install full BlackArch tools (approx 20GB)? (y/N)"
read -r blackarch_full
if [[ "$blackarch_full" =~ ^[Yy]$ ]]; then
  pacman -S --noconfirm blackarch
else
  echo "Installing essential tool groups only..."
  pacman -S --noconfirm blackarch-webapp blackarch-recon blackarch-exploitation blackarch-wireless
fi

# --- 3. Install KVM + Virt-Manager Virtualization Stack ---
echo "💻 Installing virtualization packages..."
pacman -S --noconfirm qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils \
    openbsd-netcat ebtables iptables-nft libvirt

# Enable and start libvirt daemon
systemctl enable libvirtd
systemctl start libvirtd

# Add user to libvirt group
usermod -aG libvirt "$ACTUAL_USER"

# Configure default network for libvirt
virsh net-autostart default 2>/dev/null || true
virsh net-start default 2>/dev/null || true

# --- 4. Configure i3 Defaults ---
echo "🧩 Configuring i3 keybinds and startup..."
mkdir -p "$USER_HOME/.config/i3"
cat > "$USER_HOME/.config/i3/config" << 'EOF'
# ================================================================
#  i3 Window Manager Configuration (Optimized for Pentesting)
# ================================================================
set $mod Mod4   # Use Super/Windows key
font pango:monospace 10

# Launch Terminal and App Launcher
bindsym $mod+Return exec alacritty
bindsym $mod+d exec rofi -show drun
bindsym $mod+Shift+q kill

# Split Layouts
bindsym $mod+h split h
bindsym $mod+v split v

# Toggle fullscreen
bindsym $mod+f fullscreen toggle

# Change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# Focus Movement
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# Arrow key alternatives
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# Move Windows
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# Arrow key alternatives for moving
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# Workspaces
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# Switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# Move container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# Reload / Restart / Exit
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Exit i3?' -B 'Yes' 'i3-msg exit'"

# Virt-Manager Shortcut
bindsym $mod+Control+v exec virt-manager

# Firefox Browser
bindsym $mod+b exec firefox

# Resize mode
mode "resize" {
    bindsym j resize shrink width 10 px or 10 ppt
    bindsym k resize grow height 10 px or 10 ppt
    bindsym l resize shrink height 10 px or 10 ppt
    bindsym semicolon resize grow width 10 px or 10 ppt

    bindsym Left resize shrink width 10 px or 10 ppt
    bindsym Down resize grow height 10 px or 10 ppt
    bindsym Up resize shrink height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt

    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+r mode "default"
}
bindsym $mod+r mode "resize"

# Launch Utilities
exec --no-startup-id nm-applet
exec --no-startup-id volumeicon
exec --no-startup-id picom --experimental-backends
exec_always --no-startup-id feh --bg-fill ~/Pictures/wallpaper.jpg 2>/dev/null || feh --bg-fill /usr/share/pixmaps/archlinux-logo.png 2>/dev/null

# Status Bar
bar {
    status_command i3status
    position top
}
EOF

# Set correct ownership
chown -R "$ACTUAL_USER:$ACTUAL_USER" "$USER_HOME/.config"

# Create Pictures directory and set permissions
mkdir -p "$USER_HOME/Pictures"
chown -R "$ACTUAL_USER:$ACTUAL_USER" "$USER_HOME/Pictures"

# Create .xinitrc for manual startx (optional)
echo "exec i3" > "$USER_HOME/.xinitrc"
chown "$ACTUAL_USER:$ACTUAL_USER" "$USER_HOME/.xinitrc"

# --- 5. Final Touches ---
echo ""
echo "✅ Setup complete!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  👤 User: $ACTUAL_USER"
echo "  🖥️  Display Manager: LightDM"
echo "  🪟 Window Manager: i3"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📌 Important Notes:"
echo "   • Reboot your system to enter i3WM"
echo "   • Add a wallpaper to ~/Pictures/wallpaper.jpg"
echo "   • Log out and back in for group changes to take effect"
echo ""
echo "⌨️  Key Shortcuts:"
echo "   • Win + Enter        → Terminal (Alacritty)"
echo "   • Win + D            → App Launcher (Rofi)"
echo "   • Win + Ctrl + V     → Virt-Manager (VMs)"
echo "   • Win + B            → Firefox Browser"
echo "   • Win + Shift + Q    → Close Window"
echo "   • Win + Shift + E    → Exit i3"
echo "   • Win + 1-9          → Switch Workspaces"
echo ""
echo "🔧 Post-Installation Commands:"
echo "   • Check virtualization: lscpu | grep Virtualization"
echo "   • Manage VMs: virt-manager"
echo "   • Update BlackArch: sudo pacman -Syu"
echo "   • Configure KVM network: virsh net-list --all"
echo ""
echo "🖥️  Enjoy your optimized BlackArch + i3 + KVM environment!"
echo ""