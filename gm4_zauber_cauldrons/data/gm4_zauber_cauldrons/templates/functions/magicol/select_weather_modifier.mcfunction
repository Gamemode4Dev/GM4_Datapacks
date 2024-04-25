# @s = heated magicol zauber cauldron with bottled magicol recipe inside
# at @s (center of block)
# run from recipes/magicol/bottled/select_bottle

# templates/functions/magicol/select_weather_modifier.mcfunction

# check which weather modifier to use
# called functions are generated via beet from templates
# generated with the help of bolt
for modifier_data in ctx.meta['weather_modifiers']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:modifier_data['item_id']}}}}] run function f"gm4_zauber_cauldrons:recipes/magicol/bottled/{{bottle}}/{{color}}/{modifier_data['modifier']}"
