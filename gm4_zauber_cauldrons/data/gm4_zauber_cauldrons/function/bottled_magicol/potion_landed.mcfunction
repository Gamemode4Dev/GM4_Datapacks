# Selects color of magicol thrown
# @s = @e[type=marker,tag=gm4_potion_tracker]
# at @s
# run from zauber_cauldrons:soulution/thrown_potion_tracking/verify_potion_nbt

# pull data of thrown potion into storage
data modify storage gm4_zauber_cauldrons:temp/item/bottled_magicol Item set from storage gm4_potion_tracking:temp entity_data.Item

# select color
# called functions are generated via beet from templates
# generated with the help of bolt
for color_data in ctx.meta['magicol_colors']:
    execute unless score $selected_color gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/item/bottled_magicol Item.components."minecraft:custom_data".gm4_zauber_cauldrons{color:color_data['color']} run function f"gm4_zauber_cauldrons:bottled_magicol/{color_data['color']}/select_weather_modifier"

# reset storage and fake players
data remove storage gm4_zauber_cauldrons:temp/item/bottled_magicol Item
scoreboard players reset $selected_color gm4_zc_data
