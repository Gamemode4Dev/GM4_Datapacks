# @s = boiling zauber cauldron with enchanted prismarine shard & magic in a bottle inside
# at @s (center of block)
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# recipes
# called functions are generated via beet from templates
# generated with the help of bolt
for color_data in ctx.meta['magicol_colors']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:color_data['ingredient_item_id']}}}}] run function f"gm4_zauber_cauldrons:recipes/magicol/{color_data['color']}"

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 run function gm4_zauber_cauldrons:recipes/magicol/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
