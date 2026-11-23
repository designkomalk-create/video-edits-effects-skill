# video-edit-effects

One video effect at a time, edited like a real editor: karaoke captions, typewriter, lower third, counter, screenshot float, tweet card, split screen, PiP, logo strip, jump-cut cleaner, end card and 20+ more.

It shows a still first so you can check the effect before the full render.

Works in **Claude Code**, **Codex** and **Grok Build**. Free to use (MIT).

## Install

```bash
git clone https://github.com/designkomalk-create/video-edits-effects-skill.git
cd video-edits-effects-skill
bash install.sh          # Windows: ./install.ps1
```

This copies the skill to:

| Tool | Folder |
| --- | --- |
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.agents/skills/` |
| Grok Build | `~/.agents/skills/` (it also reads `~/.claude/skills/`) |

You can also copy `skills/video-edit-effects` into any of those folders by hand.

## Use

- Claude Code / Grok Build: `/video-edit-effects`
- Codex: `$video-edit-effects`
- Any of them: name the effect and drop your video.

## Needs

Python 3, ffmpeg, Pillow, and faster-whisper (for effects timed to speech) on the machine running the agent.

## License

MIT
