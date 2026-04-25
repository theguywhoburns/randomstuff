# Minecraft Data Pack Documentation

This document covers essential topics for creating Minecraft 1.20+ data packs, with code examples from actual data pack syntax.

---

## 1. Data Pack Structure

### Folder Hierarchy

Data packs use a strict folder hierarchy under `data/<namespace>/`:

```
randomstuff/
├── pack.mcmeta                    # Pack metadata
└── data/
    ├── randomstuff/
    │   ├── function/
    │   │   ├── load.mcfunction    # Runs on pack load
    │   │   ├── tick.mcfunction    # Runs every tick
    │   │   ├── knapping/
    │   │   │   └── grid/
    │   │   │       └── summon_grid.mcfunction
    │   │   ├── items/
    │   │   │   ├── register_item.mcfunction
    │   │   │   └── reset_loop.mcfunction
    │   │   └── laying_item/
    │   │       └── break.mcfunction
    │   ├── recipe/
    │   │   └── flint_pickaxe.json
    │   └── tags/
    │       ├── block/
    │       │   └── pebble_safe.json
    │       └── function/
    │           ├── load.json        # Functions to run on load
    │           └── tick.json      # Functions to run every tick
    └── minecraft/
        └── tags/
            └── function/
                ├── load.json
                └── tick.json
```

### pack.mcmeta Format

```json
{
    "pack": {
        "min_format": 34,
        "max_format": 34,
        "description": "Pack description"
    }
}
```

- `min_format`/`max_format`: Data pack format version (34 = 1.20.2, 48 = 1.21+)
- `pack_format` in zip must match the version shown on world creation

### How Functions Are Loaded

Functions execute via:

1. **Load tag** (`data/<namespace>/tags/function/load.json`):
```json
{
    "values": ["randomstuff:load"]
}
```
Runs once when data pack loads.

2. **Tick tag** (`data/<namespace>/tags/function/tick.json`):
```json
{
    "values": ["randomstuff:tick"]
}
```
Runs every game tick (20 times/second).

3. **Direct invocation** via command:
```
/function randomstuff:knapping/grid/summon_grid
```

4. **Recursive call** from another function:
```mcfunction
execute if score <player> <objective> matches 1.. run function namespace:func_name
```

---

## 2. Function Syntax

### Basic .mcfunction File Format

Each line is a Minecraft command. No semicolons needed:

```mcfunction
# This is a comment
scoreboard objectives add myscore dummy
scoreboard players set @p myscore 10
tellraw @p [{"text":"Score: ","color":"gray"},{"score":{"name":"@p","objective":"myscore"}}]
```

### Comments

Comments use `#` at line start:

```mcfunction
# Initialize scoreboard
scoreboard objectives add coins dummy

# Give starting items
give @p minecraft:diamond_sword
```

### Command Chaining

Commands chain via `execute`, each running in sequence:

```mcfunction
# Chain: change executor context, then execute multiple commands
execute as @e[type=minecraft:bee,tag=grid_bee,limit=1] at @s run summon minecraft:block_display ~ ~0.5 ~ {Tags:["grid_disp"]}
```

---

## 3. Execute Command Patterns

The `execute` command is the foundation of complex data pack logic.

### execute at <entity>

Runs commands at the entity's position (origin moves to entity location):

```mcfunction
# Spawn display at bee's location
execute as @e[type=minecraft:bee,tag=grid_bee,limit=1] at @s run summon minecraft:block_display ~ ~ ~ {Tags:["my_display"]}
```

The `at` modifier changes execution position without changing executor identity.

### execute as <entity>

Runs commands as the entity (executor identity changes to target):

```mcfunction
# Get score as the bee entity
execute store result score @s myscore as @e[type=minecraft:bee,tag=grid_bee,limit=1] run scoreboard players get @s myscore
```

The `as` modifier changes executor identity but keeps origin position.

### Combining as and at

```mcfunction
# Execute AS entity X, AT entity Y's position
execute as @e[type=minecraft:bee,tag=anchor] at @e[type=minecraft:bee,tag=target] run tp @s ~ ~ ~

# Execute at entity position, but run as player
execute as @p at @e[type=minecraft:marker,limit=1] run data modify storage ...
```

### Relative Coordinates

- `~` - current position
- `~N` - offset by N from current position
- `^ ^ ^N` - relative to facing direction (local coordinates)

```mcfunction
# Absolute position (world coordinates)
summon minecraft:block_display 10 64 10 {...}

# Relative to execution position
summon minecraft:block_display ~5 ~ ~ {...}

# Local coordinates (relative to facing direction)
# ^ (right), ^ ^ (forward), ^ ^ ^5 (5 blocks forward)
execute at @s run tp @s ^ ^ ^5
```

### positioned Modifier

Move execution origin to specific coordinates:

```mcfunction
# Execute at positioned coordinates
execute positioned 10 64 10 run summon minecraft:marker ~ ~ ~ {Tags:["marker"]}

# Execute at entity position
execute positioned as @e[type=minecraft:marker,limit=1] run setblock ~ ~ ~ minecraft:diamond_block

# Execute at stored coordinates from storage
execute positioned 0 0 0 store result storage mypack:data x int 1 run data get storage mypack:data pos[0]
```

