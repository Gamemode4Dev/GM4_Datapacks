# @s = boiling zauber cauldron with bottled vex and enchanted_prismarine_shard inside
# at center of block
# run from cauldron/recipe_checks

# initialise fake players
scoreboard players set $cancel_recipe gm4_zc_data 0

# set expected fullness for these recipes (stack chorus+stack popped chorus+enchanted_prismarine_shard+bottled vex)
scoreboard players set $expected_item_amount gm4_zc_fullness 4

# set sip level returned when crafting multi-sips, in case another module messed with these presets
execute if score $has_soul_fire_heatsource gm4_zc_data matches 1.. run data modify storage gm4_zauber_cauldrons:blueprint/item/multi_sip gm4_zauber_cauldrons.bottle set value {sips:9,size:9,multi_use:1b}

# read count from chorus fruit stacks
execute store result score $raw_chorus_fullness gm4_zc_chorus run data get storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{tag:{gm4_zauber_cauldrons:{item:"minecraft:chorus_fruit"}}}].Count 1
execute store result score $popped_chorus_fullness gm4_zc_chorus run data get storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{tag:{gm4_zauber_cauldrons:{item:"minecraft:popped_chorus_fruit"}}}].Count 1

# cancel recipe if one of the ingredients is missing
execute if score $raw_chorus_fullness gm4_zc_chorus matches 0 run scoreboard players set $cancel_recipe gm4_zc_data 2
execute if score $popped_chorus_fullness gm4_zc_chorus matches 0 run scoreboard players set $cancel_recipe gm4_zc_data 2

# check count against seed based count
execute unless score $cancel_recipe gm4_zc_data matches 2 run scoreboard players operation $raw_chorus_fullness gm4_zc_chorus -= $required_chorus_fruit gm4_zc_chorus
execute unless score $cancel_recipe gm4_zc_data matches 2 run scoreboard players operation $popped_chorus_fullness gm4_zc_chorus -= $required_popped_chorus_fruit gm4_zc_chorus

# start incomplete recipe
execute unless score $cancel_recipe gm4_zc_data matches 2 if score $raw_chorus_fullness gm4_zc_chorus matches ..-1 run scoreboard players set $cancel_recipe gm4_zc_data 1
execute unless score $cancel_recipe gm4_zc_data matches 2 if score $popped_chorus_fullness gm4_zc_chorus matches ..-1 run scoreboard players set $cancel_recipe gm4_zc_data 1
execute if score $cancel_recipe gm4_zc_data matches 1 run function gm4_zauber_cauldrons:recipes/chorus/blurry_wormhole

# start complete recipe
execute if score $cancel_recipe gm4_zc_data matches 0 run function gm4_zauber_cauldrons:recipes/chorus/precise_wormhole

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:cauldron/structure/modify/use_water

# reset fake players
scoreboard players reset $cancel_recipe gm4_zc_data
scoreboard players reset $expected_item_amount gm4_zc_fullness
