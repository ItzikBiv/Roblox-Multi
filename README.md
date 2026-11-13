# Roblox-Multi

Run several Roblox windows at the same time on Windows, so you can play on more than one account at once.

## How it works

When Roblox starts, it claims a named lock in Windows (`ROBLOX_singletonEvent`). A second copy sees the lock is taken and closes itself. This script claims that lock first and keeps holding it, so every Roblox window can start.

## Usage

1. Close **all** Roblox windows.
2. Put `RobloxMulti.bat` and `RobloxMulti.ps1` in the same folder.
3. Double-click `RobloxMulti.bat` and leave the window open. It should say **"Multi-instance is ON."**
4. Join a game with account #1 from your browser.
5. Switch accounts and join a game with account #2. A separate Chrome profile per account is easiest (profile picture, then **Add**).
6. Repeat for more accounts. When you're done, press Enter in the script window.

## Troubleshooting

- **The window flashes and closes:** make sure the file is named `RobloxMulti.ps1` and not `RobloxMulti.ps1.txt`. In File Explorer, use View, then Show, then File name extensions.
- **Windows blocks the script:** right-click `RobloxMulti.ps1`, open Properties, and tick **Unblock**.
- **The second window still closes:** a Roblox update may have renamed the lock. The names the script holds are listed at the top of `RobloxMulti.ps1`.

## Notes

- Every Roblox window uses its own RAM and CPU.
- Running multiple clients is a gray area under Roblox's rules, and some games ban alt accounts used for AFK farming. Use at your own risk.
