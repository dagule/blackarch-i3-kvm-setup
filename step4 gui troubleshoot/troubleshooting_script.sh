#!/bin/bash
# ================================================================
#  BlackArch + i3WM + KVM Troubleshooting & Utilities Script
#  Post-installation tools and diagnostics
# ================================================================

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Display banner
banner() {
    echo -e "${BLUE}"
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║     BlackArch i3 Troubleshooting & Utilities         ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Check if running as root when needed
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}❌ This operation requires root privileges${NC}"
        echo "Please run: sudo $0 $1"
        exit 1
    fi
}

# System diagnostics
system_diagnostics() {
    echo -e "${GREEN}=== System Diagnostics ===${NC}\n"
    
    echo -e "${BLUE}📊 CPU & Virtualization:${NC}"
    lscpu | grep -E "Model name|Virtualization|CPU\(s\)"
    echo ""
    
    echo -e "${BLUE}💾 Memory Usage:${NC}"
    free -h
    echo ""
    
    echo -e "${BLUE}💿 Disk Usage:${NC}"
    df -h | grep -E "Filesystem|/dev/sd|/dev/nvme"
    echo ""
    
    echo -e "${BLUE}🖥️ Display Server:${NC}"
    echo "Current Session: $XDG_SESSION_TYPE"
    echo "Display: $DISPLAY"
    echo ""
    
    echo -e "${BLUE}🌐 Network Status:${NC}"
    nmcli device status
    echo ""
    
    echo -e "${BLUE}🔌 Active Services:${NC}"
    systemctl is-active NetworkManager lightdm libvirtd
    echo ""
}

# i3 troubleshooting
i3_troubleshooting() {
    echo -e "${GREEN}=== i3 Window Manager Diagnostics ===${NC}\n"
    
    echo -e "${BLUE}📝 Checking i3 configuration:${NC}"
    if i3 -C -c ~/.config/i3/config &>/dev/null; then
        echo -e "${GREEN}✅ i3 config is valid${NC}"
    else
        echo -e "${RED}❌ i3 config has errors:${NC}"
        i3 -C -c ~/.config/i3/config
    fi
    echo ""
    
    echo -e "${BLUE}🔍 i3 Process Status:${NC}"
    if pgrep -x i3 > /dev/null; then
        echo -e "${GREEN}✅ i3 is running (PID: $(pgrep -x i3))${NC}"
    else
        echo -e "${YELLOW}⚠️ i3 is not running${NC}"
    fi
    echo ""
    
    echo -e "${BLUE}📂 i3 Config Location:${NC}"
    if [ -f ~/.config/i3/config ]; then
        echo -e "${GREEN}✅ Config found at: ~/.config/i3/config${NC}"
        echo "Last modified: $(stat -c %y ~/.config/i3/config)"
    else
        echo -e "${RED}❌ No i3 config found${NC}"
    fi
    echo ""
    
    echo -e "${BLUE}🎨 Checking dependencies:${NC}"
    for pkg in alacritty rofi picom feh polybar; do
        if command -v $pkg &> /dev/null; then
            echo -e "${GREEN}✅ $pkg installed${NC}"
        else
            echo -e "${YELLOW}⚠️ $pkg not found${NC}"
        fi
    done
    echo ""
}

