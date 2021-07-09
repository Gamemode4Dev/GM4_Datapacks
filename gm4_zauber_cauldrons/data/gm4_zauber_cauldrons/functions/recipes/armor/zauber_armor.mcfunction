# @s = boiling zauber cauldron with enchanted prismarine shard inside
# at center of block
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# recipes
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:golden_boots"}}}] run function gm4_zauber_cauldrons:recipes/armor/boots/apply_modifier
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:golden_chestplate"}}}] run function gm4_zauber_cauldrons:recipes/armor/chestplate/apply_modifier
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:golden_helmet"}}}] run function gm4_zauber_cauldrons:recipes/armor/helmet/apply_modifier
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:golden_leggings"}}}] run function gm4_zauber_cauldrons:recipes/armor/leggings/apply_modifier

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 run function gm4_zauber_cauldrons:recipes/armor/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
