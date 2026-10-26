# Production rules

Working values from shipped projects. Re-measure when a platform changes its UI.

## Frame

- Vertical 1080x1920 at 30 fps unless the source is smaller; then keep the source size (720x1280 is fine) rather than upscaling soft footage.
- Filling 9:16 from landscape: a medium crop over a real blurred fill (check the blur isn't crushed to black), or a tight center crop. Reframe per bar or per beat when the subject moves; a static tight crop loses people who lean or walk.
- Crop out corner watermarks and logos of other apps.

## Instagram Reels safe zone (1080x1920)

- Keep text out of the top 250 px and the bottom 420 px.
- Left margin 70 px. Right margin 55 px above y=1110, 193 px below it (the like/comment/share rail).
- Check every overlay PNG's bounding box against these numbers before rendering, and say so in the self-check.
- Center captions on x=540 and keep them inside x 193-887. Don't shift captions sideways to dodge the rail; shrink them instead.

## Captions and overlays

- Talking head: 2-3 words per caption, uppercase, bold sans, about 60 px, centered, below the face. Merge captions shorter than 0.30 s.
- Music: 2-3 word pops, scale 112% to 100% over 90 ms, around y=1230.
- Overlays and labels go into empty space (a wall above the head), never across the face, and never in the same band as the captions.
- See-through dark labels with small white text read cleaner than solid cards. Size cards to their text.
- Disclaimers ("Not financial advice", "#ad") as a quiet small line under the captions, inside the safe zone.
- Fonts: Helvetica isn't on Windows and libass falls back silently. Use Arial / Arial Black or ship the font file.
- Burn subtitles last in the filter chain, after overlays.

## Audio

- Speech: -14 LUFS integrated, true peak at or below -1 dBTP, with a limiter after loudnorm.
- Music-led reels: -12 LUFS, true peak -1 dBTP.
- Measure true peak with ebur128 on the stereo file; a mono downmix gives false overs.
- Use very short fades (about 4 ms) only at source jumps. Longer fades (30 ms) leave audible holes on drops.
- Sound effects sit about 9 dB under the voice.
- Take music audio from one continuous extract. Seeking the source once per block skips up to 20 ms at each join.

## Known render bugs

- **Frame rounding**: renders run about 0.2 s past the EDL total. Anything meant to stay "until the end" (CTA, disclaimer, end hold) must hold to the real last frame, not to the planned end time.
- **Windows subtitle paths**: libass needs forward slashes and escaped colons in the subtitles filter path.
- **Strobe lights**: a 10 Hz club strobe flickers badly after re-encoding. Add deflicker on those segments.

## Loops

- End on a bar line (music) or a beat that matches the opening frame, so the replay feels seamless.
- The last half-bar should match the opening framing.
