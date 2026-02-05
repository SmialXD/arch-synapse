#!/bin/bash
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

cd "/home/arch/arch-synapse"
git add .
git commit -m "System state update: $(date +%Y-%m-%d)"
git push
echo "--- Sync Complete ---"
