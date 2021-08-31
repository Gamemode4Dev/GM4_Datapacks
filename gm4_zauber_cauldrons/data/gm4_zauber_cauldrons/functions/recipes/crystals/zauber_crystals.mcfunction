# @s = boiling zauber cauldron with sea lantern and nether star inside
# at center of block
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# recipes
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_damage"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/instant_damage
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"instant_health"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/instant_health
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"jump_boost"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/jump_boost
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"poison"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/poison
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"regeneration"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/regeneration
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/speed
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"strength"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/strength

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/crystals/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
