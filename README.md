# arch-synapse

### Project Scope
A structured bridge between an Arch Linux host and the Gemini AI model. This repository serves as the "Source of Truth" for system architecture, software configurations, and user-specific workflow logic.

### Machine Profile
- **Hardware:** ASUS TUF Gaming A16 (FA617XS)
- **CPU:** AMD Ryzen 9 7940HS
- **GPU:** RX 7600S/7700S + Radeon 780M
- **Environment:** Hyprland on Wayland

### Structure
- `/.system`: Automated logs of kernel, package, and service states.
- `/configs`: Dotfiles for core system components (Hyprland, Nvim, Zsh).
- `/scripts`: Custom automation and sync tools.
- `/.gemini`: AI-specific metadata and identity tracking.

### Operational Command
Sync is triggered via the `:sync` command in the Gemini interface.