---

## 4. Scoreboard Operations

### Creating Objectives

```mcfunction
# Create a dummy scoreboard (no player can increase it naturally)
scoreboard objectives add myscore dummy "My Score"

# Create trigger for player interaction
scoreboard objectives add mytrigger trigger

# Create death count
scoreboard objectives add deaths deathCount
```

### Setting/Getting Values

```mcfunction
# Set score directly
scoreboard players set @p myscore 10

# Add to score
scoreboard players add @p myscore 5

# Subtract from score
scoreboard players remove @p myscore 3

# Get score (store in command result)
execute store result score @s myscore run scoreboard players get @p myscore
```

### Math Operations

```mcfunction
# Add
scoreboard players operation @s myscore += @s other_score

# Subtract
scoreboard players operation @s myscore -= @s other_score

# Multiply
scoreboard players operation @s myscore *= @s multiplier

# Divide
scoreboard players operation @s myscore /= @s divisor

# Modulo (remainder)
scoreboard players operation @s myscore %= @s modulo

# Assign (copy)
scoreboard players operation @s myscore = @s other_score
```

### Fake Players

Fake players are scoreboard holders that don't correspond to entities:

```mcfunction
# Use # prefix for constants/config values
scoreboard players set #config max_items 64

# Use $ prefix in function macros (1.20.2+)
scoreboard players set $iteration mycounter 0

# Use arbitrary names
scoreboard players set GlobalVar myscore 100

# Check value matching
execute if score GlobalVar myscore matches 50..100 run tellraw @p {"text":"OK"}
execute if score @s myscore matches 5 run function ns:loop_continue
```

Example from codebase:
```mcfunction
execute store result score @s rs.knapping.grid.x run data get entity @s Pos[0] 1
execute store result entity @e[type=minecraft:bee,limit=1,sort=nearest,tag=grid_bee] Pos[0] double 1 run scoreboard players get @s rs.knapping.grid.x
```

---

## 5. Function Recursion

Functions can call themselves for loops/iteration.

### Basic Recursive Loop Pattern

```mcfunction
# loop.mcfunction
# Decrement counter and call self until counter reaches 0

# Base case: stop if counter is 0 or less
execute unless score @s loop_count matches 1.. run return 1

# Do work here
tellraw @p [{"text":"Iteration: ","color":"gray"},{"score":{"name":"@s","objective":"loop_count"}}]

# Decrement counter
scoreboard players remove @s loop_count 1

# Recursive call - function calls itself
function namespace:loop
```

### With execute if score matches

```mcfunction
# Recursive function with base case
execute if score @s timer matches 1.. run function namespace:countdown

# countdown.mcfunction
scoreboard players remove @s timer 1
execute if score @s timer matches 1.. run function namespace:countdown
```

### Iterating Over Data (Storage Array)

```mcfunction
# process_array.mcfunction
# Process items in storage array one by one

# Check if array has items
execute if data storage mypack:items array[-1] run function mypack:process_item

# process_item.mcfunction
$data get storage mypack:items array[-1]
# Do something with item...
data remove storage mypack:items array[-1]

# Recursive call
execute if data storage mypack:items array[-1] run function mypack:process_item
```

Example from codebase - `randomstuff:items/reset_loop.mcfunction`:
```mcfunction
data remove storage randomstuff:registries.items array[-1]
execute if data storage randomstuff:registries.items array[-1] run function randomstuff:items/reset_loop with storage randomstuff:registries.items array[-1]
```

---

## 6. Relative Teleportation

### Move Forward in Facing Direction

`tp @s ^ ^ ^N` teleports N blocks in the direction the executor is facing:

```mcfunction
# Move 3 blocks forward
tp @s ^ ^ ^3

# Move 5 blocks forward (combined with execute)
execute as @e[type=minecraft:bee,tag=anchor] at @s run tp @s ^ ^ ^5
```

### Move Up in World Coordinates

```mcfunction
# Move 5 blocks up (ignores facing direction)
tp @s ~ ~5 ~

# Move 1 block down
tp @s ~ ~-1 ~
```

### Combining with execute at

```mcfunction
# Spawn projectile at player, move forward
execute as @p at @s run summon minecraft:snowball ^ ^ ^1 {Tags:["projectile"]}

# Move all bees forward 1 block
execute as @e[type=minecraft:bee,tag=grid_bee] at @s run tp @s ^ ^ ^1

# Teleport to calculated position
execute as @e[type=minecraft:bee,tag=anchor] at @s run summon minecraft:block_display ~0.5 ~ ~0.5 {...}
```

From codebase example - relative offsets:
```mcfunction
execute as @e[type=minecraft:bee,tag=grid_bee,limit=1] at @s run summon minecraft:block_display ~0.0625 ~ ~0.0625 {Tags:["grid_disp"]}
```

---

## 7. Entity Summoning

### summon Command

