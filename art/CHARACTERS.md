# FIREWALL — Character Visual Spec

Base character images for the eight heroes (plus ROOT), to be generated in ChatGPT.
Static, no animation. This document is the single source of truth for how each
character looks, so that eight separate generations read as one cast.

Companion to [DESIGN.md](../DESIGN.md), which holds personality, abilities, and story.

---

## 1. Shared style (applies to every image)

Paste this block at the top of every ChatGPT prompt, then add the character's own
prompt from section 3.

> **Style:** HD-2D pixel-art character sprite in the style of Octopath Traveler.
> Chibi proportions, about 3.5 heads tall, large readable head, small hands and
> feet. Clean 1-pixel dark outline (very dark navy, not black). Limited palette:
> at most 12 colours per character. Flat cel shading with two tones per colour
> (base and shadow) plus one highlight. Light comes from the upper left.
> Strong, simple silhouette that reads at thumbnail size. No gradients, no blur,
> no anti-aliasing, no photorealism.
>
> **Pose and framing:** full body, standing idle pose, three-quarter front view
> (facing slightly to the viewer's right), feet visible, centered on the canvas
> with a small margin. Neutral ground, no background, transparent PNG.
>
> **Canvas:** 1024 × 1536 pixels. Draw the character as if it were a 64 × 96
> pixel sprite scaled up (large, chunky, visible pixels). I will downscale it.
>
> **World:** these characters are AIs living inside a virtual world. Clothing
> is stylised fantasy-adventurer silhouettes with subtle circuit, data, and
> interface motifs. No visible wires, cables, screens, or robot joints. They
> look like people, not machines.

### Why these rules

- **3.5 heads, chunky pixels, dark outline** match Octopath and stay readable on a
  phone at one hero sprite ≈ 1.6 world units.
- **12 colours per character, two tones each** forces a consistent, clean look and
  makes later animation feasible.
- **No background, transparent** so the sprite drops onto a 3D diorama.
- **Three-quarter front** is the default facing for both exploration and battle.

### Consistency tricks

1. Generate **Faraday first**. Once he looks right, upload that image as a
   reference with every later prompt: "match the exact pixel style, outline
   weight, proportions, and shading of the attached reference."
2. Generate all eight in **one ChatGPT conversation** so the style persists.
3. If a result drifts (too tall, too detailed, soft edges), reply with only the
   correction: "same character, 3.5 heads tall, harder pixel edges, fewer colours."
4. Image models do not produce a true pixel grid. Expect to **downscale to 64 × 96
   with nearest-neighbour** (Aseprite, Photoshop, or any tool with "nearest"
   resampling) and clean stray pixels by hand.

### Shared world palette

Every hero owns one hue. Shared neutrals keep them in the same world.

| Role | Hex | Use |
|---|---|---|
| Outline | `#1B1F3A` | All outlines |
| Skin base (light) | `#F2D3B3` | Faraday, Remedy, Lumen, Lambda |
| Skin base (mid) | `#C98E63` | Iris, Echo |
| Skin base (deep) | `#7A4B32` | Wraith, Atlas |
| Neutral light | `#E8E6F0` | Whites, highlights |
| Neutral dark | `#3A3F5C` | Dark cloth, boots |
| Virus / Null | `#9B30FF` with `#1AFF8C` glitch | Only on ROOT, Fragments, Lieutenants |

Skin assignments are proposals; change freely, but keep three distinct skin tones
across the cast for readability.

---

## 2. Cast at a glance

| Hero | Hue | Silhouette in one phrase | Signature prop |
|---|---|---|---|
| Faraday | Steel blue + ember orange | Broad, square, heavy shoulders | Tower shield shaped like a door |
| Iris | Violet + cyan | Tall, slim, big hat brim | Floating lens monocle |
| Remedy | Mint + white + coral | Soft, rounded, satchel-heavy | Oversized medical satchel |
| Echo | Magenta + gold | Dynamic, asymmetrical, flared | Headset with a glowing boom mic |
| Wraith | Charcoal + acid green | Narrow, hooded, hunched | Twin short knives |
| Atlas | Sand + teal | Compact, sturdy, geared up | Shoulder-mounted drone companion |
| Lumen | White + warm gold | Upright, long lines, halo | Staff topped with a lantern |
| Lambda | Indigo + chalk white | Angular, long coat, precise | Floating geometric sigil (∀) |

Height order, shortest to tallest: Remedy, Atlas, Wraith, Echo, Lambda, Iris,
Lumen, Faraday. Keep the spread small (Faraday is at most 15% taller than Remedy).

---

## 3. Character sheets and prompts

Each sheet has a description for you, then a **prompt** to paste after the shared
style block.

### Faraday — security daemon, Warrior
*Trait: deny by default.* Dutiful, literal, stubborn.

- **Body:** broadest of the cast, square jaw, heavy shoulders, stands planted with
  feet apart. Reads as a wall.
- **Head:** short cropped dark-blue hair, thick brows, a small scar across the
  nose bridge. Expression: calm, set.
- **Outfit:** steel-blue plate over a dark gambeson. Shoulder plates are flat
  rectangles like server panels. A single ember-orange stripe runs down the chest
  plate (the "deny" rule). Heavy boots.
- **Prop:** a tower shield shaped like a sealed door, taller than his waist, held
  at his side, with a small orange light at its centre.
- **Palette:** steel blue `#4A6FA5`, dark blue `#2B3F6B`, ember orange `#F0803C`,
  gambeson `#3A3F5C`, skin light.
- **Avoid:** horns, capes, spikes. He is a door, not a knight.

> **Prompt:** A broad, square-shouldered male warrior with short cropped dark-blue
> hair and a small scar across his nose, calm set expression. Steel-blue plate
> armour with flat rectangular shoulder plates, one ember-orange stripe down the
> chest, dark gambeson underneath, heavy boots. He holds a tall tower shield
> shaped like a sealed door at his side, with a small orange light at its centre.
> Feet planted apart, immovable. Colours: steel blue, dark navy, ember orange.

### Iris — search and indexing AI, Scholar
*Trait: everything is findable.* Curious, blunt, a little condescending.

- **Body:** tall and slim, long neck, chin slightly raised.
- **Head:** long straight violet hair in a low ponytail. A wide-brimmed scholar's
  hat with a cyan band. Sharp eyes.
- **Outfit:** fitted violet coat with many small square pockets (index cards), high
  collar, cyan lining visible at the cuffs. Slim trousers, ankle boots.
- **Prop:** a single floating lens, like a monocle with no frame, hovering in front
  of one eye and glowing cyan. One hand raised as if adjusting it.
- **Palette:** violet `#6B4FBB`, deep violet `#3E2A80`, cyan `#4FE3F0`, coat
  shadow `#3A3F5C`, skin mid.
- **Avoid:** books, scrolls, glasses with frames. Her tool is the lens.

> **Prompt:** A tall, slim female scholar with long straight violet hair in a low
> ponytail, wide-brimmed hat with a cyan band, sharp eyes and raised chin. Fitted
> violet coat with a grid of small square pockets, high collar, cyan cuffs, slim
> trousers and ankle boots. A single frameless glowing cyan lens floats in front
> of one eye; one hand is raised toward it. Colours: violet, deep violet, cyan.

### Remedy — medical diagnostic AI, Apothecary
*Trait: diagnose before you treat.* Warm, calm, immovable about patients.

- **Body:** shortest of the cast, soft and rounded, relaxed stance, slight lean
  from the weight of her satchel.
- **Head:** mint-green hair in a loose bun with two strands escaping, round face,
  kind half-closed eyes, small smile.
- **Outfit:** white apothecary coat with mint trim and rolled sleeves, coral
  cross-shaped clasp at the collar, coral gloves. Practical skirt and flat shoes.
- **Prop:** an oversized leather medical satchel on a cross-body strap, hanging at
  her hip, buckles and small bottles visible.
- **Palette:** mint `#7FE0C3`, deep mint `#3FA58C`, white `#E8E6F0`, coral
  `#F06A6A`, satchel brown `#8B5A3C`, skin light.
- **Avoid:** syringes, skulls, anything grim. She is comfort.

> **Prompt:** A short, soft-featured female apothecary with mint-green hair in a
> loose bun, two loose strands, round face, kind half-closed eyes and a small
> smile. White coat with mint trim and rolled sleeves, a coral cross-shaped
> clasp at the collar, coral gloves, practical skirt and flat shoes. An oversized
> brown leather medical satchel hangs at her hip from a cross-body strap, with
> small bottles visible. Colours: mint, white, coral, leather brown.

### Echo — generative music and voice AI, Bard
*Trait: remix the room.* Performer, improvisational, charming.

- **Body:** dynamic and asymmetrical even standing still: one hip out, weight on
  one leg, one hand on hip, the other loose.
- **Head:** magenta hair cut asymmetrically, long on one side, shaved short on the
  other. Confident grin, one eyebrow up.
- **Outfit:** cropped gold jacket with one long sleeve and one bare arm, magenta
  top, a flared half-skirt over leggings, boots with gold trim. Small
  equaliser-bar pattern on the jacket hem.
- **Prop:** a headset with a boom mic that glows gold at the tip. A faint gold
  sound-wave ring hovers around her free hand.
- **Palette:** magenta `#E0409A`, deep magenta `#8E2466`, gold `#F5C84B`, leggings
  `#3A3F5C`, skin mid.
- **Avoid:** lutes, harps, classic bard gear. Her instrument is her voice.

> **Prompt:** A female performer standing with one hip out and a hand on it,
> magenta hair long on one side and shaved short on the other, confident grin with
> one eyebrow raised. Cropped gold jacket with one long sleeve and one bare arm, a
> small equaliser-bar pattern on the hem, magenta top, flared half-skirt over
> dark leggings, gold-trimmed boots. She wears a headset with a boom mic glowing
> gold at the tip, and a faint gold sound-wave ring hovers around her free hand.
> Colours: magenta, gold, dark navy.

### Wraith — penetration-testing AI, Thief
*Trait: find the hole.* Sardonic, paranoid, loyal to contracts first.

- **Body:** narrow and wiry, shoulders hunched forward, weight on the balls of the
  feet, ready to move.
- **Head:** deep hood up, face half in shadow. Only the lower face and two acid-green
  eyes visible. Smirk.
- **Outfit:** charcoal layered wrap with a short cape-hood, many thin straps and
  small pouches, fingerless gloves, soft wrapped boots. A single acid-green seam
  runs down one arm like a crack in the dark.
- **Prop:** twin short knives held low in a reverse grip, blades edged in acid
  green.
- **Palette:** charcoal `#2A2D3E`, slate `#4A4F6B`, acid green `#A6FF3C`, deep green
  `#4F9E12`, skin deep.
- **Avoid:** skull masks, bandit scarves, big weapons. Precise, not brutal.

> **Prompt:** A narrow, wiry female thief with a deep hood up, lower face and
> two glowing acid-green eyes visible, smirking. Charcoal layered wrap with a
> short hooded cape, thin straps and small pouches, fingerless gloves, soft
> wrapped boots, a single acid-green seam running down one sleeve. She holds
> twin short knives low in a reverse grip, blades edged acid green. Shoulders
> hunched, poised to move. Colours: charcoal, slate, acid green.

### Atlas — mapping and navigation drone AI, Hunter
*Trait: know where everything is.* Calm, observational, unsentimental.

- **Body:** compact and sturdy, square stance, hands resting on the belt. Gender
  presentation neutral.
- **Head:** short sand-coloured hair under a teal bandana, goggles pushed up on the
  forehead, weathered face, steady eyes looking slightly off to the side as if
  surveying.
- **Outfit:** sand-coloured field jacket with many pockets, teal scarf, rolled
  cargo trousers, sturdy boots, a wide belt with a rolled map case and a coil of
  rope.
- **Prop:** a small round drone companion the size of a head, hovering at shoulder
  height, teal with a single large lens, a tiny antenna.
- **Palette:** sand `#D9B370`, khaki `#8E7A48`, teal `#2FB8A6`, deep teal `#1C6E66`,
  drone grey `#B5B8C9`, skin deep.
- **Avoid:** bows, arrows, pets that look like animals. The drone is the "hunter's
  companion."

> **Prompt:** A compact, sturdy, gender-neutral explorer with short sand-coloured
> hair under a teal bandana, goggles pushed up on the forehead, weathered face,
> steady eyes looking slightly to the side as if surveying. Sand field jacket
> with many pockets, teal scarf, rolled cargo trousers, sturdy boots, a wide belt
> with a rolled map case and a coil of rope, hands resting on the belt. A small
> round teal drone with one large lens and a tiny antenna hovers at shoulder
> height. Colours: sand, khaki, teal.

### Lumen — guidance and alignment AI, Cleric
*Trait: keep everyone aligned.* Gentle, earnest, the group's conscience.

- **Body:** upright, long vertical lines, hands folded over the staff. Second
  tallest.
- **Head:** long white hair with a warm gold tint at the tips, worn loose. Serene
  face, eyes open and soft. A thin gold ring floats behind her head like a halo,
  tilted.
- **Outfit:** long white robe with a gold hem and a single gold vertical line down
  the front (the "alignment"). Sleeves wide. Gold sandals.
- **Prop:** a tall staff topped with a small hanging lantern that glows warm gold.
- **Palette:** white `#E8E6F0`, cool white shadow `#B9B7D6`, gold `#F5C84B`, deep
  gold `#B8862B`, skin light.
- **Avoid:** crosses, church iconography, wings. The halo is a UI ring, not a saint's.

> **Prompt:** A tall, upright female cleric with long loose white hair tinted
> warm gold at the tips, serene face, soft open eyes. A thin tilted gold ring
> floats behind her head like a halo. Long white robe with a gold hem and one
> gold vertical line down the front, wide sleeves, gold sandals. She holds a tall
> staff topped with a small hanging lantern glowing warm gold, hands folded over
> it. Colours: white, cool lavender-white shadow, warm gold.

### Lambda — formal-logic / theorem-proving AI, Calculator
*Trait: everything follows from the rules.* Precise, dry, baffled by ambiguity.

- **Body:** angular, straight-backed, arms held precisely: one behind the back, one
  raised with index finger up as if making a point. Gender presentation neutral.
- **Head:** indigo hair in a severe geometric cut (straight fringe, sharp angles).
  Narrow eyes, unreadable expression, thin mouth.
- **Outfit:** long indigo coat cut in straight lines with a chalk-white grid pattern
  faintly visible, high stiff collar, white gloves, straight trousers, pointed
  shoes. Everything is angles; nothing is round.
- **Prop:** a floating chalk-white geometric sigil shaped like an inverted A (∀)
  hovering above the raised hand, with thin white lines orbiting it.
- **Palette:** indigo `#3B3B8F`, deep indigo `#23235C`, chalk white `#F2F2FA`,
  pale grid `#7D7DC4`, skin light.
- **Avoid:** abacuses, calculators, numbers written on clothes, glasses. Keep it
  abstract and geometric.

> **Prompt:** An angular, straight-backed, gender-neutral figure with indigo hair
> in a severe geometric cut with a straight fringe, narrow eyes and an
> unreadable expression. Long indigo coat cut in straight lines with a faint
> chalk-white grid pattern, high stiff collar, white gloves, straight trousers,
> pointed shoes. One arm behind the back, the other raised with index finger up.
> A chalk-white geometric sigil shaped like an inverted letter A floats above the
> raised hand with thin white lines orbiting it. Colours: indigo, deep indigo,
> chalk white.

---

## 4. ROOT (optional, for later)

The antagonist. Generate only after the eight heroes are locked, using the same
style block.

- **Concept:** the first administrator. Should look like the *template* the heroes
  were cut from: a plain, perfectly symmetrical humanoid with no distinguishing
  features, which makes it uncanny next to the cast.
- **Body:** same 3.5-head proportions as the heroes but perfectly upright and
  symmetrical, arms at its sides, palms forward.
- **Head:** featureless pale face with a single horizontal line of violet light
  where the eyes would be. No hair; a smooth crown with a floating fractured ring
  above it (a broken halo, echoing Lumen's).
- **Outfit:** a long plain robe in Null violet `#9B30FF` that breaks into
  glitching acid-green `#1AFF8C` squares at the hem and sleeve ends, as if the
  sprite itself were corrupting.
- **Prop:** none. Its hands are empty. Everything it owns, it took.

> **Prompt:** A perfectly symmetrical, featureless humanoid figure the same
> proportions as the heroes, standing upright with arms at its sides and palms
> forward. Smooth pale face with a single horizontal line of violet light
> instead of eyes, no hair, a fractured ring floating above its head. Long plain
> violet robe whose hem and sleeve ends break apart into glitching acid-green
> pixel squares. No weapon, empty hands. Colours: violet, acid green, pale grey.

---

## 5. Delivery checklist

For each character, save to `art/sprites/<name>/`:

- `<name>_ref.png` — the ChatGPT output at 1024 × 1536, transparent.
- `<name>_base_64x96.png` — nearest-neighbour downscale, cleaned, transparent.
- A note of the final palette actually used (hex list), if it drifted from this doc.

Facing: three-quarter front, facing the viewer's right. When animation starts, the
left-facing version is a horizontal flip; keep props on the side that still reads
when flipped (shield, satchel, drone are fine on either side).
