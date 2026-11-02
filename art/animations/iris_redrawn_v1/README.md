# Iris redrawn idle test

The user explicitly rejected cutout/puppet animation and requested redrawn poses with stable registration.

The built-in image tool generated 16 redrawn Iris poses as a 4×4 transparent sprite sheet. Prompt: maintain the approved violet/cyan techno design, proportions and perspective; draw a restrained breathing cycle, delayed ponytail/coat motion, one blink, planted boots, and closely matched first/last poses. No rigid-part animation or deformation is applied to the character.

`assemble.ps1` extracts the poses, translates whole frames by at most one output pixel to register the boots, and holds the stationary boot drawing constant across frames. Holding a stationary region avoids incidental generated pixel changes; the moving upper body is supplied by the redrawn poses. Preview timing shortens the blink and gives the breathing poses longer exposure. `frames/alignment.csv` records offsets before the stationary boot hold.

This remains an AI-generated frame-animation test, not a claim of hand-pixeled production animation. Small changes in contours and highlights may still need manual cleanup. The original generated sheet is retained for comparison.
