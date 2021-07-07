# @s = boiling zauber cauldron with prismarine crystals and golden apple inside
# at @s align xyz
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# set sip level returned when crafting multi-sips
execute if score $has_soul_fire_heatsource gm4_zc_data matches 1.. run data modify storage gm4_zauber_cauldrons:items/templates/multi_sip bottle set value {sips:9b,multi_use:1b}
title @a actionbar ["",{"text":"zauber_potions.mcfunction","color":"gray"}]

# recipes

# drinkable potions
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:potion"}}}] run function gm4_zauber_cauldrons:recipes/potions/drinkable/check_type

# splash potions
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"}}}] run function gm4_zauber_cauldrons:recipes/potions/splash/check_liquid

# lingering potions
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:lingering_potion"}}}] run function gm4_zauber_cauldrons:recipes/potions/lingering/check_liquid


execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{id:"minecraft:splash_potion",Count:1b}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/invalid_potion_type
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{id:"minecraft:lingering_potion",Count:1b}] positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:recipes/potions/invalid_potion_type

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/potions/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
