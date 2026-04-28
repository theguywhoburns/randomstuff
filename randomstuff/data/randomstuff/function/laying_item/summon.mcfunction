# $id = item id
# checks if custom item, branches accordingly

$execute if data storage randomstuff:items $(id) run \
    return run function randomstuff:laying_item/summon_custom with storage randomstuff:items $(id)

$summon item_display ~ ~ ~ {\
    item: {id: "$(id)", count: 1},\
    transformation: {\
        scale: [0.5f, 0.5f, 0.5f],\
        translation: [0.0f, 0.0f, 0.0f],\
        left_rotation: [0.7071068f, 0.0f, 0.0f, 0.7071068f],\
        right_rotation: [0.0f, 0.0f, 0.0f, 1.0f]\
    },\
    Tags: ["randomstuff", "laying_item_display"]\
}

$summon interaction ~ ~ ~ {\
    width: 0.3f,\
    height: 0.2f,\
    response: 1b,\
    Tags: ["randomstuff", "laying_item"],\
    data: {stored_item: {id:"$(id)",count:1b}}\
}