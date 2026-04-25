# Custom item summon - uses registry context (id, components)
# Entry point: function randomstuff:laying_item/summon { "item_id": "flint_and_flint" }
# Registry lookup happens via with storage randomstuff:items.<item_id>
say AYO
$summon item_display ~ ~ ~ {\
    item: {\
        id: "$(id)",\
        count: 1b,\
        components: $(components)\
    },\
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
    data: {stored_item: {id:"$(id)",count:1b,components:$(components)}}\
}