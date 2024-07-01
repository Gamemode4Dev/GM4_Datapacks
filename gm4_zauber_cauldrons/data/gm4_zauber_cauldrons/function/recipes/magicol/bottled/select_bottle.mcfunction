# @s = magicol zauber cauldron with water bottle and prismarine crystals inside
# at center of block
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# set sip level returned when crafting multi-sips, in case another module messed with these presets
execute if score $has_soul_fire_heatsource gm4_zc_data matches 1.. run data modify storage gm4_zauber_cauldrons:blueprint/item/multi_sip gm4_zauber_cauldrons.bottle set value {sips:9,size:9,multi_use:1b}

# select bottle type
# called functions are generated via beet from templates
# generated with the help of bolt
for bottle_data in ctx.meta['potion_bottles']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:bottle_data['item_id']}}}}] run function f"gm4_zauber_cauldrons:recipes/magicol/bottled/{bottle_data['bottle']}/select_color"

# use water or powder snow and play sound once a recipe ran
execute if score $current gm4_zc_moon_phase = $preferred gm4_zc_moon_phase if score $recipe_success gm4_zc_data matches 1 run function gm4_zauber_cauldrons:recipes/magicol/bottled/use_cauldron

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
