# FIREWALL — techno / Tron prompts, v2 (draft, 2026-11-02)

Working prompts for the "futuristic Tron, hard-light fighter" direction the user asked
for after rejecting the fantasy-knight Faraday. Not yet folded into
[`art/CHARACTERS.md`](../CHARACTERS.md); do that once the eight are approved.

## Shared rules (techno v2)

- Base layer for everyone: a matte dark bodysuit (`#3A3F5C` with `#1B1F3A` shadow).
- Each hero owns **one glow hue**. Light-lines, seams and the prop all use it.
- Hard-shell plates only where the role needs them: Faraday heavy, Atlas light, the
  rest none.
- Every prop is a hard-light or holographic construct, drawn **opaque** with a bright
  rim (translucent props rendered the arm behind them as mud in Faraday v2).
- One HUD element on each face so the AI reading is on the head: visor strip, lens,
  earpiece, halo ring, goggles, glowing eyes.
- Keep the sheet's silhouettes, heights, skin tones and personalities. Faces visible.
- Still HD-2D pixel art: 1-px `#1B1F3A` outline, two tones per colour plus one
  highlight, light upper-left, glow as a 1 to 2 px bright line, no blur.

### Proportion fix

Gemini ignored "3.5 heads tall" twice. Use this wording in every prompt:
"super-deformed chibi, 3.5 heads tall, head as wide as the shoulders, legs shorter
than the torso, large readable head".

### SpriteCook settings used for every hero

`generate_game_art`, `model=gemini-nano-banana-2.1`, `pixel=true`,
`bg_mode=transparent`, `width=64`, `height=96`, `aspect_ratio=9:16`,
`smart_crop=true`, `smart_crop_mode=tightest`, `outline_repair=true`, `resolution=1K`,
`style_asset_ids=["33b8ada8-8804-4a56-86b6-bf6259878878"]` (Faraday v2) so the whole
cast inherits one grid size, outline weight and shading.
`theme`: "neon cyberpunk Tron digital world, AI programs in human form, hard-light
energy constructs, Streets of Rage 4 style fighter".
`style`: "HD-2D pixel-art character sprite in the style of Octopath Traveler, limited
palette of at most 12 colours, no gradients, no anti-aliasing, glowing neon light-lines
on dark suit".
`colors`: the hero's hex list below.

Shared tail appended to every prompt:

> Full body, standing idle pose, three-quarter front view facing slightly to the
> viewer's right, feet visible. Super-deformed chibi, 3.5 heads tall, head as wide as
> the shoulders, legs shorter than the torso, large readable head. Clean 1-pixel very
> dark navy outline. Flat cel shading, two tones per colour plus one highlight, light
> from upper left; glow drawn as a 1 to 2 pixel bright line, no blur. Strong simple
> silhouette. No helmet covering the face, no gun.

---

## Faraday — security daemon, Warrior (done, run 2)

Glow hue: ember orange. Colours `#1B1F3A #2B3F6B #4A6FA5 #F0803C #FFC08A #3A3F5C #F2D3B3 #E8E6F0`.
See `faraday/NOTES.md` run 2 for the prompt and result. Next pass: opaque shield panel,
gauntlet in front of it, proportion wording above.

## Iris — search and indexing AI, Scholar

Glow hue: cyan. Colours `#1B1F3A #6B4FBB #3E2A80 #4FE3F0 #BDF6FA #3A3F5C #C98E63 #E8E6F0`.

> Futuristic Tron-style scholar, a search AI in human form. Tall, slim female with a
> long neck and chin slightly raised. Long straight violet hair in a low ponytail. A
> sleek wide-brimmed flat hat with a glowing cyan light-band. A single frameless
> hard-light cyan lens floats in front of one eye, drawn as a bright opaque disc with a
> glowing rim; one hand is raised toward it. Fitted violet long coat over a matte dark
> bodysuit, the coat front covered in a neat grid of small square data-cells with thin
> cyan glowing edges, high collar, cyan light-lines at the cuffs and hem. Slim trousers,
> ankle boots with a cyan sole line. Three small cyan holographic index cards hover
> beside the raised hand. No books, no scrolls, no framed glasses, no armour.
> Colours: violet, deep violet, cyan glow, dark navy, mid skin.

## Remedy — medical diagnostic AI, Apothecary

Glow hue: mint. Colours `#1B1F3A #7FE0C3 #3FA58C #E8E6F0 #F06A6A #3A3F5C #F2D3B3 #B9B7D6`.

> Futuristic Tron-style medic, a diagnostic AI in human form. Shortest of the cast,
> soft and rounded female, relaxed stance, leaning slightly under the weight of a
> satchel. Mint-green hair in a loose bun with two escaping strands, round face, kind
> half-closed eyes, small smile, a small mint earpiece with a glowing light at her
> temple. Sleek white medic coat with mint light-line trim and rolled sleeves over a
> matte dark bodysuit, a coral cross-shaped clasp at the collar, coral gloves with
> glowing mint fingertips, short practical skirt, flat shoes. An oversized white
> hard-shell medical satchel with coral panels and three small glowing mint status
> bars hangs at her hip from a cross-body strap. A mint holographic heartbeat line
> hovers over her open palm. No syringes, no skulls, no armour. Colours: mint, white,
> coral, dark navy, light skin.

## Echo — generative music and voice AI, Bard

Glow hue: gold. Colours `#1B1F3A #E0409A #8E2466 #F5C84B #FFE9A6 #3A3F5C #C98E63 #E8E6F0`.

