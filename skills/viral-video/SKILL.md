---
name: viral-video
description: Turn raw footage into finished, post-ready short-form videos (TikTok, Reels, Shorts) end to end - pick or research a niche playbook, plan the edit with the user, mock visual choices, edit with video-use, self-check every render, run a critic pass, and hand over a posting checklist. Use when the user runs /viral-video, drops footage and asks to "make this go viral", "cut reels from this", "edit my UGC", "make a highlight reel", or "turn my DJ set into clips".
argument-hint: <footage paths or folder> [niche / goal, e.g. "fintech UGC for a brand deal"]
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, WebSearch, WebFetch, Agent, Skill
---

# Viral video pipeline

You produce short-form videos that hold attention and are safe to post. You work in stages and stop for the user's approval at the two gates marked **GATE**. Every lesson in this skill came from a real project; follow the rules even when they feel slow.

**Request:** $ARGUMENTS

## Stage 0. Intake (ask once, in one message)

Find out only what you can't infer from the footage or the request:

1. **Footage**: which files, and which file is which (users name clips by content, not filename; match them by content and say how you matched).
2. **Goal**: organic growth, a paid brand deal, a portfolio piece, or a highlight reel.
3. **Platform**: Reels, TikTok, Shorts (default: Reels at 1080x1920, 30 fps).
4. **Rights**: who owns the music, brand assets, and any third-party clips. Paid posts never use ripped audio or viral clips.
5. **Text**: does the user want captions/overlays, or a clean cut they'll finish in the app?

## Stage 1. Pick the playbook

Read the closest playbook in `playbooks/` (they're short):

| Footage | Playbook |
|---|---|
| A person talking to camera, scripted or not (UGC, explainers, brand deals) | `playbooks/ugc-talking-head.md` |
| DJ sets, live music, performance, anything where the audio is the hook | `playbooks/music-dj.md` |
| Sports or action with no talking (rallies, tricks, games) | `playbooks/sports-highlights.md` |

If the niche is new or the user wants current data, run the `viral-blueprint` skill for the niche first and use its blueprint alongside the playbook. If a blueprint for the niche already exists in `blueprints/`, reuse it.

## Stage 2. Inventory the footage

Use `video-use` (see the README for setup) and ffmpeg. Measure; don't guess.

- **Speech**: transcribe with word timestamps. For dense music, transcribe short excerpts around each section; full-file transcription bunches timestamps.
- **Music**: measure BPM (don't trust the title), find drops from the bass-band onset, and confirm two-song overlaps by measurement before calling something a transition.
- **Action**: find events from audio onsets (ball strikes, landings), then check frames to drop shots where someone blocks the camera or the subject is out of frame.
- Note the subject's position in frame across the clip; static crops lose people who move.

## Stage 3. Plan (GATE 1)

Write a short plan and wait for approval before rendering anything:

- One line of strategy per output video: hook, structure, length, ending.
- The cuts: which ranges stay, which lines go, and why (struck-through lines so the user can ask for them back).
- Text, captions, grade, loudness target, and anything you'll correct on screen.
- What's unverified (lyric guesses, track names, timing that needs an ear).

If the user leaves comments on a review page, treat each comment as a change request and answer it in the plan.

## Stage 4. Mock visual choices first (GATE 2)

Before the full render, show still mocks for anything the user will judge by eye: caption size and position, overlay style, cutaway framing. Offer two or three options side by side on a real frame from their footage. Captions that cover the face are the most common rejection; mock first.

When the user prefers to review on a page, publish a review page (an Artifact if available) with a phone-sized player, a beat-by-beat table (thumbnail, line, source range, why it stayed), cut lines struck through with a "restore?" note, and comment anchors per row.

## Stage 5. Build

- Edit with `video-use`. Keep a reproducible build script (`build/build.py`) so any one video can be re-rendered, and keep the previous version in `prev_vN/` before overwriting.
- Follow `references/production-rules.md` for frame size, safe zones, captions, audio, and known render bugs.
- Keep a `project.md` in the output folder from `references/project-log-template.md`: strategy, sources to outputs, decisions the user approved, reasoning, self-check numbers, outstanding items.

## Stage 6. Self-check every render

Run `references/qa-checklist.md` on every output. Report numbers, not impressions: loudness, true peak, boundary checks, safe-zone boxes, durations against the plan.

## Stage 7. Critic pass

Spawn the `video-critic` agent with the output paths, the plan, and the playbook. Fix what it finds, or tell the user why you didn't. Note any deviation from the approved plan (for example, a build shortened from 4 bars to 1) in `project.md` and in your report.

## Stage 8. Deliver

Report in this order:

1. Where the final files are, one line each with length and what it is.
2. What changed since the last round.
3. **What you did not verify**: you have not watched or heard the videos. Name the exact timestamps that need the user's eye or ear.
4. **Posting checklist** (from the playbook): in-app sounds and the timestamps they go on, #ad or paid-partnership label, link in bio, brand asset permissions, caption copy.

Then ask what to change, naming the videos by number so feedback is easy.

## Rules that never bend

- Never claim a video is "good" or "watched". Say what you measured and what you didn't.
- Never invent lyrics, track names, stats, or brand terms. Lyrics come from the user or are transcribed for timing only; brand terms come from the brand's own docs.
- Never put ripped audio, viral sound clips, or someone else's footage into a paid post. Leave the moment silent and give the timestamp for an in-app library sound.
- Correct factual slips on screen (a caption or a small note) rather than silently changing what the creator said, and flag it to the user.
- Don't bundle API keys in build scripts or logs. Keys live in `.env` or the environment.
