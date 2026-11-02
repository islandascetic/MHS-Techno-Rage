# Faraday — SpriteCook base sprites

Two runs so far. Run 1 follows the current sheet exactly (fantasy knight, result
rejected as "not technical enough"). Run 2 is the techno / Tron direction and is the
one to iterate on. The spec files have **not** been updated yet; run 2's prompt is the
draft for the new Faraday sheet.

- [Run 2 — techno / Tron direction (2026-11-02)](#run-2--techno--tron-direction-2026-11-02)
- [Run 1 — as per the current sheet (2026-11-01)](#run-1--as-per-the-current-sheet-2026-11-01)

---

## Run 2 — techno / Tron direction (2026-11-02)

Direction from the user: futuristic Tron-type look, hard-light forcefield fighter in
the Streets of Rage 4 vein, each hero still unique, "really cool and techno".

### Files

| File | What it is |
|---|---|
| `faraday_spritecook_v2_ref.png` | Native pixel-perfect output, 204 × 204 RGBA, transparent. Content is 112 × 204 px. SpriteCook picked a grid about twice as fine as run 1. |
| `faraday_spritecook_v2_ref_4x.png` | 4× nearest-neighbour view (816 × 816). |
| `faraday_spritecook_v2_64x96.png` | Local nearest-neighbour downscale, content 53 × 96 centred on 64 × 96. At this size it is a 0.47× reduction, so fine detail (circuit lines, hex pattern) is lost; use it only to judge the silhouette. |
| `faraday_spritecook_v2_raw.jpg` | Gemini source before SpriteCook processing, 768 × 1376 on white. |

### What changed in the design (draft for the new sheet)

- **Suit:** skin-tight matte dark-navy bodysuit with ember-orange circuit light-lines
  along arms, legs and spine (Tron light-lines) instead of a gambeson.
- **Armour:** angular steel-blue hard-shell plates on shoulders, chest, forearms and
  shins, each with a glowing orange seam. Chest plate keeps the single vertical orange
  light-stripe (the "deny" rule). Boots have a glowing sole line.
- **Head:** unchanged (short cropped dark-blue hair, thick brows, nose scar, calm set
  face) plus a thin ember-orange HUD visor strip over one eye. No helmet, so the face
  still reads.
- **Prop:** the physical door-shield becomes a **hard-light forcefield** projected
  from a forearm gauntlet emitter: tall rectangular translucent orange barrier with a
  bright hexagon-pattern rim, taller than his waist, held at his side.
- **Palette:** same hues as the sheet plus one glow highlight `#FFC08A`:
  `#1B1F3A` outline, `#2B3F6B` dark blue, `#4A6FA5` steel, `#F0803C` ember,
  `#FFC08A` glow, `#3A3F5C` suit, `#F2D3B3` skin, `#E8E6F0` neutral.

### Review

- **Reads as an AI:** yes. Light-lines, visor, glowing seams and the hex forcefield do
  the job the knight could not. Still clearly Faraday: same head, same build, same
  blue-and-orange, same "wall" stance, shield on the same side.
- **Silhouette:** strong. The tall glowing slab beside a dark bulky body reads at
  64 × 96.
- **Proportions:** about 4.5 heads tall (head ≈ 45 px of 204). Worse than run 1 even
  with "exactly 3.5 heads tall, short legs" in the prompt. Gemini resists chibi when the
  suit is skin-tight. Next run: say "super-deformed, head as wide as the shoulders,
  legs shorter than the torso".
- **Forcefield translucency:** the shield is drawn see-through and the arm behind it is
  rendered as a brown blob, which reads as a mistake at small size. Next run: ask for
  an opaque hard-light panel with a bright rim, or hold the shield so no arm sits
  behind it (the gauntlet in front of the panel).
- **Grid:** SpriteCook chose 112 × 204 content, roughly 2× the target density, so the
  sprite is drawn with far more detail than a 64 × 96 sprite can hold. For a true
  in-game sprite either accept a 128 × 192 base (and retarget the whole cast to that
  size) or use `pixel-engine-image-v1` for an exact 64 × 96. Decide this before the
  other seven.
- **Palette:** 4,361 unique colours; needs the same snap as run 1. Hues sit close to
  the sheet after snapping (dark blue drifted lighter to `#375379`, skin a touch pinker).
- **Outline:** 1 px dark navy, continuous. Mean `#171B36`, essentially on spec.
- **Scar:** present this time (faint, under the visor). Visor is over the right eye
  (viewer's right), which flips to the left eye on the mirrored facing; fine.

### Exact SpriteCook settings (run 2)

Tool `generate_game_art`. Cost 12 credits (28 → 16). Job
`e62c6794-1473-4767-a83e-1c3b2f1ec7ed`. Asset `33b8ada8-8804-4a56-86b6-bf6259878878`,
labelled "FIREWALL Faraday v2 techno Tron idle (SpriteCook)".

| Parameter | Value |
|---|---|
| `model` | `gemini-nano-banana-2.1` |
| `pixel` / `bg_mode` / `mode` | `true` / `transparent` / `assets` |
| `width` × `height` | 64 × 96 hint (returned 204 × 204, content 112 × 204) |
| `aspect_ratio` / `resolution` | `9:16` / `1K` |
| `smart_crop` / `smart_crop_mode` | `true` / `tightest` |
| `outline_repair` | `true` |
| `colors` | `#1B1F3A, #2B3F6B, #4A6FA5, #F0803C, #FFC08A, #3A3F5C, #F2D3B3, #E8E6F0` |
| `theme` | "neon cyberpunk Tron digital world, AI programs in human form, hard-light energy constructs, Streets of Rage 4 style fighter" |
| `style` | "HD-2D pixel-art character sprite in the style of Octopath Traveler, limited palette of at most 12 colours, no gradients, no anti-aliasing, glowing neon light-lines on dark suit" |
| references | none |

Prompt:

> Futuristic Tron-style cyber warrior, a security AI in human form. Broad,
> square-shouldered male, big readable head, chibi proportions exactly 3.5 heads tall,
> short legs, wide stance, feet planted apart like a wall. Short cropped dark-blue
> hair, thick brows, small scar across the nose bridge, calm set expression, a thin
> ember-orange HUD visor strip over one eye. Skin-tight matte dark-navy bodysuit with
> glowing ember-orange circuit lines tracing along the arms, legs and spine like Tron
> light-lines. Angular steel-blue hard-shell armour plates on the shoulders, chest,
> forearms and shins, each plate with a glowing orange seam; the chest plate has one
> bright vertical orange light-stripe. Heavy boots with a glowing orange sole line. On
> his left forearm a gauntlet emitter projects a large translucent hard-light
> forcefield shield, a tall rectangular glowing orange energy barrier with a bright
> hexagon-pattern rim, taller than his waist, held at his side. Full body, standing
> idle pose, three-quarter front view facing slightly to the viewer's right. Clean
> 1-pixel very dark navy outline. Flat cel shading, two tones per colour plus one
> highlight, light from upper left; glow drawn as a 1 to 2 pixel bright line, no blur.
> Strong simple silhouette. No helmet covering the face, no cape, no horns, no spikes,
> no gun. Colours: dark navy, steel blue, ember orange glow, light skin.

### Carry-over rules for the other seven (proposed, not yet in the sheet)

Dark matte bodysuit as the shared base; each hero owns one glow hue for light-lines;
hard-shell plates only where the role needs them (Faraday heavy, Wraith none); every
prop becomes a hard-light or holographic construct in the hero's hue; one HUD element
on the face per hero (visor strip, lens, earpiece, halo ring) so the AI reading is on
the head, where the camera looks first.

---

## Run 1 — as per the current sheet (2026-11-01)

Comparison reference for SpriteCook vs ChatGPT. Spec is section 1 + the Faraday
sheet in [`art/CHARACTERS.md`](../../CHARACTERS.md). Static base image only.
Rejected by the user: on-spec, but the spec reads as a plain fantasy knight.

## Files

| File | What it is |
|---|---|
| `faraday_spritecook_ref.png` | SpriteCook's native pixel-perfect output, 100 × 100 RGBA, transparent. Sprite content is 58 × 99 px inside it. Each image pixel is one sprite pixel. |
| `faraday_spritecook_ref_8x.png` | Same image upscaled 8× nearest-neighbour (800 × 800) for viewing side by side with the ChatGPT ref. Not for use in-game. |
| `faraday_spritecook_64x96.png` | 64 × 96 nearest-neighbour version made locally (see below). SpriteCook did not output this size itself. |
| `faraday_spritecook_raw.jpg` | The underlying Gemini image before SpriteCook's grid detection and background removal, 768 × 1376 JPEG on white. Shows what the model actually drew. |
| `spritecook-assets.json` | SpriteCook asset ID + file hashes, so the asset can be reused as a style/reference image for the other seven heroes. |

## How it matches the sheet

- **Silhouette:** reads as a wall. Broad, square shoulders, feet planted apart, heavy
  boots. Strong thumbnail read even at 64 × 96. Pass.
- **Facing:** three-quarter front, turned slightly to the viewer's right. Pass.
- **Head:** short cropped dark-blue hair, thick brows, calm set expression. Pass.
- **Outfit:** steel-blue plate over a dark gambeson, flat rectangular shoulder plates
  with rivets that read as server panels, one ember-orange stripe down the chest.
  Pass; this is the strongest part of the result.
- **Prop:** tall shield held at his side on the viewer's right, reaching from shoulder
  to shin, with an orange light at its centre. Pass on placement and scale.
- **Avoid list:** no horns, cape, spikes, wires, screens or robot joints. Pass.
- **Outline:** continuous 1-px dark outline, dark navy, not pure black. Pass.
- **Transparency:** clean binary alpha, no fringe. Pass.

## Where it drifts

- **Proportions:** about 4 heads tall (head ≈ 25 px of 99), not 3.5. Head is a touch
  small and the legs a touch long for the Octopath chibi target. Correction prompt for
  a rerun: "same character, 3.5 heads tall, bigger head, shorter legs".
- **Scar:** the small scar across the nose bridge is missing.
- **Shield shape:** it is a heater/kite shield with a pointed bottom and a bevelled
  frame, not a flat "sealed door" with a rectangular silhouette. The orange light is
  there but as a small oval lamp rather than a door indicator.
- **Palette count:** 1,404 unique colours in a 58 × 99 sprite. SpriteCook's pixel pass
  snaps the grid but does not quantise colour, and the Gemini source is a JPEG, so
  every flat area is full of near-duplicate tones. It needs a palette snap before use.
  After snapping to the sheet's seven hexes it reads fine (see bucket table), so the
  design itself is within the 12-colour budget.
- **Palette hue drift** (mean of pixels nearest each sheet colour):

  | Sheet role | Sheet hex | SpriteCook mean | Note |
  |---|---|---|---|
  | Outline | `#1B1F3A` | `#0B1033` | darker and bluer than spec, almost black-navy |
  | Steel blue | `#4A6FA5` | `#5C7BA2` | lighter, greyer |
  | Dark blue | `#2B3F6B` | `#2E4469` | close |
  | Ember orange | `#F0803C` | `#D27D57` | duller, more brown; stripe and lamp use several oranges |
  | Gambeson | `#3A3F5C` | `#413F51` | close, but very little of it shows |
  | Skin | `#F2D3B3` | `#E7CAAE` | close |
  | Neutral light | `#E8E6F0` | `#9BB6D3` | no true whites; this bucket caught armour highlights |

- **Shading:** more than two tones per colour on the armour (there is a steel
  highlight, base, shadow, and a second darker shadow), so it is slightly busier than
  the "two tones plus one highlight" rule. Still flat cel, no gradients, no dithering.
- **Pixel grid:** the grid is real and even, which is better than ChatGPT normally
  manages. The trade is that SpriteCook chose the grid size (~58 px wide), not us.

## The 64 × 96 file

SpriteCook's "pixel-perfect" output is already at native sprite resolution, so the
64 × 96 version is a 0.97× nearest-neighbour downscale, not a clean integer step.
Steps: crop the content box (58 × 99 at offset 21,0), scale to 56 × 96 with nearest
neighbour, centre on a 64 × 96 transparent canvas at x = 4. Three sprite rows and two
columns are dropped, which is visible as a few 1-px notches on the shield frame and
boot soles. A rerun that asks for height 96 explicitly (see settings) would avoid this.
Palette not snapped; do that in Aseprite alongside the ChatGPT version so both go
through the same cleanup.

## Verdict vs the sheet

Costume, prop placement, silhouette and outline are on-spec and immediately usable as
a style reference for the other seven. Fix list for a rerun or hand clean-up:
bigger head (3.5 heads), add the nose scar, square off the shield into a door, snap the
palette to the sheet hexes, and lift the outline from `#0B1033` to `#1B1F3A`.

## Exact SpriteCook settings (repeatable)

Tool: `generate_game_art` via the SpriteCook MCP plugin. Account tier: free.
Cost: 12 credits (40 → 28). Job `5b6ffcee-1a4a-4f29-ba53-a8393c425dd2`.
Asset `36398dcd-8c64-40be-ae62-dc2046cec373`, labelled
"FIREWALL Faraday base idle v1 (SpriteCook ref)" in the SpriteCook library.

| Parameter | Value |
|---|---|
| `model` | `gemini-nano-banana-2.1` (SpriteCook's current default) |
| `pixel` | `true` |
| `bg_mode` | `transparent` |
| `mode` | `assets` |
| `width` × `height` | 64 × 96 (size hint only; SpriteCook returned 100 × 100 with 58 × 99 content) |
| `aspect_ratio` | `9:16` |
| `resolution` | `1K` |
| `quality` | `medium` (ignored by Gemini models) |
| `smart_crop` | `true` |
| `smart_crop_mode` | `tightest` |
| `outline_repair` | `true` (default) |
| `variations` | 1 |
| `colors` | `#1B1F3A, #4A6FA5, #2B3F6B, #F0803C, #3A3F5C, #F2D3B3, #E8E6F0` |
| `theme` | "fantasy adventurers who are AIs living inside a virtual world, stylised fantasy silhouettes with subtle circuit and interface motifs" |
| `style` | "HD-2D pixel-art character sprite in the style of Octopath Traveler, limited palette of at most 12 colours, no gradients, no anti-aliasing" |
| references / presets | none (no saved presets on the account) |

Prompt (the sheet's Faraday prompt plus the shared style block, with the "1024 × 1536
canvas" and "I will downscale" lines dropped because SpriteCook handles size):

> A broad, square-shouldered male warrior with short cropped dark-blue hair, thick
> brows, and a small scar across his nose bridge, calm set expression. Steel-blue plate
> armour with flat rectangular shoulder plates like server panels, one ember-orange
> stripe running down the chest plate, dark gambeson underneath, heavy boots. He holds
> a tall tower shield shaped like a sealed door at his side, taller than his waist,
> with a small orange light at its centre. Feet planted apart, immovable, reads as a
> wall. Full body, standing idle pose, three-quarter front view facing slightly to the
> viewer's right, feet visible, centered. Chibi proportions about 3.5 heads tall, large
> readable head, small hands and feet. Clean 1-pixel very dark navy outline (not
> black). Flat cel shading, two tones per colour plus one highlight, light from upper
> left. Strong simple silhouette. No horns, no cape, no spikes. No wires, cables,
> screens, or robot joints; he looks like a person. Colours: steel blue, dark navy,
> ember orange, light skin.

### Suggested changes for run 2 (not done)

- Pass `width=64, height=96` again but add "sprite is exactly 64 by 96 pixels" to the
  prompt, or try `model=pixel-engine-image-v1` (6 credits, draws at exactly 64 × 96,
  transparent, text-only, 100-word prompt limit) for a true-grid version.
- Add "head is one third of total height" and "rectangular door-shaped shield with a
  flat bottom edge" to the prompt.
- For the other heroes, pass this asset ID in `style_asset_ids` so they inherit the
  grid size, outline weight and shading.

## Tooling notes

- Python is not installed on this PC (only the Microsoft Store alias), so the analysis
  and the nearest-neighbour files were made with PowerShell + System.Drawing.
- SpriteCook's signed download URLs expire after about an hour; re-fetch via
  `get_asset_metadata` with the asset ID if a file needs re-downloading.
