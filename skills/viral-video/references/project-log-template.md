# <Project name>: video-use project

## Session 1, <YYYY-MM-DD>

**Strategy:** <one paragraph: format, frame size, how cuts are chosen, text style, grade, loudness target>

**Blueprint / playbook:** <path to the viral-blueprint file and the playbook used>

**Sources to outputs**
- `<source file>` -> `<output file>` (<n> ranges, <length>s) "<hook text>"

**Decisions (approved by user):**
- <decision, and the user's reason if given>

**Reasoning log:**
- <why something is the way it is, especially anything non-obvious or measured>

**Self-check:** <durations, LUFS / dBTP per video, boundary checks, safe-zone check, frames sampled>

**Critic pass + fixes:**
- Critic found: <...>
- Fixed: <...>
- Not changed, by user decision: <...>

**Files:** `build/build.py` (EDL + render). Re-render one video with `python build/build.py <id>`. Previous version in `prev_v<n>/`.

**Unverified (needs the user's eye or ear):**
- <video, timestamp, what to check>

**Outstanding:**
- <next steps>
