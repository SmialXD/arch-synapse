#!/bin/bash
REQUEST_FILE="$REPO_DIR/.gemini/requests.txt"
REPO_DIR="$HOME/arch-synapse"

echo "--- Starting Sync to arch-synapse ---"
{
  echo "### TIMESTAMP: $(date) ###"
  echo "### KERNEL ###"
  uname -a
  echo -e "\n### HARDWARE ###"
  inxi -Fzx
  echo -e "\n### PACKAGES ###"
  pacman -Qe
  echo -e "\n### SERVICES ###"
  systemctl list-units --type=service --state=running --no-pager
} > "/home/arch/arch-synapse/.system/current_state.log"

# 1. Populate Configs
echo "Copying dotfiles..."
cp -r ~/.config/hypr/* "$REPO_DIR/configs/hypr/" 2>/dev/null
cp -r ~/.config/nvim/init.* "$REPO_DIR/configs/nvim/" 2>/dev/null
cp -r ~/.config/waybar/* "$REPO_DIR/configs/waybar/" 2>/dev/null
cp ~/.zshrc "$REPO_DIR/configs/zsh/zshrc" 2>/dev/null

# 2. Populate Identity JSON with deep-context
cat <<EOF > "$REPO_DIR/.gemini/identity.json"
{
  "user_profile": {
    "username": "arch",
    "host": "ASUS-TUF-A16",
    "arch_specialization": "Zen 4 / RDNA3 Dual-GPU"
  },
  "preferences": {
    "cli_mode": "nvim-style",
    "shell": "zsh",
    "editor": "nvim",
    "wm": "hyprland",
    "lsp_management": "mason"
  },
  "system_state": {
    "audio": "pulseaudio",
    "video_driver": "amdgpu",
    "display": "165Hz-FHD"
  },
  "last_sync": "$(date +%Y-%m-%d %H:%M:%S)"
}
EOF

# 3. Final Sync
cd "$REPO_DIR"
git add .
git commit -m "System state update: $(date +%Y-%m-%d)"
git push
echo "--- Sync Complete ---"

# --- Gemini Request Listener ---
if [ -s "$REQUEST_FILE" ]; then
    echo "Processing Gemini requests..."
    while IFS= read -r flag; do
        case $flag in
            "--log-errors") journalctl -p 3 -xb > "$REPO_DIR/.system/errors.log" ;;
            "--log-backlight") brightnessctl g > "$REPO_DIR/.system/backlight.log" ;;
            "--check-gpu") rocm-smi > "$REPO_DIR/.system/gpu_state.log" ;; # For your RDNA3
            *) echo "Unknown request: $flag" ;;
        esac
    done < "$REQUEST_FILE"
    truncate -s 0 "$REQUEST_FILE" # Clear after processing
fi
