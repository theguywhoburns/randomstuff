# Item System - Full Spec

## Overview

Custom items are defined in a registry. Items have an id, a vanilla item_id for rendering/interaction, and a display_id for UI. Knapping and other systems reference items by their custom id.

## Item Registry

**Storage path:** `randomstuff:items.<id>`

```json
{
  "granite_rock": {
    "item_id": "granite",
    "display_id": "randomstuff:granite_rock"
  },
  "raw_flint": {
    "item_id": "flint",
    "display_id": "randomstuff:raw_flint"
  },
  "raw_clay": {
    "item_id": "clay_ball",
    "display_id": "randomstuff:raw_clay"
  }
}
```

- `id` - custom identifier used for all lookups
- `item_id` - vanilla Minecraft item ID (what the player actually holds)
- `display_id` - custom item ID for rendering/UI (can equal id)

## Item Definition

```json
{
  "id": "granite_rock",
  "item_id": "granite",
  "display_id": "randomstuff:granite_rock"
}
```

## Registration

**Register function:** `items/register.mcfunction`

```mcfunction
# Register granite_rock
function randomstuff:items/register {
  "id": "granite_rock",
  "item_id": "granite",
  "display_id": "randomstuff:granite_rock"
}

# Register raw_flint
function randomstuff:items/register {
  "id": "raw_flint",
  "item_id": "flint",
  "display_id": "randomstuff:raw_flint"
}
```

**How register works:**
1. Takes id, item_id, display_id from input
2. Stores in `randomstuff:items.<id>` with those fields

## Runtime Item Instance

When player holds an item:
```json
{
  "id": "minecraft:granite",
  "components": {
    "custom_data": {
      "id": "granite_rock"
    }
  }
}
```

The `custom_data.id` points to the registry entry.

## Tag System

Tags are stored as scoreboard objectives:
- `randomstuff:tags.knappable_rocks` - rocks that can be knapped
- `randomstuff:tags.knappable_clay` - clay items that can be knapped
- `randomstuff:tags.<material>` - individual material flags

**Tag definition format (scoreboard):**
```
scoreboard players set <item_id> randomstuff:tags.knappable_rocks 1
```

**Checking tags:**
- Does item have score in `tags.knappable_rocks`? → it's knappable
- Get item's `custom_data.id` → use as material key for recipes

## Files Structure

```
data/randomstuff/
  storage/
    items/                    # item registry
    tags                      # tag scoreboards
  function/
    items/
      register.mcfunction     # registration function
      lookup.mcfunction       # given id, returns item data
      get_from_hand.mcfunction # get item data from player hand
    load.mcfunction           # calls register for all items
```

## Notes

- Items and knapping are separate systems
- Item registry provides item_id → vanilla mapping
- Tags determine what an item CAN do (knappable, pourable, etc.)
- Recipes reference items by their custom id