# KVM/Virtualization troubleshooting
kvm_troubleshooting() {
    echo -e "${GREEN}=== KVM/Virtualization Diagnostics ===${NC}\n"
    
    echo -e "${BLUE}🔧 Virtualization Support:${NC}"
    if grep -E "vmx|svm" /proc/cpuinfo > /dev/null; then
        echo -e "${GREEN}✅ Hardware virtualization enabled${NC}"
        grep -E "vmx|svm" /proc/cpuinfo | head -1
    else
        echo -e "${RED}❌ Hardware virtualization NOT detected${NC}"
        echo "Enable VT-x/AMD-V in BIOS/UEFI"
    fi
    echo ""
    
    echo -e "${BLUE}🐧 KVM Module Status:${NC}"
    if lsmod | grep -q kvm; then
        echo -e "${GREEN}✅ KVM modules loaded:${NC}"
        lsmod | grep kvm
    else
        echo -e "${RED}❌ KVM modules not loaded${NC}"
    fi
    echo ""
    
    echo -e "${BLUE}🔌 Libvirt Service:${NC}"
    systemctl status libvirtd --no-pager | head -5
    echo ""
    
    echo -e "${BLUE}🌐 Virtual Networks:${NC}"
    if command -v virsh &> /dev/null; then
        sudo virsh net-list --all
    else
        echo -e "${RED}❌ virsh command not found${NC}"
    fi
    echo ""
    
    echo -e "${BLUE}👥 User Groups:${NC}"
    if groups | grep -q libvirt; then
        echo -e "${GREEN}✅ User is in libvirt group${NC}"
    else
        echo -e "${RED}❌ User NOT in libvirt group${NC}"
        echo "Run: sudo usermod -aG libvirt $USER"
        echo "Then logout and login again"
    fi
    echo ""
}

# Fix common issues
fix_common_issues() {
    check_root "fix"
    
    echo -e "${GREEN}=== Fixing Common Issues ===${NC}\n"
    
    echo -e "${BLUE}1. Restarting display manager...${NC}"
    systemctl restart lightdm
    
    echo -e "${BLUE}2. Restarting NetworkManager...${NC}"
    systemctl restart NetworkManager
    
    echo -e "${BLUE}3. Restarting libvirtd...${NC}"
    systemctl restart libvirtd
    
    echo -e "${BLUE}4. Starting default network...${NC}"
    virsh net-start default 2>/dev/null || echo "Already started"
    virsh net-autostart default
    
    echo -e "${BLUE}5. Fixing permissions...${NC}"
    chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config
    
    echo -e "${GREEN}✅ Common fixes applied${NC}\n"
}

# Install additional tools
install_extras() {
    check_root "install-extras"
    
    echo -e "${GREEN}=== Installing Additional Useful Tools ===${NC}\n"
    
    echo -e "${BLUE}📦 Installing system tools...${NC}"
    pacman -S --noconfirm --needed \
        git wget curl vim \
        htop neofetch \
        unzip p7zip \
        net-tools inetutils \
        tcpdump wireshark-qt \
        nmap zenmap \
        metasploit \
        john hashcat \
        burpsuite \
        sqlmap \
        aircrack-ng \
        hydra \
        gobuster \
        ffuf \
        whatweb \
        nikto \
        sslscan \
        enum4linux \
        exploitdb \
        man-db man-pages
    
    echo -e "${BLUE}🔧 Installing development tools...${NC}"
    pacman -S --noconfirm --needed \
        python python-pip \
        python-virtualenv \
        go rust \
        nodejs npm \
        docker docker-compose
    
    echo -e "${BLUE}🎨 Installing additional GUI tools...${NC}"
    pacman -S --noconfirm --needed \
        code \
        gparted \
        flameshot \
        vlc \
        qbittorrent
    
    systemctl enable docker
    usermod -aG docker $SUDO_USER
    
    echo -e "${GREEN}✅ Additional tools installed${NC}\n"
}

# Performance optimization
optimize_system() {
    check_root "optimize"
    
    echo -e "${GREEN}=== Optimizing System Performance ===${NC}\n"
    
    echo -e "${BLUE}1. Configuring swappiness...${NC}"
    echo "vm.swappiness=10" > /etc/sysctl.d/99-swappiness.conf
    sysctl -p /etc/sysctl.d/99-swappiness.conf
    
    echo -e "${BLUE}2. Enabling SSD TRIM (if applicable)...${NC}"
    systemctl enable fstrim.timer
    
    echo -e "${BLUE}3. Optimizing makepkg for faster builds...${NC}"
    sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/' /etc/makepkg.conf
    
    echo -e "${BLUE}4. Configuring pacman for parallel downloads...${NC}"
    sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
    
    echo -e "${GREEN}✅ System optimized${NC}\n"
}

