# Selects weather modifier of magicol thrown
# @s = @e[type=marker,tag=gm4_potion_tracker]
# at @s
# run from zauber_cauldrons:bottled_magicol/potion_landed

# check which weather modifier to use
# called functions are generated via beet from templates
# generated with the help of bolt
for modifier_data in ctx.meta['weather_modifiers']:
    execute unless score $selected_color gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/item/bottled_magicol Item.components."minecraft:custom_data".gm4_zauber_cauldrons{weather_modifier:modifier_data['modifier']} align xyz positioned ~.5 ~.5 ~.5 run function f"gm4_zauber_cauldrons:bottled_magicol/{{color}}/{modifier_data['modifier']}"
