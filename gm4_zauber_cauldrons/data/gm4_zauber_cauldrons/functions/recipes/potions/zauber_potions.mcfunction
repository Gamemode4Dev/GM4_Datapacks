# @s = boiling zauber cauldron with prismarine crystals and golden apple inside
# at @s align xyz
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# set sip level returned when crafting multi-sips, in case another module messed with these presets
execute if score $has_soul_fire_heatsource gm4_zc_data matches 1.. run data modify storage gm4_zauber_cauldrons:blueprint/item/multi_sip gm4_zauber_cauldrons.bottle set value {sips:19,size:19,multi_use:1b}

# recipes

# drinkable potions
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:potion"}}}] run function gm4_zauber_cauldrons:recipes/potions/drinkable/check_type

# splash potions
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"}}}] run function gm4_zauber_cauldrons:recipes/potions/splash/check_liquid

# lingering potions
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:lingering_potion"}}}] run function gm4_zauber_cauldrons:recipes/potions/lingering/check_liquid

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/potions/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
