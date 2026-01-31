# run from liquid_tanks:smart_item_drain and smart_item_fill
# @s = processing tank

# merge count from input and set to tank
item_modifier gm4_liquid_tanks:apply_output_count:
    function: "minecraft:set_count"
    count:
        type: "minecraft:score"
        target: 
            type: "minecraft:fixed"
            name: "$stack_size"
        score: "gm4_lt_value"

item replace block ~ ~ ~ container.0 from entity 344d47-4-4-4-f04ce104d weapon.mainhand gm4_liquid_tanks:apply_output_count
item replace entity 344d47-4-4-4-f04ce104d weapon.mainhand with air

# apply value delta
scoreboard players operation @s gm4_lt_value += $stack_value gm4_lt_value

# record success
scoreboard players set $smart_success gm4_lt_value 1