> Futuristic Tron-style performer, a music AI in human form. Female standing
> asymmetrically, one hip out, one hand on the hip, the other hand loose. Magenta hair
> cut long on one side and shaved short on the other, confident grin, one eyebrow
> raised. A slim headset with a boom mic glowing gold at the tip. Cropped gold jacket
> with one long sleeve and one bare arm, a row of glowing gold equaliser bars across the
> hem, magenta top, a flared half-skirt made of opaque gold hard-light panels over a
> matte dark bodysuit with magenta light-lines down the legs, boots with gold light
> trim. Two opaque gold hard-light sound-wave rings hover around the free hand. No
> lute, no harp, no armour. Colours: magenta, deep magenta, gold glow, dark navy, mid
> skin.

## Wraith — penetration-testing AI, Thief

Glow hue: acid green. Colours `#1B1F3A #2A2D3E #4A4F6B #A6FF3C #4F9E12 #3A3F5C #7A4B32 #E8E6F0`.

> Futuristic Tron-style infiltrator, a penetration-testing AI in human form. Narrow,
> wiry female, shoulders hunched forward, weight on the balls of her feet, ready to
> move. A sleek matte charcoal hood up, face half in shadow, only the lower face and two
> glowing acid-green eyes visible, smirking. Charcoal layered stealth wrap with a short
> hooded cape over a matte dark bodysuit, many thin straps and small pouches,
> fingerless gloves, soft wrapped boots. A single acid-green light-seam runs down one
> sleeve like a crack, and the cape's lower edge breaks into a few small glitch pixels.
> She holds twin short knives low in a reverse grip, the blades made of bright opaque
> acid-green hard-light with a darker green core. No skull mask, no scarf, no big
> weapon, no armour plates. Colours: charcoal, slate, acid green glow, deep green, dark
> navy, deep skin.

## Atlas — mapping and navigation drone AI, Hunter

Glow hue: teal. Colours `#1B1F3A #D9B370 #8E7A48 #2FB8A6 #1C6E66 #B5B8C9 #3A3F5C #7A4B32`.

> Futuristic Tron-style explorer, a mapping AI in human form. Compact, sturdy,
> gender-neutral figure in a square stance, hands resting on a wide belt. Short
> sand-coloured hair under a teal bandana, goggles with glowing teal lenses pushed up on
> the forehead, weathered face, steady eyes looking slightly to the side as if
> surveying. Sand-coloured field jacket with many pockets over a matte dark bodysuit
> with thin teal light-lines, teal scarf, rolled cargo trousers, sturdy boots, light
> grey hard-shell knee pads. The belt carries a small projector that shows a teal
> holographic map grid floating above it. A small round teal drone companion the size
> of a head hovers at shoulder height, one large glowing lens, a tiny antenna. No bow,
> no arrows, no animal. Colours: sand, khaki, teal glow, deep teal, drone grey, dark
> navy, deep skin.

## Lumen — guidance and alignment AI, Cleric

Glow hue: warm gold. Colours `#1B1F3A #E8E6F0 #B9B7D6 #F5C84B #B8862B #FFE9A6 #3A3F5C #F2D3B3`.

> Futuristic Tron-style guide, an alignment AI in human form. Tall, upright female
> with long vertical lines, hands folded over a staff. Long loose white hair tinted
> warm gold at the tips, serene face, soft open eyes. A thin tilted gold hard-light
> ring floats behind her head like a halo, drawn as a segmented UI ring with small
> gaps. Long sleek white robe with a glowing gold light-line hem and one gold vertical
> light-line down the front, wide sleeves, over a matte dark bodysuit visible at the
> collar, gold light-trimmed boots. She holds a tall slim staff whose tip is a floating
> opaque gold hard-light lantern, a glowing hexagonal prism hovering just above the
> staff. No cross, no wings, no church iconography, no armour. Colours: white, cool
> lavender-white shadow, warm gold glow, deep gold, dark navy, light skin.

## Lambda — formal-logic AI, Calculator

Glow hue: chalk white. Colours `#1B1F3A #3B3B8F #23235C #F2F2FA #7D7DC4 #3A3F5C #F2D3B3 #E8E6F0`.

> Futuristic Tron-style logician, a theorem-proving AI in human form. Angular,
> straight-backed, gender-neutral figure, one arm behind the back, the other raised
> with index finger up as if making a point. Indigo hair in a severe geometric cut with
> a straight fringe and sharp angles, narrow eyes, thin mouth, unreadable expression, a
> small grid of three glowing white dots on one temple. Long indigo coat cut in
> straight lines with a faint glowing chalk-white grid pattern, high stiff collar,
> white gloves, straight trousers, pointed shoes, over a matte dark bodysuit. Nothing
> on him is round. A chalk-white opaque hard-light sigil shaped like an inverted letter
> A floats above the raised hand with two thin white lines orbiting it. No calculator,
> no abacus, no numbers on clothing, no glasses, no armour. Colours: indigo, deep
> indigo, chalk white glow, pale grid, dark navy, light skin.

---

## Credit plan

Nano Banana 2.1 costs 12 credits per image. Seven remaining heroes at one image each
is 84 credits; with one retry each, 168. Cheaper same-family option: Nano Banana 2
Lite at 8 credits (56 for seven), untested for this style. Pixel Engine Image v1 is 6
credits and draws exactly 64 × 96 with transparency, but takes no reference images and
only 100 words of prompt, so it cannot inherit Faraday's look.
