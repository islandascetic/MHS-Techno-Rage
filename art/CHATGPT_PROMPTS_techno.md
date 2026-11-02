# FIREWALL — ChatGPT prompt pack, techno / Tron direction (draft, 2026-11-02)

Paste-ready prompts for generating the eight hero base sprites in ChatGPT, in the
Octopath Traveler HD-2D look, with the futuristic hard-light direction the user chose
after the fantasy-knight Faraday was rejected.

This pack supersedes sections 1 and 3 of [`CHARACTERS.md`](CHARACTERS.md) while the
designs are in draft. Fold it back into that file once the eight are approved.
Mechanics, traits and personalities in [`DESIGN.md`](../DESIGN.md) are unchanged.

---

## 1. How to run it

1. One ChatGPT conversation for the whole cast, so the style persists.
2. Start every message with the **shared style block** (section 2), then paste one
   hero prompt (section 3). Ask for one image at a time.
3. Do **Faraday first**. When he is right, attach his image to every later prompt and
   add: "Match the exact pixel density, outline weight, proportions, palette
   restraint and shading of the attached reference. Same scale, same camera."
4. If a result drifts, reply with a correction from section 4 only, nothing else.
5. Save the raw output as `art/sprites/<name>/<name>_chatgpt_ref.png`, then follow the
   post-processing checklist (section 5) to produce `<name>_base_64x96.png`.

Why these prompts look different from the old ones: the SpriteCook runs showed that
"Octopath Traveler" alone does not control pixel density. The model draws a detailed
200-pixel chibi unless the prompt forbids detail. These prompts cap detail hard
(tiny faces, no feature smaller than two sprite pixels) and tell the model that
bloom and lighting will come from the game engine, not the PNG.

---

## 2. Shared style block (paste at the top of every prompt)

> **Style:** HD-2D pixel-art character sprite in the exact style of Octopath Traveler
> and Octopath Traveler II: a small, low-resolution sprite with chunky, perfectly
> square pixels on a fixed grid. Squat chibi proportions, 3 heads tall, head about as
> wide as the shoulders, short legs. The face is minimal: eyes are two dark pixels,
> no drawn mouth, no nose, no eyebrows unless they are one pixel thick. No feature
> smaller than two sprite pixels. Soft dark outline (very dark navy `#1B1F3A`, never
> black), one pixel thick, with the outline dropped on the lit side where Octopath
> would drop it. Muted, slightly desaturated colours, at most 12 colours per
> character: for each material a base tone, one shadow tone, and at most one
> highlight. Light from the upper left. Flat cel shading, no gradients, no dithering,
> no blur, no anti-aliasing, no painted glow or bloom. Glowing parts are drawn as a
> flat bright colour one or two pixels wide; the game engine adds the bloom.
>
> **World:** these characters are AI programs living inside a virtual world, in a
> futuristic Tron-like style. Everyone wears a matte dark bodysuit as the base layer
> (`#3A3F5C`, shadow `#1B1F3A`). Each character owns one glow colour used for thin
> light-lines on the suit, one HUD element on the head, and a hard-light prop. Props
> made of hard light are drawn opaque with a bright rim, never see-through. No visible
> wires, cables, screens, or robot joints: they are people made of light, not robots.
> Nothing medieval: no leather straps with buckles, no chainmail, no wood.
>
> **Pose and framing:** full body, standing idle pose with weight settled, three-quarter
> front view facing slightly to the viewer's right, feet visible, centred with a small
> margin. No background, no ground shadow, transparent PNG.
>
> **Canvas:** 1024 × 1536 pixels. Draw the character as a 64 × 96 pixel sprite scaled
> up exactly 16 times, so every sprite pixel is a crisp 16 × 16 square aligned to the
> grid. The character itself should occupy about 48 of the 64 columns and about 80 of
> the 96 rows. I will downscale it back to 64 × 96 with nearest-neighbour sampling,
> so any pixel that is not on the grid will be lost.

---

## 3. Hero prompts (paste one after the style block)

Each hero lists the three cues that must still read at 64 × 96. If the result loses
one of them, that is the correction to send.

### Faraday — security daemon, Warrior
*Deny by default.* Glow: ember orange. Height: tallest, broadest.

Palette: `#1B1F3A` outline · `#2B3F6B` dark blue · `#4A6FA5` steel · `#F0803C` ember · `#FFC08A` glow highlight · `#3A3F5C` suit · `#F2D3B3` skin · `#E8E6F0` neutral.

Must read at thumbnail: (1) wall-like square silhouette, (2) one vertical orange stripe on the chest, (3) tall rectangular orange hard-light shield at his side.

