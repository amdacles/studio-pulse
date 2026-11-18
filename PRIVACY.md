# Privacy

**In short: Studio Pulse keeps its notes about your chats on your Mac and sends nothing anywhere.**

Studio Pulse is a free Mac app made by Anthony Dacles. This page explains what it handles. It applies to the app and to this
GitHub page.

## What the app keeps, and where
To show your coding chats (Claude Code and Codex), the app keeps short notes **on your Mac only**, in
`~/Library/Application Support/Studio Pulse`:
- for each chat: its name, the folder it runs in, the tool it is using, a short summary of the current step (for example
  "Editing notes.md"), the command it wants to run, its to-do list and the first words of your message (up to 100 characters);
- a log of the answers you give in the panel (time, chat, tool, command, your answer);
- your settings (theme, character, sounds, panel position).

Chat notes are deleted automatically after 3 days. The answer log stays until you uninstall the app. Uninstalling removes all of it.

To show chat names and jump to a chat, the app also **reads** (never changes) Claude Code's chat files, the Claude desktop app's
list of chats and Visual Studio Code's list of open windows, on your Mac.

## What the app sends
**Nothing.** No account, no analytics, no advertising, no tracking, no crash reports. The app talks only to itself on your Mac
(address 127.0.0.1), protected by a key that only your Mac user account can read. It never reads, stores or sends your Claude or
OpenAI sign-in details.

Your browser opens a web page only when you click a link in the app (for example "Report a problem").

## The settings files it changes
When you click **Connect**, the app adds its own small entries ("hooks") to the settings of Claude Code
(`~/.claude/settings.json`) and Codex (`~/.codex/hooks.json`), keeps a backup copy, and removes them again when you disconnect
or uninstall. Nothing else in those files is changed.

## Installing
The install command downloads the app from this GitHub page. GitHub sees that download like any other visit; see
[GitHub's privacy statement](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement).

## Other tools
Claude Code, Codex and Visual Studio Code have their own privacy policies. Studio Pulse doesn't change what they collect.

## Contact
Questions: [open an issue](https://github.com/amdacles/studio-pulse/issues). Please don't post private information there.

Last updated: DATE
