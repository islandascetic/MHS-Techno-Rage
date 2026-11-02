# FIREWALL idle motion study 02

Revision responding to the inconsistent, choppy generated-pose animation in idle_v1.

- 64 frames at 20 fps; 3.2-second seamless mathematical cycle.
- One fixed source drawing per hero. No regenerated animation poses.
- Procedural cutout motion: restrained breathing with planted feet, limited hair and cloth displacement, independent hovering props, and Wraith's floating silhouette.
- The built-in image generator prepared `cast_cutouts.png` from the approved v6 sheet with the prompt to preserve all character artwork and remove background, labels, borders and shadows using transparency.
- `../render_idle_v2.ps1` assembles the animated frames. FFmpeg encodes the GIF and MP4 previews.

This is a motion study, not finished hand-drawn pixel animation or an engine-ready animation atlas. It cannot reproduce the articulated pose changes and authored secondary animation of the Pinterest reference. Masks, pixel-grid alignment, expressions, and additional authored poses need further work for production. Keep the previous versions for comparison.

Outputs: combined GIF, combined MP4, eight individual GIFs, transparent source atlas, and 64 full preview frames.
