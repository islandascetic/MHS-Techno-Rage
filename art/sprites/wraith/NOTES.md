# Wraith — SpriteCook v2, techno / Tron direction (2026-11-02)

First hero generated after Faraday under the techno v2 rules in
[`../PROMPTS_techno_v2.md`](../PROMPTS_techno_v2.md). Chosen second because she is the
opposite end of the cast from Faraday (no armour, hooded, narrow), to test that the
shared rules still keep the heroes distinct. Faraday v2 was passed as a style
reference.

## Files

| File | What it is |
|---|---|
| `wraith_spritecook_v2_ref.png` | Native pixel-perfect output, 240 × 240 RGBA, transparent. Content 128 × 240 px. |
| `wraith_spritecook_v2_ref_3x.png` | 3× nearest-neighbour view (720 × 720). |
| `wraith_spritecook_v2_64x96.png` | Local nearest-neighbour downscale, content 51 × 96 on a 64 × 96 canvas. A 0.4× reduction, silhouette check only. |
| `wraith_spritecook_v2_raw.jpg` | Gemini source before SpriteCook processing, 768 × 1376 on white. |
| `spritecook-assets.json` | Asset ID and file hashes. |

## Review

- **Reads as an AI and as Wraith:** yes. Hood, two glowing acid-green eyes, smirk,
  strap-and-pouch harness, single green light-seam down the arm, cape edge breaking
  into glitch pixels, twin green hard-light knives in a reverse grip. Deep skin as per
  the sheet.
- **Distinct from Faraday:** completely. Narrow hunched silhouette against his wall;
  almost no glow (two eyes, one seam, two blades) against his light-lined suit. The
  shared dark-suit base still ties them together.
- **Proportions:** about 4 heads tall (head ≈ 60 px of 240). Better than Faraday v2
  (4.5) but still not 3.5, even with the new "head as wide as the shoulders" wording.
  Treat 4 heads as what this model will give and either accept it cast-wide or fix in
  hand clean-up.
- **Glitch pixels:** present on the cape edge and read well. Keep this as her
  signature; it also ties her to ROOT's corruption motif.
- **Knife blades:** drawn opaque with a bright rim and darker core as asked. No muddy
  see-through this time, which confirms the "opaque hard-light" rule for props.
- **Grid:** SpriteCook chose 128 × 240 content, larger again than Faraday v2's
  112 × 204. The style reference did not lock the grid size. Both are roughly a
  128 × 192 to 128 × 256 class sprite, so the cast could standardise on 128 wide and
  downscale to 64 only if the game needs it.
- **Palette:** 2,716 unique colours, needs the same snap. After snapping, hues match
  the sheet closely (acid green `#AAFB49` vs `#A6FF3C`, charcoal `#2B3042` vs
  `#2A2D3E`). Outline mean `#0E1127`, darker than the `#1B1F3A` spec, same as Faraday.
- **Hood:** hair is fully hidden as the sheet wants. The hood silhouette has a slight
  point at the back; fine.
- **Facing:** three-quarter front, facing viewer's right. Knives on both sides, so the
  horizontal flip for left-facing is safe.

## Exact SpriteCook settings

Tool `generate_game_art`. Cost 12 credits (16 → 4). Job
`350c9f50-d112-4ee3-b059-26b2d8b95cfe`. Asset `1d1c94be-895e-4dbe-97cd-47d93da48802`,
labelled "FIREWALL Wraith v2 techno Tron idle (SpriteCook)". The MCP call timed out
client-side after 80 s while the job sat in SpriteCook's queue; the job ran and
succeeded anyway and was recovered with `list_active_jobs`, then `check_job_status`.

| Parameter | Value |
|---|---|
| `model` | `gemini-nano-banana-2.1` |
| `pixel` / `bg_mode` / `mode` | `true` / `transparent` / `assets` |
| `width` × `height` | 64 × 96 hint (returned 240 × 240, content 128 × 240) |
| `aspect_ratio` / `resolution` | `9:16` / `1K` |
| `smart_crop` / `smart_crop_mode` | `true` / `tightest` |
| `outline_repair` | `true` |
| `style_asset_ids` | `["33b8ada8-8804-4a56-86b6-bf6259878878"]` (Faraday v2) |
| `colors` | `#1B1F3A, #2A2D3E, #4A4F6B, #A6FF3C, #4F9E12, #3A3F5C, #7A4B32, #E8E6F0` |
| `theme` / `style` | as in `PROMPTS_techno_v2.md` |

Prompt: the Wraith block in `PROMPTS_techno_v2.md` plus the shared tail, verbatim.
