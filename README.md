# Viral Video Agent

A short-form video agent for [Claude Code](https://claude.com/claude-code). Give it raw footage and a goal, and it researches the niche, plans the edit with you, edits with [video-use](https://github.com/browser-use/video-use), checks every render, has a second agent critique it, and hands you post-ready Reels, TikToks or Shorts with a posting checklist.

It grew out of [viral-blueprint](https://github.com/victoriasun7663-dev/viral-blueprint) and three real projects:

| Project | What it taught the agent |
|---|---|
| **Fintech UGC** (paid brand deal, 3 Reels) | Scripts with a spoken brand line, on-screen corrections for misspoken terms, numbers copied from the brand's docs, disclosures, Reels safe zones, mock captions before rendering |
| **Music / DJ reels** (drops and transitions) | Measure BPM and drops, prove two-song overlaps before calling it a transition, lyric pops, cut on bar lines, loops |
| **Tennis highlights** (fresh UGC account) | Find rallies from ball-strike audio, drop blocked shots, rank and name clips, 30-45 s highlight reels |

## What's inside

```
agents/
  viral-video-producer.md   Orchestrator: runs the whole job
  video-critic.md           Independent reviewer for finished renders
skills/
  viral-video/              The pipeline (/viral-video)
    playbooks/              UGC talking-head, music/DJ, sports highlights
    references/             Production rules, QA checklist, project log template
  viral-blueprint/          Niche research (/viral-blueprint)
research-cli/               Standalone Python version of the research step (Anthropic + Tavily APIs)
```

## How a job runs

1. **Intake**: footage, goal (organic, brand deal, highlight reel), platform, rights, text or no text.
2. **Playbook**: picks the closest niche playbook, or runs `/viral-blueprint` for a new niche.
3. **Inventory**: transcribes speech, measures music (BPM, drops, overlaps) or action (audio onsets), checks framing.
4. **Plan**, then waits for your OK.
5. **Mocks** of captions and overlays on a real frame, then waits for your OK.
6. **Build** with video-use, with a reproducible build script and a `project.md` log.
7. **Self-check**: loudness, true peak, cut pops, safe zones, frame samples, durations.
8. **Critic pass** by `video-critic`, then fixes.
9. **Delivery**: files, what changed, what still needs your eye or ear (with timestamps), and a posting checklist.

## Install

### Requirements

- Claude Code
- [video-use](https://github.com/browser-use/video-use) installed as a Claude Code skill, with ffmpeg on your PATH and an ElevenLabs key (with Speech to Text enabled) for transcription. Follow its own install guide.

### Option A: plugin

In Claude Code:

```
/plugin marketplace add victoriasun7663-dev/viral-vid-agent
/plugin install viral-video-agent@viral-video-agent
```

### Option B: copy into your personal folder

```bash
git clone https://github.com/victoriasun7663-dev/viral-vid-agent.git
cd viral-vid-agent
sh install.sh
```

On Windows, run `powershell -ExecutionPolicy Bypass -File .\install.ps1` instead.

## Use

Start a new Claude Code session in the folder with your footage, then either run the skill:

```
/viral-video ./clips "fintech UGC for a brand deal, 3 Reels"
```

or ask for the agent by name: "Use the viral-video-producer agent to cut my DJ set into transition reels."

Research only:

```
/viral-blueprint fitness coaching for busy parents
```

## Research without Claude Code

`research-cli/` is the standalone Python version of the research step. It needs an Anthropic API key and a Tavily API key; see the comments at the top of `video_editing_agent.py`.

```bash
cd research-cli
pip install -r requirements.txt
python video_editing_agent.py "fitness coaching"
```

On Windows, `run_agent.ps1` asks for both keys without showing them.

## Ground rules the agent follows

- It can't watch or hear your videos. It measures what it can and tells you exactly which moments to check.
- No ripped audio, viral sound clips or someone else's footage in paid posts. It leaves the moment silent and tells you where to add an in-app library sound.
- No invented lyrics, stats or brand terms.
- Keys stay in `.env` or your environment, never in scripts or logs.

## Credits

Editing runs on [video-use](https://github.com/browser-use/video-use) by browser-use, which this repo doesn't include.

## License

[MIT](LICENSE)
