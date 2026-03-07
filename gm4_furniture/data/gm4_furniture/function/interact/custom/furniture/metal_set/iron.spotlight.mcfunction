# process spotlight right click event
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

execute store success score $lit gm4_furniture_data run data modify entity @s item.components."minecraft:custom_data".gm4_furniture.lit set value 0
playsound block.dispenser.fail block @a[distance=..16]

# turn off
execute if score $lit gm4_furniture_data matches 1 as @e[type=item_display,tag=gm4_furniture.display_2,distance=..1] if score @s gm4_furniture_id = $check_id gm4_furniture_id run data modify entity @s item.components."minecraft:item_model" set value "gm4_furniture:metal_set/iron/spotlight/off/lamp"
execute if score $lit gm4_furniture_data matches 1 as @e[type=item_display,tag=gm4_furniture.display_3,distance=..1] if score @s gm4_furniture_id = $check_id gm4_furniture_id run data modify entity @s item.components."minecraft:item_model" set value "gm4_furniture:metal_set/iron/spotlight/off/beam"
execute if score $lit gm4_furniture_data matches 1 run return 0

# turn on
data modify entity @s item.components."minecraft:custom_data".gm4_furniture.lit set value 1
execute as @e[type=item_display,tag=gm4_furniture.display_2,distance=..1] if score @s gm4_furniture_id = $check_id gm4_furniture_id run data modify entity @s item.components."minecraft:item_model" set value "gm4_furniture:metal_set/iron/spotlight/default/lamp"
execute as @e[type=item_display,tag=gm4_furniture.display_3,distance=..1] if score @s gm4_furniture_id = $check_id gm4_furniture_id run data modify entity @s item.components."minecraft:item_model" set value "gm4_furniture:metal_set/iron/spotlight/default/beam"
