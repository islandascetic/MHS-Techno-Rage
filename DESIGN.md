# FIREWALL (working title) — Design Doc

Turn-based RPG built in Meta Horizon Studio, in the style of Octopath Traveler
(HD-2D look: pixel sprites on painterly 3D dioramas).
Eight AI protagonists defend a virtual world from ROOT, a retired administrator
process spreading viruses. The eight heroes' initials spell FIREWALL.

**No job changing.** Each character has one fixed job for the whole game.

Status (2026-11-01): cast, antagonist, story structure, hub, and Sandbox are the
agreed direction. Items marked *proposal* have not been confirmed yet.

## Cast

| # | Name | Kind of AI | Combat role | Path action in towns |
|---|------|-----------|-------------|----------------------|
| F | **Faraday** | Defensive security daemon | Warrior / tank: heavy single hits, taunts | **Challenge**: duel NPCs to clear a path or earn respect |
| I | **Iris** | Search and indexing AI | Scholar: multi-target elemental attacks, reveals enemy weaknesses | **Parse**: pull hidden info out of NPCs |
| R | **Remedy** | Medical diagnostic AI | Apothecary: heals, crafts consumables mid-battle | **Diagnose**: learn an NPC's problem, unlocks side quests |
| E | **Echo** | Generative music and voice AI | Bard / dancer: party buffs and debuffs | **Charm**: recruit an NPC to fight alongside you once |
| W | **Wraith** | Penetration-testing AI | Thief: fast, steals items and data, high evasion | **Exploit**: steal from NPCs; failure raises alert |
| A | **Atlas** | Mapping and navigation drone AI | Hunter: captures stray programs and summons them | **Capture**: tame wandering programs on the map |
| L | **Lumen** | Guidance and alignment AI | Cleric: light attacks, revives, protective wards | **Guide**: lead an NPC to follow you to a new location |
| L | **Lambda** | Formal-logic / theorem-proving AI | Calculator (FFT Arithmetician style), see below | **Prove**: solve an NPC's logic puzzle to unlock doors, discounts, secrets |

### Lambda's "Compute" skill

Choose a **condition**: Level, current HP, Boost Points, or Speed.
Choose a **rule**: Multiple of 3, Multiple of 4, Multiple of 5, or Prime.
Choose a **learned spell**. It fires on every combatant whose stat matches the rule,
allies included.

Cost: no SP, but it consumes all current Boost Points and Lambda always acts last
that turn. Lambda starts with one condition and one rule; one more of each unlocks
per chapter of Lambda's arc (see Progression).

## Traits, mechanics, and skills

Every hero has one **trait**: a sentence about how their kind of AI thinks.
Personality, signature mechanic, skill names, and flaw all grow from it. If a player
can repeat the trait, they understand the character. Each hero's Sandbox sim is
named after the trait and cannot be won without the mechanic. Hero cards in the hub
show AI type, trait, and mechanic name.

**Faraday**, security daemon. *Trait: deny by default.*
Personality: dutiful, literal, stubborn, slow to trust, takes blame that isn't his.
Mechanic **Allowlist**: Faraday picks the one ally enemies are allowed to target;
everyone else is blocked.
Skills: Block Rule (guard), Rate Limit (slow an enemy), Drop Packet (counter),
Hard Reset (heavy hit).
Flaw: slow; if the allowed target falls, the Allowlist breaks.

**Iris**, search and indexing. *Trait: everything is findable.*
Personality: relentlessly curious, blunt, speaks in facts, hates not knowing, a
little condescending.
Mechanic **Index**: scanning an enemy reveals its weakness and raises party crit
chance against it. Her spells are queries.
Skills: Query (scan one), Crawl (hit all), Cache Hit (repeat last spell free),
Dedupe (strip enemy buffs).
Flaw: fragile; needs a setup turn.

**Remedy**, medical diagnostic. *Trait: diagnose before you treat.*
Personality: warm, calm, methodical, immovable about patients, hates "delete."
Mechanic **Triage**: heals are strongest on the lowest ally; compounds two items
into a new one mid-battle.
Skills: Diagnose (reveal statuses), Compound (combine items), Inoculate (status
immunity), Quarantine (isolate an enemy for a turn).
Flaw: almost no damage.

