# @s = boiling zauber cauldron with sea lantern and nether star inside
# at center of block
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# recipes
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{StoredEnchantments:[{id:"minecraft:fire_protection",lvl:4s}],gm4_zauber_cauldrons:{item:"minecraft:enchanted_book"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/fire_resistance
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{StoredEnchantments:[{id:"minecraft:protection",lvl:4s}],gm4_zauber_cauldrons:{item:"minecraft:enchanted_book"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/regeneration
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{StoredEnchantments:[{id:"minecraft:blast_protection",lvl:4s}],gm4_zauber_cauldrons:{item:"minecraft:enchanted_book"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/resistance
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{StoredEnchantments:[{id:"minecraft:projectile_protection",lvl:4s}],gm4_zauber_cauldrons:{item:"minecraft:enchanted_book"}}}] run function gm4_zauber_cauldrons:recipes/crystals/effects/speed

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/crystals/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
