# Self-check for every render

Report each item with a number or a pass/fail, per video.

## Timing
- [ ] Duration matches the plan (allow the ~0.2 s frame-rounding overrun, and confirm end overlays survive it).
- [ ] Every cut lands where the plan says. For music, cut lengths are whole bars from the drop at the measured BPM.
- [ ] The hook's first frame has something happening; no dead air in the first second.

## Audio
- [ ] Integrated loudness (LUFS) and true peak (dBTP) from ebur128, on the stereo file.
- [ ] Every cut boundary checked for pops: compare the sample jump at the boundary to the clip's context (for example, the boundary/context ratio, or below the file's p99.9 sample jump).
- [ ] No gaps or doubled words at speech cuts. Listen points listed for the user where measurements disagree.

## Picture
- [ ] Frames sampled at every overlay midpoint and every cut: no caption hidden, nothing over the face, no visual jump at cuts.
- [ ] Every overlay's bounding box is inside the safe zone. Captions measured centered (x about 540).
- [ ] The subject is in frame for the whole video (sample at least one frame per second in crops).
- [ ] No other app's watermark or UI in frame.

## Content
- [ ] Captions match the audio word for word, or differ only where the plan says (corrections, bleeps).
- [ ] Brand claims, numbers and terms match the brand's own docs.
- [ ] Required disclosures are on screen (#ad / paid partnership, "not financial advice" where relevant).
- [ ] A call to action in every brand video, ideally spoken by the creator.

## Honesty
- [ ] Anything not verified is listed with timestamps for the user to check by eye or ear.
