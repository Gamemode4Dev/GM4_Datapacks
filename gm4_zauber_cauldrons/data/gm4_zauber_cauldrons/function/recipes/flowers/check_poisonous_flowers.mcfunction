# @s = boiling zauber cauldron with grass and enchanted_prismarine_shard inside.
# at center of block
# run from cauldron/recipe_checks

# initialise fake players
scoreboard players set $cancel_recipe gm4_zc_data 0
# set expected fullness for these recipes
scoreboard players operation $expected_item_amount gm4_zc_fullness = $required_flowers gm4_zc_flowers
# add two to expected items (grass and enchanted_prismarine_shard)
scoreboard players add $expected_item_amount gm4_zc_fullness 2

# poisonous flowers set flag to abort recipe checks
for flower_data in ctx.meta['flower_types']:
    execute if score f"${flower_data['flower']}" gm4_zc_flowers matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:flower_data['item_id']}}}}] run scoreboard players set $cancel_recipe gm4_zc_data 1

# recipe
execute if score $cancel_recipe gm4_zc_data matches 0 run function gm4_zauber_cauldrons:recipes/flowers/check_normal_flowers

# effect with poison if poisonous flower in cauldron
execute if score $cancel_recipe gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/flowers/poison

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:cauldron/structure/modify/use_water

# reset fake players
scoreboard players reset $cancel_recipe gm4_zc_data
scoreboard players reset $expected_item_amount gm4_zc_fullness