# Backup i3 configuration
backup_config() {
    BACKUP_DIR="$HOME/i3-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    echo -e "${GREEN}=== Backing Up Configuration ===${NC}\n"
    
    if [ -d ~/.config/i3 ]; then
        cp -r ~/.config/i3 "$BACKUP_DIR/"
        echo -e "${GREEN}✅ i3 config backed up to: $BACKUP_DIR${NC}"
    fi
    
    if [ -f ~/.xinitrc ]; then
        cp ~/.xinitrc "$BACKUP_DIR/"
        echo -e "${GREEN}✅ .xinitrc backed up${NC}"
    fi
    
    echo ""
}

# Display logs
view_logs() {
    echo -e "${GREEN}=== System Logs ===${NC}\n"
    
    PS3="Select log to view: "
    options=("Xorg errors" "LightDM" "Libvirt" "System boot" "i3 log" "Back")
    
    select opt in "${options[@]}"; do
        case $opt in
            "Xorg errors")
                less ~/.local/share/xorg/Xorg.0.log
                ;;
            "LightDM")
                sudo journalctl -u lightdm -n 50 --no-pager
                ;;
            "Libvirt")
                sudo journalctl -u libvirtd -n 50 --no-pager
                ;;
            "System boot")
                journalctl -b --no-pager
                ;;
            "i3 log")
                less ~/.local/share/i3/i3log
                ;;
            "Back")
                break
                ;;
            *) echo "Invalid option";;
        esac
    done
}

# Quick fix menu
quick_fixes() {
    echo -e "${GREEN}=== Quick Fixes ===${NC}\n"
    
    PS3="Select issue to fix: "
    options=(
        "i3 not starting"
        "No internet connection"
        "Virt-Manager permission denied"
        "Audio not working"
        "Display resolution issues"
        "Back"
    )
    
    select opt in "${options[@]}"; do
        case $opt in
            "i3 not starting")
                echo "Regenerating i3 config..."
                i3-config-wizard
                ;;
            "No internet connection")
                sudo systemctl restart NetworkManager
                nmcli device wifi list
                echo "Use: nmcli device wifi connect SSID password PASSWORD"
                ;;
            "Virt-Manager permission denied")
                sudo usermod -aG libvirt $USER
                echo "Logout and login for changes to take effect"
                ;;
            "Audio not working")
                pacman -S --needed pulseaudio pulseaudio-alsa pavucontrol
                pulseaudio --start
                ;;
            "Display resolution issues")
                xrandr
                echo "Use: xrandr --output OUTPUT_NAME --mode 1920x1080"
                ;;
            "Back")
                break
                ;;
            *) echo "Invalid option";;
        esac
        break
    done
}

# Main menu
main_menu() {
    banner
    
    PS3="Select an option: "
    options=(
        "System Diagnostics"
        "i3 Troubleshooting"
        "KVM/Virtualization Check"
        "Fix Common Issues (requires root)"
        "Install Additional Tools (requires root)"
        "Optimize System (requires root)"
        "Backup Configuration"
        "View Logs"
        "Quick Fixes"
        "Exit"
    )
    
    select opt in "${options[@]}"; do
        case $opt in
            "System Diagnostics")
                system_diagnostics
                ;;
            "i3 Troubleshooting")
                i3_troubleshooting
                ;;
            "KVM/Virtualization Check")
                kvm_troubleshooting
                ;;
            "Fix Common Issues (requires root)")
                fix_common_issues
                ;;
            "Install Additional Tools (requires root)")
                install_extras
                ;;
            "Optimize System (requires root)")
                optimize_system
                ;;
            "Backup Configuration")
                backup_config
                ;;
            "View Logs")
                view_logs
                ;;
            "Quick Fixes")
                quick_fixes
                ;;
            "Exit")
                echo -e "${GREEN}Goodbye!${NC}"
                exit 0
                ;;
            *) echo "Invalid option";;
        esac
        
        echo ""
        read -p "Press Enter to continue..."
        banner
    done
}

# Run main menu
main_menu