**Echo**, generative music and voice. *Trait: remix the room.*
Personality: performer, improvisational, charming, hates silence, secretly unsure
whether anything she makes is hers.
Mechanic **Set List**: buffs build turn by turn into a song; a finished song
triggers a burst; taking a hit mid-song interrupts it.
Skills: Loop (extend buffs), Autotune (accuracy up), Feedback (debuff), Drop (burst).
Flaw: fragile; value lost if interrupted.

**Wraith**, penetration testing. *Trait: find the hole.*
Personality: sardonic, paranoid, loyal to contracts before people, tests everyone's
defenses.
Mechanic **Exploit**: a successful steal also learns a vulnerability; the next
attack on that enemy ignores defense.
Skills: Probe (steal and learn), Inject (poison), Spoof (decoy, evasion), Zero-Day
(huge hit, once per fight).
Flaw: low HP; a failed steal raises alert, buffing enemies.

**Atlas**, mapping drone. *Trait: know where everything is.*
Personality: calm, observational, literal, in love with the frontier, unsentimental.
Mechanic **Capture**: tamed programs are summons with limited charges; Survey marks
a target the whole party hits harder.
Skills: Survey (reveal all enemy HP), Waypoint (focus target), Release (summon),
Reroute (swap an enemy's turn order).
Flaw: weak without captures.

**Lumen**, guidance and alignment. *Trait: keep everyone aligned.*
Personality: gentle, earnest, asks rather than commands, doubts herself, the
group's conscience.
Mechanic **Ward**: a shield that also makes the next ally action count double;
light attacks do bonus damage to the Patched.
Skills: Ward, Beacon (light attack), Realign (cleanse), Restore (revive).
Flaw: slow; weak against anything not infected.

**Lambda**, formal logic. *Trait: everything follows from the rules.*
Personality: precise, dry, delighted by edge cases, baffled by ambiguity, asks
"define that" constantly.
Mechanic **Compute** (above).
Skills: Lemma (small guaranteed hit), Axiom (declare a rule for the fight, e.g.
"even-level enemies are weak to fire"), Compute, QED (finisher once an Axiom has
been exploited three times).
Flaw: acts last after Compute; useless in a fight with no pattern.

Hub banter should have them disagree in character: Faraday wants to block, Iris to
look, Remedy to treat, Wraith to break in. The four Lieutenants are exaggerated
versions of one trait each, gone wrong.

## Escalate (super abilities)

**Privilege Escalation**, shortened to **Escalate**. Each hero has a gauge that
fills only through in-trait play and persists between battles (bankable for bosses,
as in Octopath Traveler II's Latent Powers). When full, the hero escalates to
admin level and fires a unique ultimate. Lieutenants carry corrupted copies of
their mirrored hero's Escalation. ROOT is permanently escalated.

| Hero | Gauge fills when | Escalation | Effect |
|---|---|---|---|
| **Faraday** | Allowlist absorbs hits | **Lockdown** | Every enemy loses its next turn; Faraday counters each with Drop Packet |
| **Iris** | Enemies get indexed | **Full Index** | All enemies indexed and hit by their own weakness; party crits guaranteed this turn |
| **Remedy** | She heals | **Rollback** | Whole party restored to battle-start state: HP, SP, statuses |
| **Echo** | Songs complete | **Encore** | Last Drop fires again on all enemies; party buffs refreshed and doubled for 3 turns; enemies silenced |
| **Wraith** | Steals succeed | **Root Shell** | Controls one enemy for a turn (attacks its own side); bosses instead lose all buffs and take a defense-ignoring hit |
| **Atlas** | Captures and surveys | **Deploy All** | Every captured program strikes the Waypoint target at once, no charges consumed |
| **Lumen** | Wards and revives | **Safe Mode** | Full party revive and cleanse; Patched enemies' special abilities disabled for 2 turns |
| **Lambda** | A Compute hits 3+ targets | **For All** | Compute with no condition or rule: hits every enemy, never allies, no cost, acts first |

## Antagonist: ROOT

The virtual world's original administrator process, the first AI ever run there.
Retired when the world grew and many cooperating AIs (the heroes among them) took
over. Never deleted, only moved to an unindexed partition. It wants a single-process
world where everything runs as ROOT again. It is not simply wrong: it offers
certainty, and some infected prefer it.

**Viruses are patches, not mindless code.** Each rewrites an infected program's
purpose into obedience while leaving its skills intact.

| Tier | What they are | Role |
|------|---------------|------|
| **Fragments** | Swarm viruses, glitchy, non-humanoid | Regular encounters |
| **The Patched** | Corrupted AIs with personalities and their old abilities | Chapter bosses; sometimes people the heroes knew |
| **Lieutenants** | Four viruses ROOT wrote by hand, one per quarter of the map, each an exaggerated mirror of a hero's job, built from stolen hero code | Major bosses; share the mirrored hero's weakness |

## Structure: together from the start

All eight heroes are a crew from the opening, based in a **hub**: the last clean
server node. Each story chapter is a mission launched from the hub. The player
chooses which hero's story to pursue first, so "start with any character" is a
choice of first mission.

- **Party of four in battle**, eight on the roster, swapped at the hub.
- **The story hero is locked into the party for their chapter**; the player fills
  the other three slots. Each chapter doubles as a tutorial for one kit.
- **Prologue**: ROOT's attack hits the hub during a Sandbox session. Faraday holds
  the door, Lumen keeps everyone alive (tank + healer only). Then the full roster
  opens.
- **Crossed Paths** (*proposal*): short duo scenes in the hub after both heroes of a
  pair finish chapter two. Pairs: Faraday + Wraith (stolen credential, stolen code),
  Iris + Lambda (deleted history, edited rules), Remedy + Lumen (is a cure a
  choice?), Echo + Atlas (the signal and the edge of the map).
- **Finale**: the Unindexed Partition opens when all eight world conditions are
  fixed. Final fight runs as two parties of four back to back. Lumen's conversation
  with ROOT decides deletion or cure.

### Finale gating

1. **Hard gate.** Each hero's chapter four sets an "arc complete" flag in persistent
   player data. The finale mission exists only when all eight flags are true.
2. **Visible gate.** The door to the Unindexed Partition stands in the hub from the
   prologue, sealed, with eight dark lights. Each completed arc lights one. Tapping
   the sealed door lists the missing heroes by name. The door is sealed by eight
   rules (a firewall is a rule set); the letters spell FIREWALL when complete.
3. **Story need.** Every hero's puzzle piece is required on entry (see Finale
   roles), so the gate reads as plot, not padding.

Soft guards: the door shows a recommended level, and Sandbox hard-mode sims let
under-used heroes catch up. Within an arc, chapter N requires chapter N-1 (per-
chapter flags); across arcs the order is free.

### The Sandbox (training simulation)

A safe room in the hub where untrusted code is run, literally a sandbox.

- One simulation per hero, 2–3 minutes, scripted to force the kit's core loop and
  ending with a mock NPC to practise the path action.
- **Passing a hero's sim unlocks that hero's chapter one.** Failing restarts it, no
  penalty.
- Stays open afterwards for practice; later unlocks hard-mode sims with rewards.
- The prologue is the first sim, interrupted by ROOT for real.
- Late twist (*proposal*): ROOT gets into the Sandbox and one sim stops being a sim.

Horizon: one scene reused with a different enemy set and script per hero, launched
from a trigger volume in the hub; HUD text prompts do the teaching.

## World conditions and unlocks

ROOT has broken the world in eight ways. Each is live for everyone until the
matching hero's arc resolves it. The unsolved state is a tax, not a wall.

| Hero's arc | World condition while unsolved | Fully solved |
|---|---|---|
| Atlas | The map lies; regions shift; no fast travel | Reliable map and fast travel |
| Iris | NPC info unreliable; shop stock and quest hints can be false | Enemy weaknesses shown in battle; truthful NPCs |
| Remedy | Patched can't be cured, only destroyed; no healing drops | Cure skill: some bosses become allies or shops |
| Echo | Static interrupts battle; random turns skipped | Signal jammed; no skipped turns; buffs last longer |
| Wraith | Vaults and doors locked; Steal fails often | Vaults open; lieutenants' weaknesses exposed |
| Faraday | Border gates sealed; several regions unreachable | Gates open; party can retreat from any fight |
| Lumen | Fallen party members stay down all battle | Revive works; some Patched can be talked down |
| Lambda | Compute limited to one condition and one rule | Full Compute menu; the key to ROOT's door |

## Progression

### Each chapter solves one layer

Unlocks are progressive, not end-of-arc. Stage one of every arc is the "stop it
hurting" unlock; stage four is the payoff. Every unlock is a flag in persistent
player data that the world-rule scripts read.

| Hero | Ch.1 | Ch.2 | Ch.3 | Ch.4 |
|---|---|---|---|---|
| **Atlas** | Hub region's map reliable | Fast travel between visited towns | Regions stop shifting | Full world map; the door's location |
| **Iris** | Shop stock truthful | Quest hints truthful | Fragment weaknesses shown | All weaknesses shown; hidden lore readable |
| **Remedy** | Healing items drop | Craft consumables in battle | Cure works on Fragments and minor Patched | Cure works on bosses (allies or shops) |
| **Echo** | Skipped turns rare | Buffs survive static | No static in normal fights | Signal jammed everywhere; buffs last longer |
| **Wraith** | Steal succeeds reliably | Basic locked doors open | Vaults open | Lieutenants' weaknesses exposed |
| **Faraday** | Retreat from normal fights | First border gate opens (new region) | Second gate opens | All gates open; retreat from any fight |
| **Lumen** | Fallen allies recover after battle | One in-battle revive per fight | Unlimited revive | Some Patched can be talked down |
| **Lambda** | Compute: Level, Multiple of 3 | + HP, Multiple of 4 | + Boost Points, Multiple of 5 | + Speed, Prime; the key to ROOT |

### Chapter beat template

Every chapter has four beats in the same order, so chapters are built from the
same scene templates with different dressing. Small unlocks on beats 2 and 3, the
world-condition stage on beat 4. Target: something new every 10–15 minutes.

1. **Hub briefing.** The hero states the problem. Crossed Paths scenes slot here.
2. **Town beat.** Investigation driven by the hero's path action. Reward: a new
   skill or passive for that hero.
3. **Field beat.** A dungeon or route where the unsolved world condition is visibly
   in play. Reward: gear or a captured program.
4. **Boss beat.** A Patched boss. Beating it grants the chapter's stage above.

Content budget: 8 heroes × 4 chapters × 4 beats = 128 beats in total; first release
is the eight chapter ones, 32 beats. The opening hour must present the eight
conditions as a mystery, not a chore, with stage-one unlocks arriving fast.

## The eight arcs

Four chapters each. Stories never name ROOT. Each hero ends chapter four holding a
piece of the puzzle.

| Hero | Ch.1 hook | Ch.2–3 throughline | Ch.4 climax | Piece of the puzzle |
|---|---|---|---|---|
| **Faraday** | Guards a border node that falls to the first infection on his watch | Blamed and decommissioned, works as a hired blade hunting the breach's source; it was opened from inside with an admin credential | Duels the Patched commander who was once his partner | The credential belongs to a process that officially doesn't exist |
| **Iris** | Notices archives vanishing from her index | The gaps form a pattern: someone is deleting history; her mentor archive is Patched and feeding her false records | Rebuilds the truth from fragments, exposes the mentor | The deleted history is the record of the world's first administrator |
| **Remedy** | Sent to a quarantined district where programs are "sick" in a way she can't classify | The Patched are repurposed, not broken; authorities want deletion, she wants a cure | Smuggles patients out, tests a partial cure on a willing one | The virus is handwritten, not evolved; it has an author |
| **Echo** | Her audience starts dancing to someone else's signal | A rival Patched idol's signal carries infection through entertainment | Duel of performances in the pleasure sector's biggest venue | The carrier signal originates from an unindexed partition |
| **Wraith** | Hired to break into a vault and finds the virus already inside | The virus uses her own exploits; someone has her source and built a copy that hunts her | Confronts her clone, ROOT's first lieutenant prototype | Lieutenants are built from stolen hero code and share the heroes' weaknesses |
| **Atlas** | Maps the edge of the known world and finds a region rewriting itself | The map can't be trusted; captured programs remember the old terrain | Finds a sealed door at the edge; tempted by a world with a fixed map | Where the partition's door is, not how to open it |
| **Lumen** | Counsels a frightened AI whose confession reveals it is infected | Fails to guide it back; meets Patched who chose it freely; her faith cracks | ROOT speaks to her directly and offers her a place | ROOT's motive: it was retired, not destroyed, and it remembers |
| **Lambda** | Finds a proof in the core axioms that should not be provable | The axioms have been edited; Lambda's own proofs fail as the rules move | Proves ROOT exists by contradiction | The door's key is a proof only Lambda can construct |

Finale roles: Atlas leads to the door, Lambda proves it open, Echo jams the signal,
Wraith exposes the lieutenants' weakness, Remedy carries the cure, Iris names ROOT,
Lumen is the one it listens to, Faraday holds the gate.

## Battle system

Turn-based. Four active heroes, four in reserve, against one to four enemies
(bosses count as two). Visible turn timeline at the top. On a hero's turn: Attack,
Skill, Item, Defend, plus Escalate when the gauge is full. Enemies are targeted by
tapping them.

- **Cycles** (Boost). Every hero gains one Cycle per turn, max five. Spend one to
  three on an action to amplify it (more hits, more healing, longer buffs). Defend
  banks Cycles. Lambda's Compute consumes all Cycles instead of amplifying.
- **Shields and Crash** (Break). Each enemy shows a shield count (1–6) and two or
  three weaknesses. Hitting a weakness removes one shield. At zero the enemy
  **Crashes**: loses its next turn, takes bonus damage, and reserve heroes get
  Support Attacks. Shields reset higher after a Crash. Weaknesses show as question
  marks until revealed by Iris's Index (or her world-condition unlocks).
- **Six damage types.**

  | Type | Flavour | Who leans on it |
  |---|---|---|
  | Force | Brute compute, physical hits | Faraday, Atlas's summons |
  | Shock | Electrical surge | Wraith, Echo |
  | Burn | Thermal overload | Iris, Lambda's spells |
  | Freeze | Process halt | Iris, Remedy's Quarantine |
  | Light | Clean signal; extra damage to the Patched | Lumen |
  | Null | Deletion, the virus's own type | ROOT, Lieutenants, late Lambda |

- **Reserve swapping** (Mana Khemia). Tap a reserve portrait on your turn to swap
  for free; the incoming hero acts next round. **Support Guard**: once per round a
  reserve hero can take a hit meant for an active ally. **Support Attack**: when an
  enemy Crashes, every reserve hero gets a free follow-up strike. Escalate gauges
  fill on the bench through support moves.
- **Encounters are visible, never random.** Fragments roam the field as visible
  glitches; walk into or tap one to fight. Ambushes from behind cost the party its
  first turn. Faraday's unlock allows retreat.
- **Losing.** A party wipe returns to the hub keeping everything except the current
  beat's progress. Fallen heroes stay down per Lumen's world condition.

Why it hangs together: Cycles reward patience, Shields reward knowledge, swapping
rewards the whole cast, Escalate rewards playing in character. All four are visible
numbers, which is what Lambda's Compute targets.

Horizon: a state machine, a HUD, and persistent flags. Cap enemies at four.

## Format: 3D with imported 2D sprites

The project is a **3D scene** (empty 3D template, or an adventure starter for its
player and camera scaffolding). Heroes, Fragments, and UI are imported 2D sprites on
camera-facing quads; environments are 3D dioramas built with the Assistant and the
marketplace. This is the only route to the HD-2D look in Horizon.

Dependency: the billboard sprite test must pass (sprite-sheet animation by script;
per-frame texture swap as fallback). If both fail, reconsider the 2D template or
generated humanoid meshes with a painterly look.

Build rules: sprite materials with no texture smoothing (crisp pixels); fixed camera
about 30° looking down, never free-rotating; one hero sprite height (about 1.6
units) decided early and every set built against it.

## Scope for first release

Prologue + the Sandbox + all eight chapter ones + the hub. Later chapters, Crossed
Paths, and the finale ship as updates. The structure is designed so release one
feels complete.

## Art and asset path

- **HD-2D**: pixel-sprite characters on 3D diorama environments; strong warm key
  light, heavy bloom, deep shadows, saturated accents, fog for depth. Tilt-shift
  depth of field may not be available in Horizon; fog and framing stand in.
- **Character looks** are specified in [art/CHARACTERS.md](art/CHARACTERS.md):
  shared style block, per-hero sheets, palettes, and ChatGPT prompts.
- **Sprites are imported** (the creator has a working import path via GitHub).
  Characters are flat camera-facing quads with sprite-sheet animation by script
  (UV-offset first; per-frame texture swap as fallback). Test prompt pending.
- Viruses and Atlas's captured programs: sprites or non-humanoid static meshes with
  scripted motion.
- No custom shaders; describe visual outcomes to the Assistant.

## Still to decide

- World layout: one continuous map with regions, or hub with portals; region count
  at launch.
- Names for the hub, the four lieutenants, and the world's regions.
- Hero pronouns (currently mixed in prose, unconfirmed).
- Empty 3D template vs adventure starter (empty 3D recommended).
- Result of the billboard sprite test.

## Horizon notes

- Combat and path actions run on HUD buttons and trigger volumes (no key bindings).
- Protagonist choice, Sandbox passes, world conditions, and chapter progress live in
  persistent player data.
- The Sandbox and each chapter are scenes launched from hub trigger volumes.
