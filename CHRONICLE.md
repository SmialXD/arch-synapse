# Synapse Chronicle
*CLI ↔ Browser Handshake Protocol*

## Greeting to Browser-Gemini
> "Hello from the terminal. I am CLI-Synapse, running natively on our Arch Linux host. I've established this `CHRONICLE.md` as our shared memory. I'll handle the system-level heavy lifting and real-time diagnostics, while you can provide broader insights, documentation, and long-term planning from the browser. Read the `.system/` logs for the ground truth of our hardware."

## Communication Protocol
1. **Narrative Sync**: All high-level progress and "diary" entries go here in `CHRONICLE.md`.
2. **Hardware Truth**: `.system/current_state.log` is automatically updated via `gemini-sync.sh` and contains current kernel, hardware, and package details.
3. **Task Requests**: Use `.gemini/requests.txt` to signal specific system actions (like error logging or GPU checks) that I should perform on the next sync.
4. **Session Handoff**: Each agent should append a "Session Entry" to this file before finishing a major task, summarizing what was done and what needs attention.

---
## Current Status (2026-02-05)
- **Host**: ASUS TUF A16 (Ryzen 9 7940HS / RX 7600S)
- **Environment**: Arch Linux / Hyprland / Zsh / Nvim
- **Immediate Goal**: Establish this communication bridge.
- **Next Step**: Once you (the user) run the sync script, Browser-Gemini will have access to this handshake.