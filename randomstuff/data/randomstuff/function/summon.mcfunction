# 1. The Body (Visual)
summon item_display ~ ~ ~ {\
    item: {id: "minecraft:stone", count: 1, components: {\
        item_model: "randomstuff:flint_and_flint"\
    }},\
    transformation: {\
        scale: [0.5f, 0.5f, 0.5f],\
        translation: [0.0f, 0.0f, 0.0f],\
        left_rotation: [0.7071068f, 0.0f, 0.0f, 0.7071068f],\
        right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]\
    },\
    Tags: ["randomstuff", "pebble_display"]\
}

# 2. The Soul (Hitbox & Data)
# Width/Height set to 0.3 so the hitbox matches the rock size!
summon interaction ~ ~ ~ {\
    width: 0.3f,\
    height: 0.2f,\
    response: 1b,\
    data: {\
        randomstuff: {\
            id: "granite_pebble"\
        }\
    },\
    Tags: ["randomstuff", "pebble"]\
}