# Item System - Full Spec

## Overview

Custom items are defined in a registry. Items have an id, a custom_id for storage keys, a vanilla item_id for rendering/interaction, and components with fields. Items are given via summoned item entities (not /give command) due to a fundamental limitation.

## Item Registry

**Storage path:** `randomstuff:items.<custom_id>`

```json
{
  "flint_and_flint": {
    "id": "minecraft:flint_and_steel",
    "components": {
      "custom_data": {...},
      "item_name": {...},
      "max_damage": 12,
      "item_model": "randomstuff:flint_and_flint"
    },
    "fields": [{"field":"custom_data"},{"field":"item_name"},{"field":"max_damage"},{"field":"item_model"}]
  }
}
```

## Item Definition

```json
{
  "id": "minecraft:flint_and_steel",
  "custom_id": "flint_and_flint",
  "components": {
    "custom_data": {...},
    "item_name": {...},
    "max_damage": 12,
    "item_model": "..."
  },
  "fields": [{"field":"custom_data"},...]
}
```

## Registration

**Register function:** `items/register.mcfunction`

```mcfunction
function randomstuff:items/register {
    "id":"minecraft:flint_and_steel",
    "custom_id":"flint_and_flint",
    "components":{
        "custom_data":{...},
        "item_name":{...},
        "max_damage":12,
        "item_model":"randomstuff:flint_and_flint"
    },
    "fields": [{"field":"custom_data"},{"field":"item_name"},{"field":"max_damage"},{"field":"item_model"}]
}
```

## /give Command Limitation (UNFIXABLE HACK)

**Problem:** Using `/give @s id[components]` with macro unwrapping produces invalid syntax.

When `$(components)` expands, it includes quoted field names from JSON:
```
give @s minecraft:flint_and_steel["custom_data"={...},"item_name"={...}]
```

But `/give` requires unquoted field names:
```
give @s minecraft:flint_and_steel[custom_data={...},item_name={...}]
```

**Solution:** Items are given via `summon item` instead:
```mcfunction
summon minecraft:item ~ ~ ~ {Item:{id:"$(id)",count:1b,components:$(components)}}
```

This works because item entity JSON naturally accepts quoted keys.

This is a fundamental limitation with no fix - the `/give` command's NBT syntax and macro JSON unwrapping are incompatible.

## Runtime Item Instance

When player holds an item:
```json
{
  "id": "minecraft:flint_and_steel",
  "components": {
    "custom_data": {
      "randomstuff": 1,
      "id": "flint_and_flint"
    },
    "item_name": {...},
    "max_damage": 12,
    "item_model": "randomstuff:flint_and_flint"
  }
}
```

The `custom_data.id` points to the registry entry.

## Tag System

Tags are stored as scoreboard objectives:
- `randomstuff:tags.knappable_rocks` - rocks that can be knapped
- `randomstuff:tags.knappable_clay` - clay items that can be knapped
- `randomstuff:tags.<material>` - individual material flags

**Checking tags:**
- Does item have score in `tags.knappable_rocks`? → it's knappable
- Get item's `custom_data.id` → use as material key for recipes

## Files Structure

```
data/randomstuff/
  storage/
    items/                    # item registry (key = custom_id)
    registries/               # registry iteration tracking
    tmp/                      # temporary storage for operations
  function/
    items/
      register.mcfunction     # registration function
      get.mcfunction          # get item from registry by custom_id
      actual_get.mcfunction   # performs the item give via summon
      register_test.mcfunction # test item registration
      reset_registry.mcfunction # clears all registered items
      reset_loop.mcfunction   # recursive reset implementation
    load.mcfunction           # calls register for all items
```

## Notes

- Items and knapping are separate systems
- Item registry provides id → vanilla mapping via custom_id key
- `/give` cannot be used for fully dynamic items due to macro unwrapping quoting issue
- Summon item entity is the workaround for giving custom items
- Tags determine what an item CAN do (knappable, pourable, etc.)
- Recipes reference items by their custom id