# Knapping System - Full Spec

## Overview

Two identical knappable items held in one hand (stacked) are used to shape items by knapping off pieces on a hard surface. Right-click initiates knapping session, placing a 5x5 grid of micro-cubes. Player mines cubes to "knap off" material. Right-click the check entity to verify pattern.

## Entity Structure

Each knap grid = 52 entities:
- `block_display` × 25 (visible cubes)
- `interaction` (cell) × 25 (mining hitboxes)
- `interaction` (check) × 1 (right-click to verify)
- `block_display` (hover indicator) × 1

**Tags:**
- `knap_grid` - all entities in grid
- `knap_cell` - the 25 mining cells
- `knap_check` - the check interaction
- `knap_hover` - hover display
- `knap_pos_X_Y` - cell position (e.g., `knap_pos_2_3`)

**Cell size:** 0.1 blocks (5x5 grid = 0.5x0.5 total area)

## Recipe Definitions

**Raw recipe format (in `recipes.knapping.raw`):**
```json
[
  {
    "input_material": "#randomstuff:knappable_rocks",
    "pattern": [
      [0,0,1,0,0],
      [0,1,1,1,0],
      [1,1,1,1,1],
      [0,1,1,1,0],
      [0,0,1,0,0]
    ],
    "result": "flint_knife"
  },
  {
    "input_material": "#randomstuff:knappable_rocks",
    "pattern": [
      [1,1,1,1,1],
      [1,0,0,0,1],
      [1,0,0,0,1],
      [1,0,0,0,1],
      [1,1,1,1,1]
    ],
    "result": "flint_axe"
  },
  {
    "input_material": "raw_clay",
    "pattern": [
      [0,0,1,0,0],
      [0,1,1,1,0],
      [1,1,1,1,1],
      [0,1,1,1,0],
      [0,0,1,0,0]
    ],
    "result": "clay_knife"
  }
]
```

**Expanded format (after load, indexed by material):**
```
recipes.knapping.granite = [{ pattern: [...], result: "flint_knife" }, { pattern: [...], result: "flint_axe" }]
recipes.knapping.andesite = [{ pattern: [...], result: "flint_knife" }, { pattern: [...], result: "flint_axe" }]
recipes.knapping.basalt = [{ pattern: [...], result: "flint_knife" }, { pattern: [...], result: "flint_axe" }]
recipes.knapping.chalk = [{ pattern: [...], result: "flint_knife" }, { pattern: [...], result: "flint_axe" }]
recipes.knapping.raw_clay = [{ pattern: [...], result: "clay_knife" }]
```

Pattern: 1 = knocked off (must be empty), 0 = kept (cell must exist)

**Load behavior:**
- Tag-based `input_material` (`#randomstuff:knappable_rocks`) gets expanded to all matching materials
- Direct `input_material` (`raw_clay`) goes to its own bucket
- Recipe result stays same unless explicitly defined per-material

## Input Material Tags

**Storage:** `randomstuff:tags.<tag_name>` as scoreboard objectives

- `randomstuff:tags.knappable_rocks` = 1
- `randomstuff:tags.knappable_clay` = 1
- `randomstuff:tags.granite` = 1
- etc.

Each knappable item has a score in the relevant tag objective.

## Flow

### 1. Initiate Knapping (right-click with 2+ matching items)
```
if mainhand item matches offhand item
  and mainhand item has material_tag (e.g., knappable_rocks)
  and count >= 2
then:
  get material (e.g., "granite")
  consume 2 items
  spawn knap grid at look hit position
  store grid origin and material in storage
```

### 2. Mine Cells
```
player mines interaction entity with tag knap_cell
if entity has tag knap_pos_X_Y:
  kill cell entity at that position
  kill corresponding block_display
```

### 3. Verify Pattern (right-click knap_check)
```
scan: all remaining entities with tag knap_cell
build: current_pattern[5][5] = 1 where cell missing, 0 where present
get: material from storage
loop: through recipes.knapping.<material>
  if current_pattern == recipe.pattern:
    success:
      clear grid
      spawn recipe.result at player
      return
fail:
  clear grid
  play fail sound
```

## State Storage

```json
{
  "knapping": {
    "player": "uuid",
    "origin": [x, y, z],
    "material": "granite"
  }
}
```

## Files Structure

```
data/randomstuff/
  storage/
    recipes.knapping.raw        # raw recipe definitions
    recipes.knapping.<material> # expanded on load
    tags                        # material tag scores
  function/
    knapping/
      init.mcfunction           # expand recipes on load
      initiate.mcfunction       # spawn grid, consume items
      mine.mcfunction           # cell removal handler
      verify.mcfunction         # pattern check on right-click
      clear.mcfunction          # cleanup grid
      spawn_grid.mcfunction     # spawn 25 cells + check entity
    tick.mcfunction             # handle knap_check right-clicks
```

## Notes

- Pattern is always 5x5
- No partial progress tracking - player mines until satisfied, then checks
- Wrong pattern = items lost, no recovery
- Recipes indexed by material for O(1) lookup per material
- Each knap grid **should** have a unique ID - will need to test before confirming necessity
