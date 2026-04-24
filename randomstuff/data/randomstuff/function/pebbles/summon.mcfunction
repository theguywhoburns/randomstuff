$summon item_display ~ ~ ~ {\
    item: {id: "minecraft:stone", count: 1, components: {\
        item_model: "$(display_item_id)"\
    }},\
    transformation: {\
        scale: [0.5f, 0.5f, 0.5f],\
        translation: [0.0f, 0.0f, 0.0f],\
        left_rotation: [0.7071068f, 0.0f, 0.0f, 0.7071068f],\
        right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]\
    },\
    Tags: ["randomstuff", "pebble_display"]\
}

$summon interaction ~ ~ ~ {\
    width: 0.3f,\
    height: 0.2f,\
    response: 1b,\
    data: {\
        randomstuff: {\
            id: "$(item_id)"\
        }\
    },\
    Tags: ["randomstuff", "pebble", "$(item_id)"]\
}