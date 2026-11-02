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
that turn. Lambda starts with one condition and one rule; the full menu unlocks when
Lambda's arc is solved (see World conditions).

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
matching hero's arc resolves it; resolving it is a permanent unlock.

| Hero's arc | World condition while unsolved | Unlock when solved |
|---|---|---|
| Atlas | The map lies; regions shift; no fast travel | Reliable map and fast travel |
| Iris | NPC info unreliable; shop stock and quest hints can be false | Enemy weaknesses shown in battle; truthful NPCs |
| Remedy | Patched can't be cured, only destroyed; no healing drops | Cure skill: some bosses become allies or shops |
| Echo | Static interrupts battle; random turns skipped | Signal jammed; no skipped turns; buffs last longer |
| Wraith | Vaults and doors locked; Steal fails often | Vaults open; lieutenants' weaknesses exposed |
| Faraday | Border gates sealed; several regions unreachable | Gates open; party can retreat from any fight |
| Lumen | Fallen party members stay down all battle | Revive works; some Patched can be talked down |
| Lambda | Compute limited to one condition and one rule | Full Compute menu; the key to ROOT's door |

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

## Scope for first release

Prologue + the Sandbox + all eight chapter ones + the hub. Later chapters, Crossed
Paths, and the finale ship as updates. The structure is designed so release one
feels complete.

## Art and asset path

- **HD-2D**: pixel-sprite characters on 3D diorama environments; strong warm key
  light, heavy bloom, deep shadows, saturated accents, fog for depth. Tilt-shift
  depth of field may not be available in Horizon; fog and framing stand in.
- **Sprites are imported** (the creator has a working import path via GitHub).
  Characters are flat camera-facing quads with sprite-sheet animation by script
  (UV-offset first; per-frame texture swap as fallback). Test prompt pending.
- Viruses and Atlas's captured programs: sprites or non-humanoid static meshes with
  scripted motion.
- No custom shaders; describe visual outcomes to the Assistant.

## Still to decide

- World layout: one continuous map with regions, or hub with portals; region count
  at launch.
- Combat rules: Boost/Break equivalents, random vs visible encounters.
- Names for the hub, the four lieutenants, and the world's regions.
- Hero pronouns (currently mixed in prose, unconfirmed).
- Which starter game to remix (adventure is the closest match).

## Horizon notes

- Combat and path actions run on HUD buttons and trigger volumes (no key bindings).
- Protagonist choice, Sandbox passes, world conditions, and chapter progress live in
  persistent player data.
- The Sandbox and each chapter are scenes launched from hub trigger volumes.
