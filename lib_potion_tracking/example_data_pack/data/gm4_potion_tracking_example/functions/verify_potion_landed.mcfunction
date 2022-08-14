# demonstrate use of performing an action upon a custom potion landing
# example: invisibility potions will turn item frames invisible

execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{Potion:"minecraft:invisibility"} as @e[type=item_frame,distance=..2] run data merge entity @s {Invisible:1b}