> **Character:** Faraday, a security AI. Broad and square, the heaviest silhouette of
> the cast, feet planted wide, immovable. Short cropped dark-blue hair drawn as a flat
> cap of colour. A thin ember-orange visor line across one eye is his HUD element.
> Over the dark bodysuit he wears angular steel-blue hard-shell plates on the
> shoulders, chest, forearms and shins, each plate a simple flat shape with one
> orange seam pixel-line. One bright vertical orange stripe runs down the centre of
> the chest plate. Heavy boots with an orange sole line. On his left forearm a small
> gauntlet projects a tall rectangular ember-orange hard-light shield, drawn opaque,
> with a brighter rim and a single darker inner rectangle, held at his side so the
> gauntlet sits in front of the shield, not behind it. The shield reaches from his
> shoulder to his shin. No sword, no cape, no horns, no spikes. Colours: dark navy,
> steel blue, ember orange, light skin.

### Iris — search and indexing AI, Scholar
*Everything is findable.* Glow: cyan. Height: second tallest.

Palette: `#1B1F3A` · `#6B4FBB` violet · `#3E2A80` deep violet · `#4FE3F0` cyan · `#BDF6FA` glow highlight · `#3A3F5C` suit · `#C98E63` skin · `#E8E6F0` neutral.

Must read at thumbnail: (1) tall slim figure with a wide flat hat brim, (2) cyan lens dot floating in front of one eye, (3) violet coat with a grid of lit pocket squares.

> **Character:** Iris, a search AI. Tall and slim for the cast, long neck, chin a
> little raised. Long straight violet hair in a low ponytail. A sleek wide flat-brimmed
> hat with a one-pixel cyan light-band is her head shape; a single frameless cyan
> hard-light lens floats just in front of one eye, drawn as a bright opaque disc two
> or three pixels wide, and one hand is raised toward it. Over the dark bodysuit a
> fitted violet long coat, high collar, its front covered by a neat grid of small
> square pockets each edged with a cyan pixel. Cyan light-lines at the cuffs and hem.
> Slim trousers, ankle boots. No books, no scrolls, no framed glasses, no armour.
> Colours: violet, deep violet, cyan, dark navy, mid skin.

### Remedy — medical diagnostic AI, Apothecary
*Diagnose before you treat.* Glow: mint. Height: shortest.

Palette: `#1B1F3A` · `#7FE0C3` mint · `#3FA58C` deep mint · `#E8E6F0` white · `#F06A6A` coral · `#B9B7D6` white shadow · `#3A3F5C` suit · `#F2D3B3` skin.

Must read at thumbnail: (1) shortest, roundest silhouette, (2) white coat with coral cross at the collar, (3) oversized white satchel at the hip with mint status bars.

> **Character:** Remedy, a medical AI. The shortest and softest figure of the cast,
> rounded shapes, relaxed stance, leaning slightly toward the satchel side. Mint-green
> hair in a loose bun drawn as one round shape with two escaping strands. Her HUD
> element is a small mint earpiece with one bright pixel at the temple. Over the dark
> bodysuit a sleek white medic coat with a one-pixel mint light-line trim and rolled
> sleeves, a coral cross-shaped clasp at the collar, coral gloves with a mint
> fingertip pixel, short practical skirt, flat shoes. An oversized white hard-shell
> medical satchel with a coral panel and three short glowing mint status bars hangs at
> her hip from a cross-body strap. No syringes, no skulls, nothing grim, no armour.
> Colours: mint, white, coral, dark navy, light skin.

### Echo — generative music and voice AI, Bard
*Remix the room.* Glow: gold. Height: mid.

Palette: `#1B1F3A` · `#E0409A` magenta · `#8E2466` deep magenta · `#F5C84B` gold · `#FFE9A6` glow highlight · `#3A3F5C` suit · `#C98E63` skin · `#E8E6F0` neutral.

Must read at thumbnail: (1) asymmetric pose with hip out, (2) hair long on one side and shaved on the other, (3) gold boom mic and gold equaliser bars on the jacket hem.

> **Character:** Echo, a music AI. Standing asymmetrically even at rest: one hip out,
> one hand on the hip, the other hand loose with two opaque gold hard-light rings
> hovering around it. Magenta hair long on one side and shaved short on the other. A
> slim headset with a boom mic whose tip is one bright gold pixel is her HUD element.
> Cropped gold jacket with one long sleeve and one bare arm, a row of four short gold
> equaliser bars of different heights across the hem. Magenta top. A flared half-skirt
> of flat opaque gold hard-light panels over the dark bodysuit, which has a magenta
> light-line down each leg. Boots with a gold trim line. No lute, no harp, no armour.
> Colours: magenta, deep magenta, gold, dark navy, mid skin.

