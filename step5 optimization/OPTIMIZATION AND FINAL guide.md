OPTIMIZATION AND FINAL


Great breakdown! Since you're setting up i3wm specifically for VM work on your TUF F15, I'll add some critical optimization tips and resources you might have missed:

## **Performance-Critical Additions**

### **4. VM-Specific i3 Configurations**

For smooth VM interaction with i3wm, add these to your `~/.config/i3/config`:

```bash
# Floating windows for VM dialogs
for_window [class="Virt-manager" window_role="dialog"] floating enable
for_window [class="Virt-manager" title="New VM"] floating enable

# Dedicated workspace for VMs (prevents accidental tiling chaos)
assign [class="Virt-manager"] $ws9
assign [class="virt-viewer"] $ws10

# Border toggle for fullscreen VMs (cleaner experience)
bindsym $mod+u border none
bindsym $mod+n border normal
```

### **5. Critical System Resources**

| **Tool** | **Purpose** | **Why Essential for VM Work** |
|----------|-------------|-------------------------------|
| **`htop`/`btop`** | System monitor | Quickly check RAM/CPU usage from i3 without opening virt-manager. Bind to `$mod+Shift+h` |
| **`scrot`/`maim`** | Screenshot tool | Document VM configurations/issues. i3 has no default screenshot tool |
| **`dunst`** | Notification daemon | Get VM state alerts (started/stopped). i3 has **no** notification system by default |
| **`pavucontrol`** | Audio mixer | Route VM audio separately from host audio for Black Arch testing |

### **6. Essential Learning Path**

**Week 1 Focus:**
1. Read the User's Guide sections "Tree", "Containers", and "Default Keybindings" (30 min)
2. Practice workspace switching (`$mod+1-9`) and window movement (`$mod+Shift+j/k/l/;`) daily
3. Configure `i3status` to show CPU temp and RAM usage (critical for VM monitoring)

**Week 2 Focus:**
1. Master layout modes: `$mod+e` (split), `$mod+s` (stacking), `$mod+w` (tabbed)
2. Set up scratchpad (`$mod+Shift+minus` to hide window, `$mod+minus` to show) - perfect for keeping `htop` accessible
3. Configure multi-monitor setup if using external displays

### **7. Black Arch VM Workflow Optimization**

Create a startup script (`~/.config/i3/vm-workspace.sh`):
```bash
#!/bin/bash
# Launch VM workspace layout on i3 startup
i3-msg "workspace 9; append_layout ~/.config/i3/vm-layout.json"
virsh start blackarch-1 &
virt-manager --connect qemu:///system &
```

Then add to your i3 config:
```bash
exec_always --no-startup-id ~/.config/i3/vm-workspace.sh
```

### **8. Troubleshooting Resources**

- **i3 FAQ**: `https://faq.i3wm.org/` (Covers the "Why doesn't X work?" questions)
- **Arch Forums**: Search for "i3 TUF laptop" for hardware-specific configs (function keys, GPU switching)
- **r/i3wm subreddit**: Active community for config sharing

## **Critical First-Boot Checklist**

After installing i3 on Arch:
```bash
# Install absolute essentials
sudo pacman -S i3-wm i3status dmenu xterm feh picom dunst

# Generate default config
i3-config-wizard

# Test VM keybind immediately
echo "bindsym \$mod+Control+v exec virt-manager" >> ~/.config/i3/config
i3-msg reload
```

**Pro tip for RAM monitoring**: Add this to your `~/.config/i3status/config`:
```
order += "memory"
memory {
    format = "RAM: %percentage_used"
    threshold_degraded = "10%"
    threshold_critical = "5%"
}
```

This alerts you when RAM is low - critical when running multiple Black Arch VMs!