# check if this furniture should be painted
# @s = player holding paintbrush
# at furniture's interacted interaction entity
# run from interact/paint/detect

# find this furniture's item_display and try to paint it
scoreboard players set $paint_changed gm4_furniture_data 0
execute as @e[type=item_display,tag=gm4_furniture.display,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id store success score $paint_changed gm4_furniture_data run data modify entity @s item.components."minecraft:dyed_color" set from storage gm4_furniture:temp color

# if furniture was painted mark interaction as resolved and play paint sound
execute if score $paint_changed gm4_furniture_data matches 0 run return 1
playsound item.dye.use player @a[distance=..8] ~ ~ ~ 1 1
scoreboard players set $interaction_processed gm4_furniture_data 1