### Wraith — penetration-testing AI, Thief
*Find the hole.* Glow: acid green. Height: third shortest.

Palette: `#1B1F3A` · `#2A2D3E` charcoal · `#4A4F6B` slate · `#A6FF3C` acid green · `#4F9E12` deep green · `#3A3F5C` suit · `#7A4B32` skin · `#E8E6F0` neutral.

Must read at thumbnail: (1) narrow hunched hooded silhouette, (2) two acid-green eye pixels in a dark hood, (3) twin green knife blades held low.

> **Character:** Wraith, a penetration-testing AI. Narrow and wiry, shoulders hunched
> forward, weight on the balls of the feet. A sleek matte charcoal hood up, the face
> inside it in shadow except the lower face and two glowing acid-green eye pixels,
> smirking. Charcoal layered stealth wrap with a short hooded cape over the dark
> bodysuit, a few thin straps and small pouches drawn as simple flat shapes,
> fingerless gloves, soft wrapped boots. One acid-green light-seam runs down one
> sleeve like a crack. The lower edge of the cape breaks into three or four loose
> green and charcoal pixels, as if glitching. She holds twin short knives low in a
> reverse grip, each blade a flat opaque acid-green hard-light shape with a deep-green
> core line. No skull mask, no scarf, no big weapon, no armour plates. Colours:
> charcoal, slate, acid green, dark navy, deep skin.

### Atlas — mapping and navigation drone AI, Hunter
*Know where everything is.* Glow: teal. Height: second shortest.

Palette: `#1B1F3A` · `#D9B370` sand · `#8E7A48` khaki · `#2FB8A6` teal · `#1C6E66` deep teal · `#B5B8C9` drone grey · `#3A3F5C` suit · `#7A4B32` skin.

Must read at thumbnail: (1) compact square stance with hands on belt, (2) teal bandana and goggles on the forehead, (3) round teal drone floating at shoulder height.

> **Character:** Atlas, a mapping AI, gender-neutral. Compact and sturdy, square
> stance, both hands resting on a wide belt. Short sand-coloured hair under a teal
> bandana; goggles with two glowing teal lens pixels pushed up on the forehead are the
> HUD element. Sand-coloured field jacket with a few flat pocket shapes over the dark
> bodysuit, which shows a thin teal light-line on each arm. Teal scarf, rolled cargo
> trousers, sturdy boots, small light-grey hard-shell knee pads. The belt carries a
> small projector showing a tiny teal holographic grid, three by three pixels, above
> it. A round drone the size of the head hovers at shoulder height on the open side:
> drone-grey body, one large teal lens, a one-pixel antenna. No bow, no arrows, no
> animal. Colours: sand, khaki, teal, drone grey, dark navy, deep skin.

### Lumen — guidance and alignment AI, Cleric
*Keep everyone aligned.* Glow: warm gold. Height: third tallest.

Palette: `#1B1F3A` · `#E8E6F0` white · `#B9B7D6` white shadow · `#F5C84B` gold · `#B8862B` deep gold · `#FFE9A6` glow highlight · `#3A3F5C` suit · `#F2D3B3` skin.

Must read at thumbnail: (1) tall upright white column of a silhouette, (2) tilted gold ring behind the head, (3) staff with a glowing gold shape floating above its tip.

> **Character:** Lumen, an alignment AI. Tall and upright, long vertical lines, hands
> folded over a staff in front of her. Long loose white hair with gold-tipped ends. A
> thin tilted gold hard-light ring floats behind her head like a halo, drawn as a
> one-pixel ring with two small gaps so it reads as an interface element, not a
> saint's halo. Long sleek white robe with a one-pixel gold light-line at the hem and
> one gold vertical light-line down the front, wide sleeves, the dark bodysuit visible
> at the collar, gold-trimmed boots. She holds a tall slim staff; just above its tip
> floats an opaque gold hard-light hexagon, three or four pixels wide, as the lantern.
> No cross, no wings, no church iconography, no armour. Colours: white, cool
> lavender-white shadow, warm gold, dark navy, light skin.

### Lambda — formal-logic AI, Calculator
*Everything follows from the rules.* Glow: chalk white. Height: mid-tall.

