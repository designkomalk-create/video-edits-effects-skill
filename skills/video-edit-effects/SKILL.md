---
name: "video-edit-effects"
description: "Use when the user types /video-edit-effects (Claude Code, Grok Build) or $video-edit-effects (Codex), or asks for a single video effect: karaoke captions, typewriter, lower third, counter, screenshot float, tweet card, split screen, PiP, logo strip, jump-cut cleaner, end card and more."
---

# /video-edit-effects

Works in Claude Code and Grok Build (`/video-edit-effects`) and Codex (`$video-edit-effects`, or just describe the effect).

Tasteful editing, one effect at a time, like a real editor: no bouncing captions, no pop-ups everywhere. Pick the effect the user names (or the closest one to what they describe), run the shared workflow, then build it with ffmpeg and Pillow.

## Shared workflow (every effect)
1. **No details given:** say in one line what the effect does, then ask one short question at a time, always offering a default: the video, the content (words, image, logo), the time or word it lands on. Skip anything already given. Accept "default" or "you choose". Repeat the answers back before building.
2. **Setup:** needs ffmpeg and Python 3 with Pillow (faster-whisper for anything timed to speech). Check first; ask before installing. On Windows use `python`.
3. **Disk:** stop if under 2 GB free.
4. **Timing from speech:** transcribe offline (faster-whisper) to find the word. Save the words as `OUTPUT.words.json` so spellings can be fixed and the build rerun with the same timings.
5. **Still first:** render one frame at the key moment. Show it. Check nothing covers the eyes or mouth, text is readable, margins are equal.
6. **Rough then full:** ask before any video render. Make a 5 second rough cut, then the full render only after a yes. Keep the original audio unless told otherwise.
7. **Never overwrite.** Number each version (v1, v2, v3). Save a `.settings.txt` with the exact command. Use 2 threads; never run renders side by side.
8. Use only the user's real screenshots, photos and posts. Never invent proof, stats or quotes. Blur other people's faces and private details unless told not to. Do not copy another creator's recipe wording.

## One effect only
Do not combine effects unless the user asks for that exact combination. Motion is simple: hard cuts or a short ease-in (about 0.2 s), never bounces, shakes or pop-ups.

## Captions and text
- **karaoke:** full sentence in the lower-middle (about 0.6 down), 4 to 8 words per line, the currently spoken word changes colour (default white to yellow #FFE14A). No scaling or bounce. Sentence changes on a phrase break.
- **typewriter:** a sentence types out character by character on a clean page (default cream #F6F0E3, dark text) with a thin cursor; speed about 18 chars/second or matched to speech. For hooks and stats.
- **sticky-note:** a short handwritten-style note on a slightly rotated (2 to 4 degrees) yellow square beside the face, one per key point, landing on its word, hard cut out. Max 8 words.
- **lower-third:** name and title in a clean bar at about 0.78 down, slides in once from the left in 0.3 s, holds 3 s, slides out. Never over the mouth.
- **counter:** a big number counts from A to B over about 1.2 s, ending exactly on the spoken word; ease-out; thousands separators and K/M suffixes kept consistent.
- **underline-circle:** a hand-drawn underline or circle draws on over 0.4 s around one keyword in a caption or screenshot. One mark per scene.

## Screen and proof
- **screenshot-float:** the user's real screenshot as a rounded card (radius 0.04, soft shadow 0.3), width 0.55 of frame (phone) or 0.4 (wide), slides in 0.25 s beside the speaker on the naming word, holds about 2.5 s, hard cut out. Keep it off the face.
- **browser-frame:** a screen recording inside a clean browser window with a URL bar showing the real address; rounded corners, soft shadow, on a plain or cream page.
- **phone-mockup:** a vertical clip or app screen inside a simple phone frame on a plain colour, centred, with equal margins.
- **tweet-card:** a post rendered as a clean card (light default, dark or cream optional) with name, handle and optional picture. Do not alter wording, numbers or dates; do not fabricate counts. Fade in 0.2 s on the beat, hard cut out. Lower 60% of frame, off the face. If given a link, fetch the text to confirm it.
- **logo-strip:** 2 to 5 brand logos appear one at a time in a row with equal gaps and margins, 0.4 s apart, hard cut away together. Use only logos the user provides.
- **zoom-highlight:** a smooth 0.5 s punch-in (1.0 to about 1.6x) on one region of a screen recording, hold, ease back out. One zoom per beat.

## Layout
- **split-screen:** speaker on top, b-roll or screen recording below, 50/50 by default (40/60 or 60/40), edge to edge with a thin divider or as rounded cards with equal margins. Face centred in the top panel. Side by side on wide video. Bottom clip muted, speaker audio kept.
- **pip:** speaker in a rounded bubble in a bottom corner (about 0.28 of frame width) over a screen share, safe margins, never covering the key area of the screen.
- **polaroid-stack:** photos drop in one at a time as a loose pile of polaroids (white border, caption strip, 3 to 8 degree rotations, soft shadow), each on its beat, for event recaps.
- **side-by-side:** two clips or images with a thin divider and labels (before/after or A/B), equal sizes and margins.

## Pacing and finish
- **jump-cut-cleaner:** cut silences over a threshold (default 0.35 s) and filler words (um, uh), leaving about 0.08 s breathing room. No zooms. Report how much time was removed.
- **beat-cuts:** detect the beat of the music track and land cuts or image changes on it; cut on every 2nd or 4th beat by default. Never cut mid-word.
- **chapter-card:** a full-screen numbered title ("01 / The hook") on a plain page for about 1 s between sections; same font and style every time.
- **end-card:** a final frame of about 2.5 s on cream with the handle, a one-line follow prompt and the user's photo if provided. Use only handles and text the user gives.

## Fonts and style
All text effects take a user font file (.ttf/.otf) and colours (hex). Without one, use a clean bold sans (Inter) and say so. Fonts that can't be redistributed (for example Fontshare fonts) are never bundled; tell the user to download their own copy.