```mcfunction
# Basic summon
summon minecraft:zombie ~ ~ ~ {CustomName:'{"text":"Zombie"}'}

# Summon with tags
summon minecraft:marker ~ ~ ~ {Tags:["my_marker","anchor"]}

# Summon with NBT data
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b}
```

### Tags for Tracking

Tags identify entities for later targeting:

```mcfunction
# Tag on summon
summon minecraft:bee ~ ~ ~ {Tags:["grid_bee","anchor"]}

# Add tag to existing entity
tag @e[type=minecraft:bee,limit=1] add my_tag

# Remove tag
tag @e[type=minecraft:bee] remove grid_bee

# Check for tag in selector
execute as @e[type=minecraft:bee,tag=grid_bee] at @s run ...
```

### block_display Entities

`block_display` entities render blocks visually without physical presence (1.20+):

```mcfunction
# Summon block display (renders as block)
summon minecraft:block_display ~ ~ ~ {block_state:{Name:"minecraft:oak_planks"},transformation:{...}}

# With scale and position
summon minecraft:block_display ~0.5 ~ ~0.5 {
    block_state:{Name:"minecraft:mossy_stone_bricks"},
    Tags:["grid_disp"],
    transformation:{translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.175f,0.175f,0.175f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}
}
```

Real example from codebase:
```mcfunction
execute as @e[type=minecraft:bee,tag=grid_bee,limit=1] at @s run summon minecraft:block_display ~0.0625 ~ ~0.0625 {Tags:["grid_disp"],block_state:{Name:"minecraft:mossy_stone_bricks"},transformation:{translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.175f,0.175f,0.175f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
```

Other display entities:
- `item_display` - renders items
- `text_display` - renders text

---

## 8. Function Macros (1.20.2+)

Function macros allow parameter passing via storage and `$` variables.

### $variable Syntax

```mcfunction
# In calling function - pass variables with $ prefix
$function namespace:my_func with storage mypack:data {param1:"$(value1)",param2:$(value2)}

# In called function - access via $(variable)
$tellraw @p [{"text":"Value: ","color":"gray"},{"text":"$(myval)","color":"yellow"}]
$data modify storage mypack:result set value $(output)
```

### Using storage for Parameters

From codebase - `randomstuff:items/register_item.mcfunction`:
```mcfunction
# $id = item id
# $components = item components json
# Stores item data and adds id to registry

$data modify storage randomstuff:items $(custom_id) set value {id:"$(id)",components:$(components),fields:$(fields),custom_id:$(custom_id)}
$data modify storage randomstuff:registries.items array append value {entry:"$(custom_id)"}
```

### Calling with storage Context

```mcfunction
# Pass entire storage context to function
function namespace:process with storage mypack:work_queue[-1]

# Access in called function
$data get storage randomstuff:work_queue[-1]
execute store result score @s temp run data get storage randomstuff:work_queue[-1].count
```

Example from codebase - `randomstuff:items/reset_loop.mcfunction`:
```mcfunction
execute if data storage randomstuff:registries.items array[-1] run function randomstuff:items/reset_loop with storage randomstuff:registries.items array[-1]

$tellraw @s [\
    {"text":"[", "color": "gray"},\
    {"text":"randomstuff:items/reset_loop", "color": "yellow"},\
    {"text":"]: ", "color": "gray"},\
    {"translate": "randomstuff.item.removed",\
        "with": ["$(entry)"], "color": "red"}\
    }\
]
```

### Complete Macro Example

```mcfunction
# setup.mcfunction - sets up items with macros
$data modify storage mypack:register append value {id:"minecraft:diamond",custom_id:"diamond_sword"}
function mypack:register_item with storage mypack:register[-1]

# register_item.mcfunction - the macro function
$data modify storage mypack:saved $(custom_id) set value {item_id:"$(id)",display:"$(display_name)"}
tellraw @s [{"text":"Registered: ","color":"gray"},{"text":"$(custom_id)","color":"green"}]
```

---

## Additional Reference

### Common Data Pack Files

- `data/<namespace>/tags/function/load.json` - Load functions
- `data/<namespace>/tags/function/tick.json` - Tick functions  
- `data/<namespace>/recipe/<recipe_id>.json` - Recipes
- `data/<namespace>/advancement/<id>.json` - Advancements
- `data/<namespace>/loot_table/<id>.json` - Loot tables

### Useful Commands

```mcfunction
# Debug
tellraw @p [{"text":"Debug","color":"red"}]
execute as @p run tellraw @a [{"score":{"name":"@s","objective":"myscore"}}]

# Conditional execution
execute if entity @e[type=minecraft:bee,tag=my_tag] run ...
execute unless block ~ ~ ~ minecraft:air run ...

# Storage manipulation
data get storage namespace:path
data modify storage namespace:path set value {...}
data modify storage namespace:path append {...}
data modify storage namespace:path insert 0 {...}
```

---

## Version Compatibility

| Version | Format | Features |
|---------|--------|----------|
| 1.20.2  | 34     | Function macros ($) |
| 1.20.5 | 40     | Improved display entities |
| 1.21   | 48     | New particle commands |

Set `pack.mcmeta` format to match your target version.