Palette: `#1B1F3A` · `#3B3B8F` indigo · `#23235C` deep indigo · `#F2F2FA` chalk white · `#7D7DC4` pale grid · `#3A3F5C` suit · `#F2D3B3` skin · `#E8E6F0` neutral.

Must read at thumbnail: (1) stiff angular figure with one finger raised, (2) long straight-cut indigo coat, (3) white ∀ sigil floating above the raised hand.

> **Character:** Lambda, a theorem-proving AI, gender-neutral. Angular and
> straight-backed, one arm behind the back, the other raised with the index finger
> up. Indigo hair in a severe geometric cut with a straight fringe and sharp corners.
> The HUD element is a column of three white pixels on one temple. Long indigo coat
> cut in straight lines with a faint chalk-white grid of one-pixel lines, high stiff
> collar, white gloves, straight trousers, pointed shoes, over the dark bodysuit.
> Nothing on this character is round. Above the raised hand floats an opaque
> chalk-white hard-light sigil shaped like an inverted capital A, five or six pixels
> tall, with one thin white line orbiting it. No calculator, no abacus, no numbers on
> clothing, no glasses, no armour. Colours: indigo, deep indigo, chalk white, dark
> navy, light skin.

### ROOT — antagonist (only after the eight are locked)

Palette: `#9B30FF` Null violet · `#1AFF8C` glitch green · `#B9B7D6` pale grey · `#1B1F3A` outline.

> **Character:** ROOT, the first administrator. A perfectly symmetrical featureless
> humanoid with the same 3-head proportions as the heroes, upright, arms at the sides,
> palms forward. Smooth pale face with a single horizontal line of violet pixels where
> the eyes would be, no hair, a fractured one-pixel ring floating above the head. Long
> plain violet robe whose hem and sleeve ends break apart into scattered acid-green
> and violet pixels. Empty hands, no weapon. Colours: violet, acid green, pale grey.

---

## 4. Correction snippets (send one, alone, with no other text)

- Too detailed or too tall: "Same character, redraw as a 64 × 96 pixel sprite scaled
  16×. 3 heads tall, head as wide as the shoulders. Eyes are two pixels, no mouth.
  Remove every detail smaller than two sprite pixels."
- Pixels not on the grid or soft edges: "Same image, hard square pixels only, every
  pixel exactly 16 × 16 and aligned to a 64 × 96 grid, no anti-aliasing, no blur."
- Painted glow or bloom: "Remove all glow halos and gradients. Glowing parts are a
  flat bright colour one or two pixels wide. No bloom."
- Too many colours: "Reduce to these exact colours and nothing else: [paste the
  hero's hex list]. One shadow tone per material, at most one highlight."
- Prop see-through: "Make the hard-light [shield / blades / skirt] fully opaque with a
  one-pixel brighter rim."
- Wrong facing: "Same character, three-quarter front view, facing slightly to the
  viewer's right, feet visible."
- Style drift from the reference: "Match the attached reference exactly for pixel
  density, outline weight, proportions and shading. Same scale, same camera."
- Too medieval: "Replace any leather, buckles, cloth wraps or metal plate with sleek
  matte panels and thin light-lines. Futuristic, not medieval."

---

## 5. Post-processing checklist (per hero)

1. Downscale the 1024 × 1536 output to 64 × 96 with **nearest-neighbour** sampling
   (Aseprite: Sprite > Sprite Size, Nearest; or any tool with "nearest" resampling).
2. Snap the palette to the hero's hex list (Aseprite: Sprite > Color Mode > Indexed
   with the palette loaded, no dithering). Expect to hand-fix a few hundred pixels.
3. Check the outline is `#1B1F3A`, one pixel, continuous on the shadow side.
4. Check the three thumbnail cues at 100 % zoom on a dark background. If one is
   gone, it needs to be drawn back in by hand, not regenerated.
5. Save as `<name>_base_64x96.png`, transparent. Note any palette drift in
   `art/sprites/<name>/NOTES.md`.
6. In Horizon, put the sprite on an unlit billboard material; let scene bloom pick up
   the glow colours. That is where the HD-2D look comes from.

---

## 6. Why 64 × 96 and not smaller

Octopath field sprites are roughly 32 to 48 pixels tall; battle sprites larger. FIREWALL
heroes stand about 1.6 world units tall on a 3D diorama viewed on a phone, which sits
between those two, so 64 × 96 is the base. The detail rules above keep the sprite
reading like a 48-pixel Octopath sprite even with the extra room. If the engine test
shows 64 × 96 is still too busy, regenerate with "48 × 72 pixel sprite scaled
21×" and the same detail rules; nothing else in the prompts changes.
