# Changelog

## 2.3.2 — first public release (DATE)
Studio Pulse puts every coding chat on your Mac in one small floating panel, with a little character for each chat.

**Chats**
- Claude Code chats in Visual Studio Code, in the Terminal and in the Claude desktop app, and Codex chats, side by side.
- Each row shows the chat's name, its folder, what it's doing, its to-do progress and its state: **working**, **needs your OK**,
  **your turn** or **quiet**.
- **↗** jumps to the chat (its VS Code window and tab, the Claude app, the Codex app). Click a row to see its last steps.

**Answer from the panel**
- **Allow / Deny** a permission request without switching windows. Claude Code also shows its own prompt: the first answer wins.
  Codex waits up to 30 seconds for the panel, then asks in its own window.
- **Answer Claude Code's multiple-choice questions** (one or several choices), or type your own answer in VS Code.
- **Plain words under every command**, e.g. "Deletes build and everything inside, for good (not to the Trash)". Built-in rules,
  no AI, no internet.
- **Risky requests are red and need a one-second hold** (deleting, force-pushing, `sudo`, running a downloaded script…).
- **Keyboard shortcuts from any app:** ⌃⌥⌘A allow the oldest request, ⌃⌥⌘D deny it, ⌃⌥⌘P show or hide the panel.
  A risky request is never allowed by a shortcut: the panel opens instead.
- **"Needs a look" warnings:** the same command 4 times in a row, no new step for 6 minutes, a command still running.

**Look and feel**
- Seven characters: Mochi, Nigi, Boo, Miso, Puff, Pip and Slate, or a mix (each chat its own).
- Themes: Dark, White and Liquid Glass (the Mac's own glass on macOS 26 or newer).
- A Mac banner and a sound when a chat needs you (each can be switched off).

**Privacy and safety**
- A command that deletes anything, anywhere in the line (inside `$( … )`, after `xargs` or `find -exec`, in a loop, in a
  one-line script…), counts as risky: it needs the one-second hold, with the left mouse button.
- The keyboard shortcuts only answer a request the panel is showing.
- Each user account on the Mac has its own Studio Pulse; no other program can answer for it.
- Quit means quit: nothing is recorded while Studio Pulse is not running.
- Everything stays on your Mac. No account, no analytics, nothing sent online.
- The panel talks only to its own little server on your Mac, locked with a key only your Mac user can read.
- Uninstall removes the app, its hooks in Claude Code and Codex, its login item and all its files.
