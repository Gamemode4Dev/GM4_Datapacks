# @s = boiling zauber cauldron with sea lantern and nether star inside
# at @s (center of block)
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# recipes
# the crystals/effects/ functions are generated via beet from templates
# generated with the help of bolt
for effect_data in ctx.meta['crystal_effects']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"potion",type:effect_data['effect']}}}}] run function f"gm4_zauber_cauldrons:recipes/crystals/effects/{effect_data['effect']}"

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/crystals/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
